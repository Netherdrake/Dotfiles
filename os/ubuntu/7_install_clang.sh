# general dependencies
sudo apt install -y gcc clang clangd clang-format clang-tidy clang-tools ninja-build cmake cmake-curses-gui lldb

# clang (ubuntu 20.04)
# sudo apt install clang-12 clangd-12 clang-12-doc clang-format-12 clang-tidy-12 clang-tools-12

# issue https://github.com/llvm/llvm-project/issues/55575
sudo apt install python3-lldb-14
sudo ln -s /usr/lib/llvm-14/lib/python3.10/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/

# cmake neovim LSP
python3 -m pip install cmake-language-server

# alternative to clangd vim lsp
sudo apt install ccls

# compilation database for Makefile projects
sudo apt install bear

# instrumentation
sudo apt install valgrind kcachegrind

# gdb-dashboard
wget -P ~ https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
pip3 install -U pygments
