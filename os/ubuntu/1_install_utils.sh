#!/bin/bash

# gpg stuff
sudo apt -y install \
    wget gnupg2 gnupg-agent dirmngr \
    cryptsetup scdaemon pcscd secure-delete \
    yubikey-personalization

# Common utilities
sudo apt install -y tree curl wget htop ufw gufw cryptsetup encfs jq pass tldr yt-dlp


# Alacritty
sudo apt-get install libfontconfig1-dev
cargo install alacritty

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/user/.cargo/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator

cp ../../config/alacritty/.alacritty.toml ~
