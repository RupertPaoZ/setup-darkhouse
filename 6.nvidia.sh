#!/bin/sh
# https://jia.je/software/2022/07/06/install-nvidia-cuda/

sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
# sudo apt-get purge nvidia* libnvidia*
# sudo apt install nvidia-driver-535=535.86.10-0ubuntu1
sudo apt install nvidia-driver-535=535.104.05-0ubuntu1
echo "please reboot"
sudo reboot -n

# keep the driver version in consistent
sudo apt-mark hold cuda-drivers nvidia-modprobe libxnvctrl0 libnvidia-cfg1-535 libnvidia-common-535 libnvidia-compute-535 libnvidia-decode-535 libnvidia-encode-535 libnvidia-extra-535 libnvidia-fbc1-535 libnvidia-gl-535 nvidia-compute-utils-535 nvidia-dkms-535 nvidia-driver-535 nvidia-kernel-common-535 nvidia-kernel-source-535 nvidia-prime nvidia-settings nvidia-utils-535 xserver-xorg-video-nvidia-535
# sudo apt-mark unhold cuda-drivers nvidia-modprobe libxnvctrl0 libnvidia-cfg1-535 libnvidia-common-535 libnvidia-compute-535 libnvidia-decode-535 libnvidia-encode-535 libnvidia-extra-535 libnvidia-fbc1-535 libnvidia-gl-535 nvidia-compute-utils-535 nvidia-dkms-535 nvidia-driver-535 nvidia-kernel-common-535 nvidia-kernel-source-535 nvidia-prime nvidia-settings nvidia-utils-535 xserver-xorg-video-nvidia-535
# sudo apt-mark hold linux-generic linux-image-generic linux-headers-generic

# config docker's gpu 
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
# docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
sudo apt autoremove
