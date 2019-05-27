#!/usr/env/bin bash
# Installs mysql
# useage: provision.sh [mysql_version]

apt-get clean
apt-get update

# Install mysql
export DEBIAN_FRONTEND=noninteractive
if [ "$1" == "auto" ] || [ "$1" == "" ]; then
    apt-get install -y mysql-server
else
    apt-get install -y mysql-server=$1
fi

apt-get autoremove -y
apt-get clean

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Zero out the free space to save space in the final image:
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
