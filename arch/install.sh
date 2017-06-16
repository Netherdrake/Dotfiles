#!/bin/bash

## Install Packages
sudo pacman -Syu
sudo pacman -Sy --needed tree fish neovim python-neovim python2-neovim tmux ack the_silver_searcher git wget curl sed ctags

# Enable Fish by Default
grep -q -F 'fish' ~/.bashrc || echo 'exec fish' >> ~/.bashrc

# Install dotfiles
mkdir ~/.config/fish
cp -rv ../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../config/tmux/tmux.conf ~/.tmux.conf

## Install Vim
mkdir ~/.config/nvim
cp ../config/nvim/init.vim  ~/.config/nvim/init.vim

# required dirs
cd ~/.vim
mkdir tmp
cd tmp/
mkdir swap
mkdir undo
mkdir backup
cd

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
nvim +BundleInstall
nvim +GoInstallBinaries

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --system-libclang --clang-completer --gocode-completer

