## Supported Workflows
 - GNOME + Tilix/Tmux + Fish + NeoVim  
 - i3wm + Fish + NeoVim  

**[Documentation](https://github.com/Netherdrake/Dotfiles/tree/master/os)** for i3, Gnome and other
OS related setups. Install scripts are available for Ubuntu OS.

## Vim Language Support
Go *(Great)*  
R, Python *(Good)*  

## Notes

### Tmux + Vim Configs
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/(nvim|fish)`

### Install Tmux Plugin Manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Tmux && macOS
Make sure to enable "Applications in terminal may access clipboard"
in iTerm 2 Preferences.

Also, install this:
```
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
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
    --go-completer
```
