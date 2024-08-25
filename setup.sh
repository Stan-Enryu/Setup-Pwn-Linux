#!/bin/bash

mkdir temp
cd ./temp
current_path==$(pwd)

echo '[+] Install Sublime' 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text 

echo '[+] Install vscode'
curl https://update.code.visualstudio.com/latest/linux-deb-x64/stable -L -o vscode.deb
sudo apt install -y ./vscode.deb

echo '[+] Install gdb and gdb-multiarch'
sudo apt install -y gdb gdb-multiarch

echo '[+] Install pip for python2'
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python2 get-pip.py

echo '[+] Install pwntools for python3'
sudo apt-get install -y python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

echo '[+] Install pwntools for python2'
python2 -m pip install --upgrade pip
python2 -m pip install --upgrade setuptools
python2 -m pip install --upgrade pwntools


echo '[+] Install pwndbg'
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
sudo ./setup.sh
cd ..

echo '[+] Install chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

echo '[+] Install qemu'
sudo apt-get install -y qemu qemu-user-static qemu-system
# install all the dependencies
sudo apt-get install -y libglib2.0 libglib2.0-dev
sudo apt-get install -y autoconf automake libtool

echo '[+] Install virtual box'
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
sudo apt-get install -y virtualbox

echo '[+] Install docker'
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

