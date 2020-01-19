#!/bin/bash

## Install Core Packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y git cmake build-essential silversearcher-ag exuberant-ctags
sudo apt install -y software-properties-common
sudo apt install -y fish neovim tmux golang
sudo apt install -y python3-dev python3-pip python3-tk

# Configure Golang
mkdir ~/go
grep -q -F 'GOPATH' ~/.bashrc || echo 'export GOPATH="/home/$(whoami)/go"' >> ~/.bashrc

# Enable Fish by Default
grep -q -F 'fish' ~/.bashrc || echo 'exec fish' >> ~/.bashrc

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Install dotfiles
echo "Installing dotfiles..."
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
cp -rv ../../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../../config/nvim/init.vim  ~/.config/nvim/init.vim
cp -rv ../../config/tmux/tmux.conf ~/.tmux.conf

## Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Configuring Vim
echo "Configuring NeoVim..."
mkdir -p ~/.vim
cd ~/.vim
mkdir -p tmp
cd tmp/
mkdir -p swap
mkdir -p undo
mkdir -p backup
cd

# install neovim python support
pip3 install pynvim

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall

# install YCM
cd ~/.vim/bundle/YouCompleteMe && python3 install.py && cd
#python3 install.py --gocode-completer --clang-completer

# install js autocompletion (if you need newer node.js, install nvm instead)
#sudo apt install nodejs npm -y
#cd ~/.vim/bundle/tern_for_vim/
#npm install
#sudo npm install -g jshint
echo "All Done."
