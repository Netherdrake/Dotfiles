sudo dnf install ufw
sudo systemctl enable ufw
sudo ufw enable

sudo dnf install fish
sudo dnf install alacritty
sudo dnf install git
sudo dnf install neovim
sudo dnf install fzf htop nnn
sudo dnf install fd-find

sudo dnf install python3-devel
sudo dnf install python3-neovim
sudo dnf install python3-pynvim
sudo dnf install python3-ipython
sudo dnf install python3-pylsp
pip install python-lsp-server
pip install -U pipenv

sudo dnf install syncthing
sudo dnf install keepassxc
sudo dnf install pass
sudo dnf install tldr

sudo dnf install cmake
sudo dnf install llvm
sudo dnf install gcc ninja-build cmake cmake-curses-gui
sudo dnf install llvm clang clangd clang-format clang-tidy lldb
sudo dnf install libdwarf-dev libunwind-dev binutils-dev
sudo dnf install cmake-language-server
sudo dnf install bear
sudo dnf install ccache
sudo dnf install lld
sudo dnf install rr
sudo dnf install libdwarf-devel libunwind-devel binutils-devel
sudo dnf install libasan
sudo dnf install libubsan
sudo dnf install ninja
sudo dnf install universal-ctags


grep -q -F 'fish' ~/.bashrc || echo 'exec fish' >> ~/.bashrc

mkdir -p ~/.config/nvim
mkdir -p ~/.config/fish
mkdir -p ~/.config/yazi
cp -rv ../../config/.editorconfig ~/.editorconfig
cp -rv ../../config/.tmux.conf ~/.tmux.conf
cp -rv ../../config/nvim/init.vim  ~/.config/nvim/init.vim
cp -rv ../../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../../config/alacritty/.alacritty.toml ~

cd
mkdir -p tmp
cd tmp/
mkdir -p backup
mkdir -p undo
mkdir -p swap

cd ~/.vim
mkdir -p ~/.vim
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
nvim +PlugInstall
python3 install.py --clang-completer
cd ~/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --rust-completer  && cd

sudo update-alternatives --config editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60

git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
mkdir -p ~/.config/alacritty/themes

curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

cd ~/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --rust-completer  && cd

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface text-scaling-factor "1"

cd
ln -s pass .password-store

