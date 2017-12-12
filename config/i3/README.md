# Installation

## Fonts
```
sudo apt install powerline
fc-cache -vf
```
Then, set the terminal font to `Source Code Pro Powerline Regular`.
Possible contenders are also `d2coding and droid sans`.

# Usage

## Keyboard Bindings
```
xmodmap ~/Github/Dotfiles/config/i3/xmodmap.cfg
```

## Stacked Dual-Monitor Workflow
```
xrandr --output HDMI-0 --auto --above DP-0 --auto
```

