#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# git clone https://github.com/rust-lang/rust-analyzer.git
# cd rust-analyzer
# cargo xtask install --server
# cd ..
# rm -rf rust-analyzer

rustup component add rust-src
rustup component add rustfmt
rustup component add clippy
rustup component add rust-analyzer

cargo install cargo-watch
cargo install evcxr
cargo install evcxr_repl

# benchmarking
cargo install hyperfine

# file manager
cargo install --locked yazi-fm yazi-cli

# neovide
# sudo dnf install freetype-devel fontconfig-devel
cargo install --git https://github.com/neovide/neovide
