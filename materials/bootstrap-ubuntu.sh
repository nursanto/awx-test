#!/bin/bash

# Enable ssh password authentication
echo "[TASK 1] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Add user plowoh 
echo "[TASK 2] Add user plowoh"
useradd -s /bin/bash -d /home/plowoh/ -m  plowoh >/dev/null 2>&1

# Set password plowoh
echo "[TASK 3] set user plowoh"
echo "plowoh:password" | chpasswd  >/dev/null 2>&1

# add plowoh to sudoers
echo "[TASK 4] add user plowoh to sudoers"
echo "plowoh  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/plowoh
chmod 440 /etc/sudoers.d/plowoh

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc
