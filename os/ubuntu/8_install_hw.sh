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
