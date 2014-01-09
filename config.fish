set fish_greeting ""

function fish_prompt
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' % '
end

function lockon
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end
