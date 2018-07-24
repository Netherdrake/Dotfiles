# i3
*Note: This setup assumes some configs and scripts like 
`startup.sh`, `xmodmap.conf` and `i3status.conf` are available at
`~/user/Github/Dotfiles/config/i3`. See `$dotfiles_i3_path` in i3 config file.
Please modify the configs to suit your needs.*

## Installation

### Fonts
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

### playerctl
Get it here: https://github.com/acrisci/playerctl/releases
```
sudo dpkg -i playerctl-...-amd64.deb
```

### Other Dependencies
```
sudo apt install -y rofi
```

## Usage

### Keyboard Bindings
```
xmodmap ~/Github/Dotfiles/config/i3/xmodmap.cfg
```

### Stacked Dual-Monitor Workflow
```
xrandr --output HDMI-0 --auto --above DP-0 --auto
```
Or just use `arandr` if you're a normie xD


# Gnome

## Tilix
To export the tilix config, run:
```
dconf dump /com/gexperts/Tilix/ > tilix.dconf
```

To import said config, run:
```
dconf load /com/gexperts/Tilix/ < tilix.dconf
```

## Extensions

https://extensions.gnome.org/extension/307/dash-to-dock/  
https://extensions.gnome.org/extension/545/hide-top-bar/  
https://extensions.gnome.org/extension/1031/topicons/  
https://extensions.gnome.org/extension/118/no-topleft-hot-corner/  
https://extensions.gnome.org/extension/1267/no-title-bar/ (for laptops only)  

https://extensions.gnome.org/extension/6/applications-menu/  
https://extensions.gnome.org/extension/7/removable-drive-menu/  
https://extensions.gnome.org/extension/8/places-status-indicator/  

https://extensions.gnome.org/extension/19/user-themes/  

## Keyboard mappings

Remap caps-lock as ESC:
```
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
```

## Tweaks

Only show current workspace windows in Alt-Tab:

```
gsettings set org.gnome.shell.app-switcher current-workspace-only true
```