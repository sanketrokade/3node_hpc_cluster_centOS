#!/bin/bash
# Run on node1 and node2
sudo mkdir -p /nfs
echo "/nfs /etc/auto.nfs" | sudo tee -a /etc/auto.master
echo "prog -rw master:/nfs/prog" | sudo tee /etc/auto.nfs
sudo systemctl enable --now autofs
