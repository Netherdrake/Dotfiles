#!/bin/bash

## Dukto LAN sync
#sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/colomboem/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/dukto.list"
#sudo apt-get update
#sudo apt-get -y install dukto
#sudo ufw allow 4644

# Syncthing p2p sync
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing-release.list
sudo apt-get update
sudo apt-get install syncthing
sudo ufw allow syncthing

#sudo add-apt-repository ppa:nilarimogard/webupd8
#sudo apt-get update
#sudo apt-get -y install syncthing-gtk
#sudo ufw allow syncthing-gui

# Bittorent Sync
#sudo sh -c 'echo "deb http://linux-packages.getsync.com/btsync/deb btsync non-free" > /etc/apt/sources.list.d/btsync.list'
#wget -qO - http://linux-packages.getsync.com/btsync/key.asc | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install btsync
#systemctl --user enable btsync
#echo -e "${GREEN}=====> You need to configure btsync NOW${NC}"

