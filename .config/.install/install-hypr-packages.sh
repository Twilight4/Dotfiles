#!/bin/bash

bloat=(
  "swaylock"
  "swayidle"
  "garuda-system-maintenance"
  "garuda-hyprland-settings"
  "garuda-fish-config"
  "garuda-boot-options"
  "garuda-browser-settings"
  "firedragon"
  "garuda-gamer"
  "garuda-network-assistant"
  "garuda-setup-assistant"
  "garuda-welcome"
  "garuda-settings-manager"
  "garuda-assistant"
  "alacritty"
  "deluge-gtk"
  "eog"
  "evince"
  "foot"
  "fsearch"
  "geany"
  "gestures"
  "meld"
  "pace"
  "ranger"
  "mako"
  "gnome-system-monitor"
  "gnome-logs"
  "xfce4-terminal"
)

packages=(
  "garuda-blackarch"
  "brave-bin"
  "python-click"
  "python-tomlkit"
  "python-click-aliases"
  "neovim"
  "thefuck"
  "zoxide"
  "lsd"
  "trash-cli"
  "mtools"
  "swaybg"
  "wdisplays"
  "ripgrep"
  "the_silver_searcher"
  "irqbalance"
  "zenpower3-dkms"
  "acpi"
  "dkms"
  "emacs"
  "duf"
  "ncdu"
  "rlwrap"
  "speedtest-cli"
  "gnome-weather"
  "gnome-maps"
  "gnome-keyring"
  "cpufetch"
  "fd"
  "trash-cli"
  "cpupower"
  "mingw-w64"
  "zathura"
  "zathura-pdf-poppler"
  "grc"
  "udiskie"
  "usbutils"
  "wf-recorder"
  "net-tools"
  "upower"
  "apparmor"
  "thefuck"
  "libsecret"
  "chafa"
  "alsa-utils"
  "yt-dlp"
	"udev-block-notify-git"
  "pipewire"
  "pipewire-alsa"
  "wireplumber"
  "gtk-engine-murrine"
  "freerdp2"
  "proxychains"
  "dunst"
  "libnotify"
  "zsh"
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-history-substring-search"
  "zsh-syntax-highlighting"
  "rsync"
  "git"
  "cliphist"
  "cmatrix"
  "fortune-mod"
  "tty-clock"
  "wlr-randr-git"
  "cowsay"
  "ffmpeg"
  "grim"
  "gvfs"
  "figlet"
  "lolcat"
  "neofetch"
  "inxi"
  "findutils"
  "kitty"
  "pavucontrol"
  "playerctl"
  "python-requests"
  "python-pip"
  "qt5ct"
  "qt6ct"
  "slurp"
  "waybar"
  "wget"
  "wl-clipboard"
  "pkg-config"
  "wavemon"
  "wlogout"
  "xdg-user-dirs"
  "xdg-utils"
  "yad"
  "brightnessctl"
  "btop"
  "cava"
  "eog"
  "mpv"
  "mpv-mpris"
  "acpi"
  "acpid"
  "nvtop"
  "pamixer"
  "qalculate-gtk"
  "pywal-git"
  "xcp"
  "xh"
  "sliver-bin"
  "moar"
  "cheat-bin"
  "wire-desktop"
  "exa"
  "bat"
  "expac"
  "freetube"
  "dog"
  "ripgrep"
  "authenticator"
  "rofi-lbonn-wayland-git"
  "swaybg"
  "hyprlock"
  "ananicy-cpp"
  "nohang"
  "imagemagick"
  "rofi-lbonn-wayland-git"
  "swappy"
  "thunar"
  "kvantum-qt5"
  "git-delta"
  "translate-shell"
  "dust"
	"xdg-ninja-git"
	"ngrok"
	"firewalld"
	"sd"
	"pv"
)

extra=(
	"toilet"
	"caffeine-ng"
	"asciiquarium-transparent-git"
	"trizen"
	"sushi"
	"wildmidi"
	"timidity++"
	"vnstat"
	"taskell"
	"zenity"
	"progress"
	"tokei"
	"procs"
	"hub"
	"keepassxc"
	"songrec"
	"gnome-calculator"
	"python-pyopenssl"
	"python-pycryptodomex"
	"graphviz"
	"nyancat"
	"superproductivity-bin"
	"android-tools"
	"blanket"
	"swayimg"
	"appmenu-gtk-module"
	"libdbusmenu-glib"
	"python-pywhat"
	"megasync-bin"
	"megacmd"
	"tabbed-git"
	"sway-audio-idle-inhibit-git"
	"dragon-drop"
	"tabbed-git"
	"ffsend-bin"
	"ascii-image-converter-git"
	"boxes"
	"sysz"
	"shellcheck-bin"
	"net-snmp"
	"nodejs-git-stats"
	"noise-suppression-for-voice-git"
)

# First you have to uninstall the bloat
_uninstallPackagesParu "${bloat[@]}";

# Install packages
_installPackagesPacman "${packages[@]}";
#_installPackagesParu "${extra[@]}";
