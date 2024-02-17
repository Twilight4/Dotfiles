#!/bin/bash

cat <<"EOF"
 _           _        _ _       _       _    __ _ _           
(_)_ __  ___| |_ __ _| | |   __| | ___ | |_ / _(_) | ___  ___ 
| | '_ \/ __| __/ _` | | |  / _` |/ _ \| __| |_| | |/ _ \/ __|
| | | | \__ \ || (_| | | | | (_| | (_) | |_|  _| | |  __/\__ \
|_|_| |_|___/\__\__,_|_|_|  \__,_|\___/ \__|_| |_|_|\___||___/

EOF

# Function to install dotfiles using symlinks
install_symlinks() {
    echo "Installing dotfiles using symlinks..."
    _installSymLink kitty ~/.config/kitty ~/desktop/workspace/dotfiles/.config/kitty/ ~/.config
    _installSymLink btop ~/.config/btop ~/desktop/workspace/dotfiles/.config/btop/ ~/.config
    _installSymLink cava ~/.config/cava ~/desktop/workspace/dotfiles/.config/cava/ ~/.config
    _installSymLink cheat ~/.config/cheat ~/desktop/workspace/dotfiles/.config/cheat/ ~/.config
    _installSymLink emacs ~/.config/emacs ~/desktop/workspace/dotfiles/.config/emacs/ ~/.config
    _installSymLink fontconfig ~/.config/fontconfig ~/desktop/workspace/dotfiles/.config/fontconfig/ ~/.config
    _installSymLink foot ~/.config/foot ~/desktop/workspace/dotfiles/.config/foot/ ~/.config
    _installSymLink fortune ~/.config/fortune ~/desktop/workspace/dotfiles/.config/fortune/ ~/.config
    _installSymLink git ~/.config/git ~/desktop/workspace/dotfiles/.config/git/ ~/.config
    _installSymLink gtklock ~/.config/gtklock ~/desktop/workspace/dotfiles/.config/gtklock/ ~/.config
    _installSymLink lsd ~/.config/lsd ~/desktop/workspace/dotfiles/.config/lsd/ ~/.config
    _installSymLink mpd ~/.config/mpd ~/desktop/workspace/dotfiles/.config/mpd/ ~/.config
    _installSymLink mpv ~/.config/mpv ~/desktop/workspace/dotfiles/.config/mpv/ ~/.config
    _installSymLink navi ~/.config/navi ~/desktop/workspace/dotfiles/.config/navi/ ~/.config
    _installSymLink newsboat ~/.config/newsboat ~/desktop/workspace/dotfiles/.config/newsboat/ ~/.config
    _installSymLink npm ~/.config/npm ~/desktop/workspace/dotfiles/.config/npm/ ~/.config
    _installSymLink pipewire.conf.d ~/.config/pipewire.conf.d ~/desktop/workspace/dotfiles/.config/pipewire.conf.d/ ~/.config
    _installSymLink psd ~/.config/psd ~/desktop/workspace/dotfiles/.config/psd/ ~/.config
    _installSymLink wal ~/.config/wal ~/desktop/workspace/dotfiles/.config/wal/ ~/.config
    _installSymLink zathura ~/.config/zathura ~/desktop/workspace/dotfiles/.config/zathura/ ~/.config
    _installSymLink zsh ~/.config/zsh ~/desktop/workspace/dotfiles/.config/zsh/ ~/.config
    _installSymLink user-dirs.dirs ~/.config/user-dirs.dirs ~/desktop/workspace/dotfiles/.config/user-dirs.dirs ~/.config
    _installSymLink rofi ~/.config/rofi ~/desktop/workspace/dotfiles/.config/rofi/ ~/.config
    _installSymLink dunst ~/.config/dunst ~/desktop/workspace/dotfiles/.config/dunst/ ~/.config
    _installSymLink hypr ~/.config/hypr ~/desktop/workspace/dotfiles/.config/hypr/ ~/.config
    _installSymLink waybar ~/.config/waybar ~/desktop/workspace/dotfiles/.config/waybar/ ~/.config
    _installSymLink swaylock ~/.config/swaylock ~/desktop/workspace/dotfiles/.config/swaylock/ ~/.config
    _installSymLink wlogout ~/.config/wlogout ~/desktop/workspace/dotfiles/.config/wlogout/ ~/.config
    _installSymLink swappy ~/.config/swappy ~/desktop/workspace/dotfiles/.config/swappy/ ~/.config
    _installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/desktop/workspace/dotfiles/.config/gtk-3.0/ ~/.config/
    _installSymLink gtk-4.0 ~/.config/gtk-4.0 ~/desktop/workspace/dotfiles/.config/gtk-4.0/ ~/.config/
}

# Function to install dotfiles by copying files to ~/.config
install_by_copy() {
    echo "Installing dotfiles by copying files to ~/.config..."
    mv ~/.config ~/.config.bak
	cp -r ~/downloads/dotfiles/.config ~
}

# Main function
main() {
    echo "Choose installation method:"
    echo "1. Install using symlinks"
    echo "2. Install by copying files to ~/.config"
    echo "3. Skip installation"

    read -p "Enter your choice: " choice

    case $choice in
        1) install_symlinks ;;
        2) install_by_copy ;;
        3) echo "Skipping installation" ;;
        *) echo "Invalid choice. Please enter a number between 1 and 3." ;;
    esac

	# Setting mime type for org mode (org mode is not recognised as it's own mime type by default)
	update-mime-database ~/.config/.local/share/mime
	xdg-mime default emacs.desktop text/org
}

main
