#!/bin/bash

sudo apt install llvm

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

cabal install fast-tags
cabal install hoogle
hoogle generate --local

stack install haskell-dap ghci-dap haskell-debug-adapter
