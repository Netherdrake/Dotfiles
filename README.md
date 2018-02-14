## OS Workflows
Arch Linux *(GNOME + Tilix/Tmux + NeoVim)*  
Ubuntu *(i3wm + NeoVim)*  
macOS Sierra *(Tmux + NeoVim)*  

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

### i3 (Linux Only)
I documented my i3wm setup [here](https://github.com/Netherdrake/Dotfiles/tree/master/config/i3)

### Tmux + Vim Configs
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/(nvim|fish)`

### Tilix (Linux Only)
To export the tilix config, run:
```
dconf dump /com/gexperts/Tilix/ > tilix.dconf
```

To import said config, run:
```
dconf load /com/gexperts/Tilix/ < tilix.dconf
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

## Re-compiling YCM (YouCompleteMe)
```
cd ~/.vim/bundle/YouCompleteMe
./install.py  \
    --clang-completer \
    --go-completer \
    --js-completer
```
