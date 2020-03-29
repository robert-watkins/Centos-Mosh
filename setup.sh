#!/bin/bash 
# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo Installing Mosh...
dnf install epel-release -yq
dnf install mosh -yq
firewall-cmd --zone=public --permanent --add-port=60000-61000/udp
for user in /home/*/; do 
    echo "LANG=\"en_US.UTF-8\"" >> $user/.bashrc
    echo "export LANG" >> $user/.bashrc
done
echo Done
systemctl reload firewalld
exit 0
