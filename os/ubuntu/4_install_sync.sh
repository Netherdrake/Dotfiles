#!/bin/bash

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
