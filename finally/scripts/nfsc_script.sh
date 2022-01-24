#!/bin/bash

# Install nfs-utils package
yum install -y nfs-utils
# Enable Firewall daemon
systemctl enable firewalld --now
# Create directory for mount NFS server directory
mkdir -p /mnt/NFS_share
# Add fstab row for automount NFS server directory
echo "192.168.50.10:/srv/NFS_share/ /mnt/NFS_share nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
# Reload daemon configuration
systemctl daemon-reload
# Restart remote-fs daemon
systemctl restart remote-fs.target

echo "Success client configuration!"