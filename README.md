# Marq Dotfiles

For all the features to work you have to add the following lines to your visudo file:

```bash

marq ALL=(ALL) NOPASSWD: $HOME/.config/rofi/scripts/change_cattheme.sh
marq ALL=(ALL) NOPASSWD: /usr/bin/paru
```

## Required packages

```bash
sudo pacman -Syu dunst kitty neofetch rofi starship zsh && yay -Syu spicetify-cli eww waybar-git
```


- Dunst: Notification daemon configuration.
- Kitty: Terminal emulator configuration.
- Neofetch: System information display tool configuration.
- Rofi: Application launcher and window switcher configuration.
- Starship: Cross-shell prompt configuration.
- Zsh: Shell configuration.
- Spicetify-CLI: Spotify customization tool.
- Eww: A customizable system monitor and info widget.
- Waybar: Highly customizable Wayland-based bar for the desktop.

