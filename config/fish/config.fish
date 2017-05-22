set fish_greeting ""
bind \ct kill-word

function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' % '
end

function inst
    sudo apt-get update
    sudo apt-get install $argv
end

function update
    sudo apt-get update
end

function upgrade
    sudo apt-get update
    sudo apt-get upgrade
end

function updateall
    sudo apt-get update
    sudo apt-get upgrade
    vim +BundleUpdate
    vim +GoUpdateBinaries
end

function vimu
    vim +BundleUpdate
    vim +GoUpdateBinaries
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --gocode-completer --clang-completer
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

