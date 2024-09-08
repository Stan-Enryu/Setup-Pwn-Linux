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
sudo apt-get install -y python2-dev python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

echo '[+] Install pwntools for python2'
python2 -m pip install --upgrade pip
python2 -m pip install --upgrade setuptools
python2 -m pip install --upgrade pwntools


echo '[+] Install pwndbg'
sudo apt install -y python3.12-venv
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

echo '[+] Install adb tools'
sudo apt install -y google-android-platform-tools-installer

echo '[+] Install compress and decompress kernel ctf'
sudo mkdir /opt/pwn
cd /opt/pwn
sudo git clone https://github.com/Stan-Enryu/kernel-exploitation.git
cd kernel-exploitation
chmod +x ./setup.sh 
./setup.sh 
cd $current_path

echo '[+] Install Make docker file'
cd /opt/pwn
sudo git clone https://github.com/Stan-Enryu/docker-file-binex.git
cd docker-file-binex
sudo ln -s '/opt/pwn/docker-file-binex/main.py' '/usr/local/bin/make-docker'
cd $current_path

echo '[+] Setup Install and compile python'
# libreadline-gplv2-dev
sudo apt-get install libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
sudo mkdir /opt/python

echo '[+] Install and compile python3.10'
cd /opt/python
python_version=Python-3.10.14
sudo wget https://www.python.org/ftp/python/3.10.14/$python_version.tgz
sudo tar xzf $python_version.tgz
sudo rm $python_version.tgz
cd ./$python_version
sudo ./configure --enable-optimizations
sudo make -j "$(nproc)"
sudo make altinstall
cd $current_path

echo '[+] Install and compile python3.9'
cd /opt/python
version=3.9.19
python_version=Python-$version
sudo wget https://www.python.org/ftp/python/$version/$python_version.tgz
sudo tar xzf $python_version.tgz
sudo rm $python_version.tgz
cd ./$python_version
sudo ./configure --enable-optimizations
sudo make -j "$(nproc)"
sudo make altinstall