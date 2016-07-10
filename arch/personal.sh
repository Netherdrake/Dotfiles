#!/bin/bash

## Install Packages
sudo pacman -Syu
sudo pacman -Sy --needed snapd speedcrunch gimp vlc kdegraphics-okular youtube-dl
sudo pacman -Sy --needed dropbox 
yaourt -Sy --needed spotify soundnode-app-bin redshift gyazo nautilus-dropbox mattermost-desktop