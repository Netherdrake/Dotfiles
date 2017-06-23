#!/bin/bash

# ubuntu install
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install vim-gtk cmake build-essential silversearcher-ag git fish -y

# install vimrc
cp .nvimrc  ~/.config/nvim/init.vim


# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
mkdir -p ~/.vim
cd ~/.vim
mkdir tmp
cd tmp/
mkdir swap
mkdir undo
mkdir backup
cd

# install neovim package
pip install neovim

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --gocode-completer --clang-completer
cd

# install npm (if you need newer node.js, install nvm instead)
sudo apt install nodejs npm -y

# install js autocompletion
cd ~/.vim/bundle/tern_for_vim/
npm install
sudo npm install -g jshint
