#! /bin/sh
useradd -s /bin/bash -m ubuntu
echo "ubuntu   ALL=(ALL)        NOPASSWD:ALL" | tee -a /etc/sudoers
mkdir /home/ubuntu/.ssh
touch /home/ubuntu/.ssh/authorized_keys
echo "${ssh_key}" | tee -a /home/ubuntu/.ssh/authorized_keys
