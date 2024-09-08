#!/bin/bash

echo '[+] Install nuclei'
sudo apt install -y nuclei

echo '[+] Install nuclei'
sudo apt install -y dirsearch

echo '[+] Install virtual box'
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
sudo apt install linux-headers-$(uname -r)
sudo apt-get install -y virtualbox