bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install ocaml-lsp-server odoc ocamlformat utop merlin
