# 3 Node HPC Cluster Setup using CentOS 9 and OpenMPI

This guide helps you set up a 3-node High Performance Computing (HPC) cluster using OpenMPI on CentOS 9.

## Requirements
- VMWare with CentOS 9 installed
- Network connectivity among 3 cloned VMs

## Steps

### 1. Base VM Setup
Run `install.sh` as root on the base VM to install required packages and setup environment.

### 2. Clone VMs
Clone the base VM to create `node1` and `node2`. Set hostnames accordingly:


sudo hostnamectl set-hostname master<br>
sudo hostnamectl set-hostname node1<br>
sudo hostnamectl set-hostname node2<br>


### 3. Update `/etc/hosts` on all nodes with:

IP1  master <br>
IP2  node1  <br>
IP3  node2  <br>


### 4. Setup Passwordless SSH from master to nodes

ssh-keygen<br>
ssh-copy-id user@node1<br>
ssh-copy-id user@node2<br>


### 5. Setup NFS (Master)
Run `nfs_setup.sh` on master.

### 6. Setup AutoFS (Nodes)
Run `autofs_client.sh` on node1 and node2.

### 7. Compile & Run
From master, in `/nfs/prog`:
```bash
mpicc -o hello hello.c
mpirun --machinefile machinefile ./hello
