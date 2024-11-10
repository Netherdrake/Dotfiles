## Supported Workflows
 - Ubuntu local: Sway + fish + neovim  
 - Ubuntu remote: tmux + fish + neovim  
 - Ubuntu remote minimal: Regular vim only, no plugins

## Notes

### Minimal vim on server
```
wget https://raw.githubusercontent.com/Netherdrake/Dotfiles/master/config/.vimrc -O .vimrc
```

### Install Tmux Plugin Manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Tmux && Linux
Make sure you have `xsel` or `xclip` installed.

Then, install this plugin:  
https://github.com/tmux-plugins/tmux-yank

## Alacritty
```
cargo install alacritty

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/user/.cargo/bin/alacritty 50

sudo update-alternatives --config x-terminal-emulator

mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

cp config/alacritty/.alacritty.toml ~/
```

## Re-compiling YCM (YouCompleteMe)
```
cd ~/.vim/plugged/YouCompleteMe
./install.py  \
    --clang-completer \
    --rust-completer
```
