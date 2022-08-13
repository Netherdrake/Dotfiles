#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/rust-lang/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server
cd ..
rm -rf rust-analyzer

rustup component add rustfmt
rustup component add clippy

cargo install cargo-watch
cargo install evcxr
