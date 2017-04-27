#! /bin/bash

check(){
	if [ $? -ne 0 ]
	then
		exit
	fi
}

echo "Starting installation..."
echo "Downloading package and installation..."

yum install -y nfs-utils
check
echo "Installation finished."

echo "Do some configuration..."
echo "/mnt *(rw,sync)" > /etc/exports

chmod 777 /mnt

echo "Completation."
