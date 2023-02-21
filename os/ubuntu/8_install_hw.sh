#!/bin/bash

# general deps
sudo apt-get install -y gcc clang ninja-build cmake libudev-dev libusb-1.0-0 libssl-dev pkg-config libtinfo5

# HackRF radio
sudo apt install hackrf libhackrf-dev

# this tool for blind people breaks some USB-UART converters
sudo apt remove brltty

# add LLVM binutils
cargo install cargo-binutils
rustup component add llvm-tools-preview


# digilent waveforms dependencies
# sudo apt install libqt5script5 libqt5scripttools5 libqt5multimedia5-plugins qml-module-qtmultimedia

# sudo dpkg -i digilent.adept.runtime_2.27.9-amd64.deb
# sudo dpkg -i digilent.waveforms_3.19.5_amd64.deb
