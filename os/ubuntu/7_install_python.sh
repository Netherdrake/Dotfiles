# python
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

sudo apt install python3.11 python3.11-dev python3.11-venv python3.11-distutils python3.11-gdbm -y

python3.11 -m pip install --upgrade pip

# poetry
curl -sSL https://install.python-poetry.org | python3.11 -
poetry completions fish > ~/.config/fish/completions/poetry.fish

# microsoft's language server for Python
pip3 install -U pyright

# gdbgui
python3 -m pip install --user pipx
pipx install gdbgui

