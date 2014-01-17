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

function gaeon
 set GOPATH ~/Documents/go/go_appengine/
end

function gaeoff
 set GOPATH ~/Documents/go/
end
