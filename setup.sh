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
sudo apt update 
print_status "Update System..."
sudo apt install tmux
print_status "Installing the install tmux..."

sudo curl -sSL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt install -y nodejs 

print_status "Installing the NodeSource NODEJS repo..."

sudo npm install pnpm -g
print_status "Installing the pnpm..."

sudo git clone https://github.com/CoCoWP-code/CoWP-Chat.git 
cp 
cd CoWP-Chat/ 
sudo pnpm bootstrap 
cd service/ 
cp .env.example .env

# Ask user for yes/no response
read -p "Bạn cần nhập API và token của OpenAI vào file Service/.evn sau đó nhấn Yes " answer

# Check user response using if-else statement
if [[ "$answer" =~ ^(yes|y)$ ]]
then
    echo "Continuing..."
sudo pnpm install 
cd  
cd CoWP-Chat/ 
tmux new-session -s mysession 
sudo bash start.sh 
elif [[ "$answer" =~ ^(no|n)$ ]]
then
    echo "Stopping..."
else
    echo "Invalid input, stopping..."
fi
