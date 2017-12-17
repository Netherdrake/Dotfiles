#!/bin/bash
xrandr --output HDMI-0 --auto --above DP-0 --auto
xmodmap ~/Github/Dotfiles/config/i3/xmodmap.cfg
redshift &

