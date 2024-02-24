#!/bin/bash

# Etcher

# screenshot tool
sudo apt install scrot flameshot

sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.signal.Signal
