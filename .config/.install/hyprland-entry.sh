#!/bin/bash

read -p "Do you want to create a Hyprland desktop entry? (y/n): " create_entry_choice

if [[ "$create_entry_choice" =~ ^[Yy]$ ]]; then
    if command -v hyprland >/dev/null; then
        echo "Creating Hyprland desktop entry..."

        hypr_script=$(command -v hyprland)

        echo "[Desktop Entry]
        Name=Hyprland
        Comment=hyprland
        Exec=\"$hypr_script\"   # IF CRASHES TRY: bash -c \"$hypr_script\"
        Type=Application" | sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null

        echo "Hyprland desktop entry created."
    else
        echo "Hyprland is not installed."
    fi
else
    echo "Creation of Hyprland desktop entry canceled by user."
fi
