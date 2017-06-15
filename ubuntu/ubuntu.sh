#!/bin/bash

GREEN='\033[0;32m\n'
NC='\033[0m' # No Color

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/colomboem/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/dukto.list"
sudo apt-get update
sudo apt-get -y install dukto
sudo ufw allow 4644

sudo apt -y install tree


sudo apt-get -y install ufw gufw
sudo apt-get -y install cryptsetup
sudo apt-get -y install encfs
sudo add-apt-repository ppa:gencfsm && sudo apt update && sudo apt install gnome-encfs-manager -y

sudo apt install tmux -y

# sudo add-apt-repository ppa:numix/ppa
# sudo apt-get update
# sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle

sudo apt -y install redshift redshift-gtk

sudo apt-get install curl
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing-release.list
sudo apt-get update
sudo apt-get install syncthing

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get -y install syncthing-gtk

sudo ufw allow syncthing
sudo ufw allow syncthing-gui


#sudo sh -c 'echo "deb http://linux-packages.getsync.com/btsync/deb btsync non-free" > /etc/apt/sources.list.d/btsync.list'
#wget -qO - http://linux-packages.getsync.com/btsync/key.asc | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install btsync
#systemctl --user enable btsync
#echo -e "${GREEN}=====> You need to configure btsync NOW${NC}"

# after you install virtualbox
# sudo usermod -a -G vboxusers $USER

