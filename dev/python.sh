# install anaconda

# install vim deps
pip install neovim

# update python packages
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# install iPython Notebook theme
pip install --upgrade jupyterthemes
jt -t chesterish -cellw 1040

