# Regolith 2

## Additional Packages
```
sudo apt install i3xrocks-memory
```

## Optional: Install compositor
This is mainly used to provide opacity to out-of-focus windows.
```
sudo apt install regolith-compositor-picom-glx
```

Config: `~/.config/regolith2/picom/config`
```
inactive-opacity = 1;
active-opacity = 1;
frame-opacity = 1;
inactive-opacity-override = false;

# Dim inactive windows. (0.0 - 1.0)
inactive-dim = 0.00;
# Do not let dimness adjust based on window opacity.
inactive-dim-fixed = true;
```

# Gnome

## Keyboard mappings

Remap caps-lock as ESC:
```
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
```

Set screenshot tool:
```
gsettings set org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "Print"
gsettings set org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "scrot -e 'mv $f /home/user/Pictures'"
gsettings set org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Take a Screenshot (scrot)"
```

## Tweaks

Only show current workspace windows in Alt-Tab:

```
gsettings set org.gnome.shell.app-switcher current-workspace-only true
```

## Terminal settings
Backup:
```
dconf dump /org/gnome/terminal/ > gnome_terminal_settings.txt
```

Restore:
```
dconf load /org/gnome/terminal/ < gnome_terminal_settings.txt
```
