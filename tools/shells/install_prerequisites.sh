#!/bin/bash

# Check OS requirements
which sudo > tmp.log 2>&1
if [ $? != 0 ]
then
	echo Your system does not support sudo
	exit
fi

which apt-get > tmp.log 2>&1
if [ $? != 0 ]
then
	echo Your system does not support apt-get
	exit
fi

if [ `whoami` != "root" ]
then
	echo You must run this script with root privileges
	exit
fi

rm tmp.log

# CURL
apt-get install curl -y

# VIM
apt-get install vim -y

# Tree
apt-get install tree -y

# Xclip
apt-get install xclip -y

# Git
apt-get install git -y

# Shell
apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Visual Studio Code
apt-get install code -y

# Docker
apt-get install docker -y

sudo groupadd docker

usermod -aG docker $USER

newgrp docker 

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# GitHub Desktop
apt-get install snapd -y

apt-get install glib2.0 -y

snap install github-desktop --beta --classic

# Update
apt-get update