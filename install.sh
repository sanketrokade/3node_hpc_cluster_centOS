#!/bin/bash
# Run as root on base VM
yum update -y
yum install -y nfs-utils openmpi openmpi-devel autofs epel-release
systemctl stop firewalld
systemctl disable firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
echo "$USER    ALL=(ALL)      NOPASSWD:ALL" >> /etc/sudoers
echo 'PATH=$PATH:/usr/lib64/openmpi/bin' >> /home/$USER/.bashrc
