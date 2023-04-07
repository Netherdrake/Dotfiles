# Regolith 2

## Additional Packages
Theme:
```
sudo apt install regolith-look-dracula
```

Additional widgets:
```
sudo apt install i3xrocks-focused-window-name i3xrocks-rofication i3xrocks-info i3xrocks-memory
```

On laptop also:
```
sudo apt install i3xrocks-battery
```

## .Xresources
Set the black background. Update the date and clock configuration.

Config: `~/.config/regolith2/Xresources`
```
regolith.wallpaper.file: 
regolith.wallpaper.color.primary: black
regolith.look.path: /usr/share/regolith-look/dracula

i3xrocks.date.format2: "%a %b %d | %I:%M %p"

i3-wm.window.border.size: 4
i3-wm.floatingwindow.border.size: 4

i3-wm.client.focused.color.border: "#9B6BDF"
i3-wm.client.focused.color.background: "#9B6BDF"
i3-wm.client.focused.color.child_border: "#9B6BDF"
i3-wm.client.focused.color.indicator: "#c49ff9"

i3-wm.client.focused_inactive.color.border: "#bd93f9"
i3-wm.client.focused_inactive.color.indicator: "#44475a"
i3-wm.client.focused_inactive.color.child_border: "#44475a"
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

## Reference
General configuration:     https://regolith-desktop.com/docs/using-regolith/configuration/
Xresources configuration:  https://regolith-desktop.com/docs/reference/xresources/

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
