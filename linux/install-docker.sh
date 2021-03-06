#!/bin/bash

# setup docker-ce
sudo apt install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# setup docker-compose
sudo apt install -y docker-compose
sudo groupadd docker
sudo gpasswd -a $USER docker

# start docker daemon
sudo systemctl start docker
sudo systemctl enable docker

echo "necessary to logout"
