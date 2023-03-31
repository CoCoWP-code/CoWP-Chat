#!/bin/bash

# Script to install the ChatGPT repo onto a
# Debian or Ubuntu system.
#
# Run as root or insert 'sudo' before 'bash':

print_status() {
    echo
    echo "## $1"
    echo
}

apt  install -y docker-compose
sudo curl -sSL https://deb.nodesource.com/setup_18.x | sudo bash - 
sudo apt install -y nodejs 
sudo apt install -y tmux
sudo npm install -y pnpm -g 
mkdir /var/www
cd /var/www
sudo git clone https://github.com/CoCoWP-code/CoWP-Chat.git 
mv /var/www/CoWP-Chat /var/www/html
cd html/ 
sudo pnpm bootstrap 
cd service/ 
sudo pnpm install 
cd  
cd /var/www/html/docker-compose
docker-compose up -d 
cd /var/www/html 
sudo tmux new-session -s mysession 
sudo bash start.sh 
