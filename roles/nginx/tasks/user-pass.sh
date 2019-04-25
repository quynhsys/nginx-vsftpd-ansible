#! /bin/bash

#echo -n " username = "
#read username

#echo -n " password = "
#read password

#NGINX_RELEASE_VERSION="1.14.0"
#USER="$username"
#PASSWORD="$password"

useradd $USER
echo "$PASSWORD" | passwd --stdin $USER

if [ ! -d /home/$USER ]; then
mkdir /home/$USER
fi


