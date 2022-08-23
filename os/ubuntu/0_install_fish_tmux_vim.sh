#!/bin/bash

## Install Core Packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl git cmake build-essential silversearcher-ag exuberant-ctags
sudo apt install -y software-properties-common
sudo apt install -y fish neovim tmux fzf ripgrep
sudo apt install -y python3-dev python3-pip python3-tk
sudo apt install -y ranger

sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Configure git
cp ../../config/.gitignore ~/.gitignore
git config --global pull.ff only
git config --global init.defaultBranch master
git config --global core.editor "nvim"
git config --global core.excludesfile '~/.gitignore'
git config --global user.name "Netherdrake"

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
echo "Configuring neovim..."
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

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +PlugInstall

# install YCM
cd ~/.vim/plugged/YouCompleteMe && python3 install.py && cd
#python3 install.py --gocode-completer --clang-completer

# install js autocompletion (if you need newer node.js, install nvm instead)
#sudo apt install nodejs npm -y
#cd ~/.vim/bundle/tern_for_vim/
#npm install
#sudo npm install -g jshint

# # Install Fish package manager
# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# # Install fzf fish support
# exec fish
## older one, unmaintained
# fisher add jethrokuan/fzf
## newer one, not working
# sudo apt install -y bat fd-find fzf
# fisher add patrickf3139/fzf.fish

# Another option is to use fzf extension
sudo apt remove -y fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


echo "All Done."
