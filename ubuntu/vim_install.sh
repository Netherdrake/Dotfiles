# ubuntu install
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim-gtk cmake build-essential ck-grep silversearcher-ag git -y

# Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
cd ~/.vim
mkdir tmp
cd tmp/
mkdir swap backup undo
cd

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd

# install node version manager
curl https://raw.githubusercontent.com/Alex7Kom/nvm-fish/master/install.fish | fish

# restart shell required
source ~/.bashrc
nvm install v0.11.14

# install js autocompletion
cd .vim/bundle/tern_for_vim/ && npm install
npm install -g jshint
