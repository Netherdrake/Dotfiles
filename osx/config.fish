set fish_greeting ""

function fish_prompt
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' % '
end

function lockme
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function update
  brew update ;and brew upgrade
end

function updateall
  brew update ;and brew upgrade
  vim +BundleUpdate
end

function upgrade
  brew cask update
end

function cleanup
  brew cleanup ;and brew cask cleanup
end

function vimu
  vim +BundleUpdate
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end
