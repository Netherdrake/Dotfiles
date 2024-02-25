#!/bin/bash

## Install Core Packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl git cmake build-essential
sudo apt install -y libssl-dev pkg-config
sudo apt install -y software-properties-common
sudo apt install -y fish tmux fzf ripgrep
sudo apt install -y python3-dev python3-pip python3-tk
sudo apt install -y ranger nnn
sudo apt install -y universal-ctags

# neovim snap
sudo snap install nvim --classic

# install neovim python support
pip3 install -U pynvim --break-system-packages

# could also get latest verison with
# cargo install ripgrep
sudo apt install -y ripgrep

sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


## Install snaps
#sudo snap install -y dragon # drag-n-drop for nnn


# Configure git
cp ../../config/.gitignore ~/.gitignore
git config --global pull.ff only
git config --global init.defaultBranch master
git config --global core.editor "nvim"
git config --global core.excludesfile '~/.gitignore'
git config --global user.name "user"
git config --global user.name "user.email"


# Enable Fish by Default
grep -q -F 'fish' ~/.bashrc || echo 'exec fish' >> ~/.bashrc

#sudo update-alternatives --install /usr/bin/vi vi /snap/bin/nvim 60
#sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /snap/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /snap/bin/nvim 60
sudo update-alternatives --config editor


# Install dotfiles
echo "Installing dotfiles..."
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
cp -rv ../../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../../config/nvim/init.vim  ~/.config/nvim/init.vim
cp -rv ../../config/.tmux.conf ~/.tmux.conf


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


# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +PlugInstall

# install YCM
cd ~/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --rust-completer  && cd
#python3 install.py --clang-completer

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

# configure NNN plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

echo "All Done."
