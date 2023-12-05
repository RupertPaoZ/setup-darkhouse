#!/bin/sh
SUBNET=${1:-172.27.0.0/16}
apt -y install nfs-kernel-server nfs-common

mkdir /shared

echo "/shared    $SUBNET(rw,async,no_root_squash)
/opt    $SUBNET(rw,async,no_root_squash)
/nfs    $SUBNET(rw,async,no_root_squash)
/mnt    $SUBNET(rw,async,no_root_squash,crossmnt)
/home   $SUBNET(rw,async,no_root_squash)" >> /etc/exports

systemctl restart nfs-kernel-server

# systemctl start nfs-server
# systemctl enable nfs-server
# systemctl status nfs-server

# echo "[Unit]
# Description=restart opensm
# #After=network.target
# Requires=opensm.service
# After=network-online.target

# [Service]
# Type=oneshot
# ExecStartPre=sleep 1m
# ExecStart=systemctl restart opensm

# [Install]
# WantedBy=multi-user.target" > /etc/systemd/system/ib_init.service

# systemctl enable ib_init

# exportfs -a
