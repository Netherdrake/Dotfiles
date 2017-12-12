## OS Support
Arch Linux (Best)  
Ubuntu (Ok)  
macOS Sierra (Ok)  

## Language Support
Go (Great)  
Python (Good)  
Clojure (Meh)  
JS, Markdown, HTML (OK)  

## File Structure
```
42
├── config
│   ├── fish
│   │   └── config.fish
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
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/`

### Tilix (Linux Only)
To export the tilix config, run:
```
dconf dump /com/gexperts/Tilix/ > tilix.dconf
```

To import said config, run:
```
dconf load /com/gexperts/Tilix/ < tilix.dconf
```

## Re-compiling YCM (YouCompleteMe)
```
cd ~/.vim/bundle/YouCompleteMe
./install.py  \
    --clang-completer \
    --go-completer \
    --js-completer
```
