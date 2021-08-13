set fish_greeting ""
bind \ct kill-word

function fish_prompt
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

function vimu
    pip install -U pynvim
    vim +PlugUpdate
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --clang-completer
    cd -
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
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

function sr
    eval $argv > /dev/null 2>&1 &
end

function pass
    gpg --gen-random --armor 1 30
end

alias vim "nvim"
alias vi "nvim"
alias open "xdg-open"
alias R "R --no-save --no-restore --quiet"

# >>> conda initialize >>>
# eval /home/user/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Rust
source $HOME/.cargo/env
