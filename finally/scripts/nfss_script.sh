#!/bin/bash

# Install nfs-utils package
yum install -y nfs-utils
# Enable Firewall daemon
systemctl enable firewalld --now
# Add NFS rule for Firewall
firewall-cmd --add-service="nfs3" \
> --add-service="rpc-bind" \
> --add-service="mountd" \
> --permanent
# Reload Firewall daemon configuration
firewall-cmd --reload
# Enable NFS daemon
systemctl enable nfs --now
# Create directory for NFS server
mkdir -p /srv/NFS_share/upload
# Change owner for directory
chown -R nfsnobody:nfsnobody /srv/NFS_share/
# Change permissions for directory
chmod 0777 /srv/NFS_share/upload/
# Add directory to exports file
cat << EOF > /etc/exports
/srv/NFS_share 192.168.50.11/32(rw,sync,root_squash)
EOF
# Export directory
exportfs -r

echo "Success server configuration!"