#!/bin/bash

# install Powerline fonts
sudo apt install -y powerline
fc-cache -vf

# install Font-Awesome
mkdir -p ~/.fonts
wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.4.2/fontawesome-free-5.4.2-desktop.zip
unzip fontawesome-free-5.4.2-desktop.zip
cp fontawesome-free-5.4.2-desktop/otfs/*.otf ~/.fonts
rm -rf fontawesome-free*
