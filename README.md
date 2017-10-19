## OS Support
Arch Linux (Best)  
Ubuntu (Ok)  
macOS Sierra (Ok)  

## Language Support
Go (Great)  
Python (Good)  
Clojure (Meh)  
JS, Markdown, HTML (Whatever)  

## File Structure
```
42
├── arch
│   ├── dev.sh
│   ├── install.sh
│   ├── personal.sh
│   ├── privacy.sh
│   └── python.sh
├── config
│   ├── fish
│   │   └── config.fish
│   ├── nvim
│   │   └── init.vim
│   └── tmux
│       ├── default.sh
│       └── tmux.conf
├── osx
│   ├── config.fish
│   └── tmux.conf
├── README.md
└── ubuntu
    ├── install.sh
    ├── ubuntu.sh
    └── vim_install.sh
```

## Notes
`tmux.conf` goes into `~/.tmux.conf`  
`nvim/` and `fish/` go into `~/.config/`

### Tilix
To export the tilix config, run:
```
dconf dump /com/gexperts/Tilix/ > tilix.dconf
```

To import said config, run:
```
dconf load /com/gexperts/Tilix/ < tilix.dconf
```
