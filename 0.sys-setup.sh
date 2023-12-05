#!/bin/sh
# echo 'ALWAYS_SET_PATH yes' >> /etc/login.defs # `su` overrides PATH with /bin:/sbin...

# mkdir -p /var/log/journal
# systemd-tmpfiles --create --prefix /var/log/journal

# echo '#!/bin/sh
# export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"' > /etc/profile.d/sbin.sh

echo '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.zju.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.zju.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.zju.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.zju.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.zju.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.zju.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.zju.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb-src https://mirrors.zju.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# 预发布软件源，不建议启用
# deb https://mirrors.zju.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.zju.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
' > /etc/apt/sources.list

apt update
apt upgrade

apt install -y apt-transport-https ca-certificates build-essential sudo vim htop git tmux procps curl numactl iftop iotop ipmitool zip pigz zsh
