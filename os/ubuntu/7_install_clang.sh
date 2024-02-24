# general dependencies
sudo apt install -y gcc ninja-build cmake cmake-curses-gui

# default ubuntu clang
sudo apt install -y clang clangd clang-format clang-tidy clang-tools lldb

# stacktraces
sudo apt install -y libdwarf-dev libunwind-dev binutils-dev

# snap cmake clang issue 22.04
# https://stackoverflow.com/questions/74543715/usr-bin-ld-cannot-find-lstdc-no-such-file-or-directory-on-running-flutte
#sudo apt install libstdc++-12-dev

# # clang (ubuntu nightly)
# wget https://apt.llvm.org/llvm.sh
# chmod +x llvm.sh
# sudo ./llvm.sh 17 all
# sudo apt install clang-format clang-tidy clang-tools clang clangd \
#  libc++-dev libc++1 libc++abi-dev libc++abi1 \
#  libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 \
#  lld lldb llvm-dev llvm-runtime llvm python3-clang
#
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# sudo apt update
# sudo apt upgrade -y
# sudo apt install libstdc++-10-dev

# issue https://github.com/llvm/llvm-project/issues/55575
#sudo apt install python3-lldb-14
#sudo ln -s /usr/lib/llvm-14/lib/python3.10/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/

# cmake neovim LSP
python3 -m pip install cmake-language-server

# alternative to clangd vim lsp
sudo apt install ccls

# compilation database for Makefile projects
sudo apt install bear

# instrumentation
sudo apt install valgrind kcachegrind

# replay debugger
sudo apt install rr

# gdb-dashboard
#wget -P ~ https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
#pip3 install -U pygments
#mkdir -p $HOME/.config/gdb-dashboard
#cp ../../config/gdb-dashboard/init $HOME/.config/gdb-dashboard

# zeal-cli
# sudo apt install zeal
# wget https://gitlab.com/ivan-cukic/zeal-lynx-cli/-/raw/master/zeal-cli -O ~/bin/zeal-cli
# chmod +x ~/bin/zeal-cli
# pip3 install beautifulsoup4

# vcpkg
git clone https://github.com/microsoft/vcpkg
./vcpkg/bootstrap-vcpkg.sh -disableMetrics
