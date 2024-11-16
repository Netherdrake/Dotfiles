#!/bin/bash
cd ~/Github
git clone https://github.com/odin-lang/Odin.git
git clone https://github.com/DanielGavin/ols.git

cd Odin
make release-active
cp odin ~/bin/
cd ..

cd ols
odin build src/ -show-timings -collection:src=src -out:ols -microarch:native -no-bounds-check -o:speed
