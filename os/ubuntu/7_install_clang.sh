# general dependencies
sudo apt install -y build-essential gcc ninja-build cmake cmake-curses-gui

# default ubuntu clang
sudo apt install -y llvm clang clangd clang-format clang-tidy clang-tools lldb

# for lldbui
sudo apt install lldb llvm-dev liblldb-dev

# clang stdlib
sudo apt-get install libc++-dev libc++abi-dev

# ubuntu 24.04 missing stdlib fix?
# sudo apt install libstdc++-14-dev

# stacktraces
sudo apt install -y libdwarf-dev libunwind-dev binutils-dev

# cmake neovim LSP
python3 -m pip install cmake-language-server --break-system-packages

# alternative to clangd vim lsp
sudo apt install ccls

# compilation database for Makefile projects
sudo apt install bear

# old instrumentation
sudo apt install valgrind kcachegrind

# replay debugger
sudo apt install rr

# compiler cache
sudo apt install ccache

# faster linker
sudo apt install lld

# gdb-dashboard
#wget -P ~ https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
#pip3 install -U pygments
#mkdir -p $HOME/.config/gdb-dashboard
#cp ../../config/gdb-dashboard/init $HOME/.config/gdb-dashboard

# glfw3/imgui dependencies
sudo apt install -y libwayland-dev libxkbcommon-dev wayland-protocols extra-cmake-modules
sudo apt install -y mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev
sudo apt install -y libglew-dev libglfw3-dev libglm-dev
sudo apt install -y libao-dev libmpg123-dev

# vcpkg
cd
git clone https://github.com/microsoft/vcpkg
./vcpkg/bootstrap-vcpkg.sh -disableMetrics

# common dependencies
cd ~/vcpkg

./vcpkg install dbg-macro
./vcpkg install FunctionalPlus
./vcpkg install plog
./vcpkg install sqlite3
./vcpkg install fmt
./vcpkg install matchit
./vcpkg install tl-expected
