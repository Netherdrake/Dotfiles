#!/bin/bash

# install Powerline fonts
sudo apt install -y powerline
fc-cache -vf

# install Font-Awesome
mkdir -p ~/.fonts
wget https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.1/fontawesome-free-6.5.1-desktop.zip
unzip fontawesome-free-6.5.1-desktop.zip
cp fontawesome-free-6.5.1-desktop/otfs/*.otf ~/.fonts
rm -rf fontawesome-free*
