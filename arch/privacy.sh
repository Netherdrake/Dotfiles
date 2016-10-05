#!/bin/bash

## Install Packages
sudo pacman -Syu
sudo pacman -Sy --needed truecrypt veracrypt encfs keepassx2 thunderbird
yaourt -Sy --needed thunderbird-enigmail
