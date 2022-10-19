## Supported Workflows
 - Ubuntu local: i3 + fish + neovim  
 - Ubuntu remote: tmux + fish + neovim  
 - Ubuntu remote minimal: Regular vim only, no plugins


**[Documentation](https://github.com/Netherdrake/Dotfiles/tree/master/os)** for OS related setups.
Install scripts are available for Ubuntu only.

## Vim Language Support
Rust *(Great)*  
R, Python *(Good)*  

## Notes

### Tmux + Vim Configs
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/(nvim|fish)`

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

Currently using _14pt Roboto Mono for Powerline._

## Re-compiling YCM (YouCompleteMe)
```
cd ~/.vim/plugged/YouCompleteMe
./install.py  \
    --clang-completer \
    --rust-completer
```
