#!/bin/sh

apt-add-repository ppa:ansible/ansible
apt update
apt install ansible
nano /etc/ansible/hosts