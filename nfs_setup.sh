#!/bin/bash
# Run on master node
sudo mkdir -p /nfs/prog
sudo chown $USER /nfs/prog
echo "/nfs *(rw,sync,no_root_squash)" | sudo tee -a /etc/exports
sudo systemctl enable --now nfs-server rpcbind
showmount -e localhost
