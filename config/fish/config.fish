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

function updateall
    sudo apt update
    sudo apt upgrade
    vim +BundleUpdate
end

function vimu
    vim +BundleUpdate
end

function vimuu
    pip install -U neovim
    vim +BundleUpdate
    vim +GoUpdateBinaries
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py  \
        --clang-completer \
        --go-completer \
        --js-completer
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end

function pyserve
    python -m http.server $argv --bind 127.0.0.1
end

function pyserver
    python -m http.server 1234 --bind 127.0.0.1
end

function pj
    python -m json.tool
end

function gvm
    bash -c '. ~/.gvm/bin/gvm-init.sh; gvm "$@"' gvm $argv
end

function mdfind
    echo $argv
    find ~/ -name $argv
end

function Mdfind
    sudo find / -name $argv
end

function r
    eval $argv > /dev/null 2>&1 &
end

function sr
    eval $argv > /dev/null 2>&1 &
end

alias subl "subl3"
alias vim "nvim"

