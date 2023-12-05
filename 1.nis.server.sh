#!/bin/sh
SERVER_IP=${1:-172.27.2.100}

apt install nis -y

sed -i "s/127.0.1.1/$SERVER_IP/g" /etc/hosts
echo "nis.darkhouse" > /etc/defaultdomain

systemctl restart rpcbind ypserv yppasswdd ypxfrd
systemctl enable rpcbind ypserv yppasswdd ypxfrd

/usr/lib/yp/ypinit -m

systemctl restart ypxfrd.service
