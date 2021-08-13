function update
  brew update --all ;and brew upgrade --all
end

function updateall
  brew update --all ;and brew upgrade --all
  vim +PlugUpdate
end

function upgrade
  brew cask update
end

function cleanup
  brew cleanup ;and brew cask cleanup
end
