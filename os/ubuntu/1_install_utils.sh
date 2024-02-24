#!/bin/bash

# Common utilities
sudo apt install -y tree curl wget htop ufw gufw cryptsetup encfs jq pass
pip3 install yt-dlp --break-system-packages
pip3 install tldr --break-system-packages


# Alacritty
sudo apt-get install libfontconfig1-dev
cargo install alacritty

cp ../../config/alacritty/.alacritty.toml ~
