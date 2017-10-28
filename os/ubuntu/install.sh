#!/bin/bash

## Install Packages
# ubuntu install
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install cmake build-essential silversearcher-ag git fish -y
sudo apt install -y fish tmux exuberant-ctags golang

# Install GO
mkdir ~/go
grep -q -F 'GOPATH' ~/.bashrc || echo 'export GOPATH="/home/$(whoami)/go"' >> ~/.bashrc

# Enable Fish by Default
grep -q -F 'fish' ~/.bashrc || echo 'exec fish' >> ~/.bashrc


# Install Neovim
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim -y

#sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Install dotfiles
mkdir ~/.config/fish
cp -rv ../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../config/tmux/tmux.conf ~/.tmux.conf

## Install Vim
echo "Install Anaconda, then run vim_install.sh"

