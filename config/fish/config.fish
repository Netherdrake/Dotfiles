set fish_greeting ""
bind \ct kill-word

function fish_prompt
    if set -q NNNLVL
        echo -n '(nnn) '
    end
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' % '
end

function inst
    sudo apt update
    sudo apt install $argv
end

function update
    sudo apt update
end

function upgrade
    sudo apt update
    sudo apt upgrade
end

function upgrade-all
    sudo apt update
    sudo apt upgrade
    sudo snap refresh
    flatpak update -y
    sudo fwupdmgr update
end

function vimu
    vim +PlugUpdate
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --clang-completer --rust-completer
    cd -
end

function dlaudio
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 $argv
end

function pyserve
    python3 -m http.server $argv --bind 127.0.0.1
end

function pyserver
    python3 -m http.server 1234 --bind 127.0.0.1
end

function mdfind
    find ~/ -type f | fzf --bind "enter:execute(xdg-open {})" -q "$argv"
end

function daemon
    eval $argv > /dev/null 2>&1 &
end

function rand
    gpg --gen-random --armor 1 30
end

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias cdy "pwd | xclip -i"
alias cdp "cd (xclip -o)"

alias v "nvim"
alias vim "nvim"
alias vi "nvim"
alias rrr "ranger"
alias nnn "nnn -e"
alias open "xdg-open"
alias R "R --no-save --no-restore --quiet"
alias rust "evcxr"

# Snaps ugh :(
export PATH="/snap/bin:$PATH"

# Make nvim default
export EDITOR=/snap/bin/nvim

# My apps
export PATH="$HOME/bin:$PATH"

# Pyright, bat
export PATH="$HOME/.local/bin:$PATH"

# Setup NNN plugins
export NNN_PLUG='c:fzcd;o:fzopen;l:launch;n:!nautilus --browser "$nnn"*;h:-!hx "$nnn"*;v:!vim "$nnn"*;d:!cp -rv "$nnn" "$nnn".copy;'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO="$HOME/.cargo/bin/cargo"

# Zig
export PATH="$HOME/zig:$PATH"

# Odin
export PATH="$HOME/Github/Odin:$PATH"
export PATH="$HOME/Github/ols:$PATH"
