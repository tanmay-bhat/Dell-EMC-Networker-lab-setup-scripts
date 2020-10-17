#!/bin/bash

#create swap file using dd command
echo "##############starting the script#########################\n"
echo "\n"
echo "Creating 2GB swap file under /mnt/swapfile \n"
fallocate --length 2GiB /mnt/swapfile

#change permission to 600 of swap file
echo "changing the permission to 600 of swap file \n"
chmod 600 /mnt/swapfile

#create swalp fiel using
echo "makign the swap file............\n"
mkswap /mnt/swapfile

#enable swap file
echo "enabling swap file..............\n"
swapon /mnt/swapfile

#enable swap at start up
echo "enabling swap at start up..........\n"
 echo "/mnt/swapfile swap swap defaults 0 0" >> /etc/fstab

echo "changing swappiness to 65 (default is 60)..................\n"
echo "vm.swappiness=65" >>/etc/sysctl.conf

echo "checking swap memory created..............\n"
free -h
