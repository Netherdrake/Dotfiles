#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/rust-lang/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server
cd ..
rm -rf rust-analyzer

rustup component add rust-src
rustup component add rustfmt
rustup component add clippy

cargo install cargo-watch
cargo install evcxr

rustup install nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
rustup component add rust-analyzer --toolchain nightly-x86_64-unknown-linux-gnu
rustup component add clippy --toolchain nightly-x86_64-unknown-linux-gnu

cargo +nightly install cargo-watch
cargo +nightly install evcxr

