sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

sudo apt install python3.11 python3.11-dev python3.11-venv python3.11-distutils python3.11-gdbm -y

python3.11 -m pip install --upgrade pip

# microsoft's language server for Python
pip3 install -U pyright
