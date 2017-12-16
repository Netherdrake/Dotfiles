
# Installation

## Fonts
```
sudo apt install powerline
fc-cache -vf
```
Then, set the terminal font to `Source Code Pro Powerline Regular`.
Possible contenders are also `d2coding and droid sans`.

For l337 icon suppport, install [Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases).
```
mkdir ~/.fonts
cp ~/Downloads/fo/fonts/*.tff ~/.fonts
```

## playerctl
Get it here: https://github.com/acrisci/playerctl/releases
```
sudo dpkg -i playerctl-...-amd64.deb
```

## Other Dependencies
```
sudo apt install -y rofi
```

# Usage

## Keyboard Bindings
```
xmodmap ~/Github/Dotfiles/config/i3/xmodmap.cfg
```

## Stacked Dual-Monitor Workflow
```
xrandr --output HDMI-0 --auto --above DP-0 --auto
```
Or just use `arandr` if you're a normie xD

