#!/bin/sh
SERVER_IP=${1:-172.27.3.100} # ipoib addr. if use eth, please remove opensm related things in nfs-mount.service

apt install nfs-common -y
cd /
mv /opt /opt.bak
mv /home /home.bak
usermod -d /home.bak/darkhouse darkhouse
mkdir opt
mkdir shared
mkdir home
mkdir nfs
echo "$SERVER_IP:/opt /opt nfs defaults,user,exec,_netdev,x-systemd.after=network-online.target,x-systemd.requires=network-online.target 0 0
$SERVER_IP:/mnt /mnt nfs defaults,user,exec,_netdev,x-systemd.after=network-online.target,x-systemd.requires=network-online.target 0 0
$SERVER_IP:/shared /shared nfs defaults,user,exec,_netdev,x-systemd.after=network-online.target,x-systemd.requires=network-online.target 0 0
$SERVER_IP:/home /home nfs defaults,user,exec,_netdev,x-systemd.after=network-online.target,x-systemd.requires=network-online.target 0 0" >> /etc/fstab

echo "[Unit]
Description=mount -a
#After=network.target
Requires=opensm.service
After=network-online.target

[Service]
Type=oneshot
ExecStartPre=sleep 1m
ExecStart=systemctl restart opensm
ExecStartPost=mount -a

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/nfs-mount.service

systemctl enable nfs-mount

mount -a

apt install -y fio

echo "Please reboot!"
