## Supported Workflows
 - Ubuntu local: i3 + fish + neovim  
 - Ubuntu remote: tmux + fish + neovim  
 - Ubuntu remote minimal: Regular vim only, no plugins


## README
 - [regolith2](config/regolith2/README.md)
 - [i3](config/i3/README.md)

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

### Powerline fonts
Install this:  
https://github.com/powerline/fonts

Some nice ones:
 - `Roboto Mono for Powerline`
 - `Source Code Pro Powerline Regular`
 - `d2coding and droid sans`

```
sudo apt install powerline
fc-cache -vf
```

For l337 icon suppport, install [Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases).
```
mkdir ~/.fonts
cp ~/Downloads/fo/fonts/*.tff ~/.fonts
```

## Alacritty
```
cargo install alacritty

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/user/.cargo/bin/alacritty 50

sudo update-alternatives --config x-terminal-emulator

cp config/alacritty/.alacritty.yml ~/
```

## Re-compiling YCM (YouCompleteMe)
```
cd ~/.vim/plugged/YouCompleteMe
./install.py  \
    --clang-completer \
    --rust-completer
```
