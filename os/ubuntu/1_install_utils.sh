#!/bin/bash

# Common utilities
sudo apt install -y tree curl wget htop ufw gufw cryptsetup encfs jq pass
pip3 install yt-dlp --break-system-packages
pip3 install tldr --break-system-packages


# Alacritty
sudo apt-get install libfontconfig1-dev
cargo install alacritty

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/user/.cargo/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator

cp ../../config/alacritty/.alacritty.toml ~
