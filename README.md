## OS Workflows
Arch Linux *(GNOME + Tilix/Tmux + NeoVim)*  
Ubuntu *(i3wm + NeoVim)*  
macOS Sierra *(Tmux + NeoVim)*  

**[Documentation](https://github.com/Netherdrake/Dotfiles/tree/master/os)** for i3, Gnome and other
OS related setups.

## Language Support
Go *(Great)*  
Python *(Good)*  
JS, Markdown, HTML *(Ok)*  

## File Structure
```
42
├── config
│   ├── devdocs.json
│   ├── fish
│   │   └── config.fish
│   ├── i3
│   │   ├── config
│   │   ├── README.md
│   │   └── xmodmap.cfg
│   ├── nvim
│   │   └── init.vim
│   ├── tilix
│   │   └── tilix.dconf
│   └── tmux
│       ├── default.sh
│       └── tmux.conf
├── os
│   ├── arch
│   │   ├── dev.sh
│   │   ├── install.sh
│   │   ├── personal.sh
│   │   ├── privacy.sh
│   │   └── python.sh
│   ├── osx
│   │   ├── config.fish
│   │   └── tmux.conf
│   └── ubuntu
│       ├── install.sh
│       ├── post_install.sh
│       ├── ubuntu.sh
│       └── vim_install.sh
└── README.md
```

## Notes

### Tmux + Vim Configs
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/(nvim|fish)`


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
cd ~/.vim/bundle/YouCompleteMe
./install.py  \
    --clang-completer \
    --go-completer \
    --js-completer
```
