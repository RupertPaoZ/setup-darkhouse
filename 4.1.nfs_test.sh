#!/bin/sh
[ ! -f ./nfs_test ] && dd if=/dev/urandom of=nfs_test bs=1G count=5 # about 13s
fio -filename=./nfs_test -direct=1 -iodepth 256 -thread -ioengine=libaio -bs=128k -size=5G -numjobs=4 -runtime=60 -group_reporting -name=nfs_test
# iotop
# iftop -i ibs5
