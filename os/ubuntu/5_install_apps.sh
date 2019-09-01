#!/bin/bash

# Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update

# install typora
sudo apt install typora

# Etcher

# Epiphany browser
sudo apt install epiphany-browser
