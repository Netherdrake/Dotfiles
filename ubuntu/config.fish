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
end

function vimu
  vim +BundleUpdate
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
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

test -s /home/jan/.nvm-fish/nvm.fish; and source /home/jan/.nvm-fish/nvm.fish
