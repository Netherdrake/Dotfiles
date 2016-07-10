#!/bin/bash

## Install Packages
sudo pacman -Syu
sudo pacman -Sy --needed mongodb redis filezilla
sudo pacman -Sy --needed docker docker-compose docker-machine
sudo pacman -Sy --needed virtualbox virtualbox-host-dkms virtualbox-sdk
sudo pacman -Sy --needed nodejs npm go
sudo pacman -Sy --needed pycharm-pro-eap
yaourt -Sy --needed robomongo atom-editor redis-desktop-manager sublime-text-dev abricotine gitkraken

## Enable Services
sudo systemctl enable mongodb.service
sudo systemctl start mongodb.service
# sudo systemctl enable redis.service
# sudo systemctl start redis.service

## Allow Dukto
sudo ufw allow 4644

## Todo Install Python via Anaconda
## Todo Add Vmware

## Install Meteorjs
curl https://install.meteor.com/ | sh