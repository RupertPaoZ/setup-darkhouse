#!/bin/sh
SERVER_IP=${1:-172.27.2.100}

apt install nis -y

echo "nis.darkhouse" > /etc/defaultdomain
echo "ypserver $SERVER_IP" >> /etc/yp.conf

echo "# /etc/nsswitch.conf
#
# Example configuration of GNU Name Service Switch functionality.
# If you have the \`glibc-doc-reference' and \`info' packages installed, try:
# \`info libc \"Name Service Switch\"' for information about this file.

passwd:         files systemd nis
group:          files systemd nis
shadow:         files nis
gshadow:        files

hosts:          files dns nis

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis" > /etc/nsswitch.conf

echo "+::::::" >> /etc/passwd
echo "+::::::::" >> /etc/shadow
echo "+:::" >> /etc/group
echo "+:::" >> /etc/gshadow

systemctl restart rpcbind nscd ypbind
systemctl enable rpcbind nscd ypbind
