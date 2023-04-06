# i3
*Note: This setup assumes some configs and scripts like 
`startup.sh`, `xmodmap.conf` and `i3status.conf` are available at
`~/user/Github/Dotfiles/config/i3`. See `$dotfiles_i3_path` in i3 config file.
Please modify the configs to suit your needs.*

## Installation

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

