#!/bin/bash 
# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo Installing Mosh...
dnf install epel-release -yq
dnf install mosh -yq
iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
service iptables save
for user in /home/*/; do 
    echo "LANG=\"en_US.UTF-8\"" >> /home/$user/.bashrc
    echo "export LANG" >> /home/$user/.bashrc
done
echo Done
