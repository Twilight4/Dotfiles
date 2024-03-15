#!/bin/bash

packagesPacman=(
	"linux-amd-znver3"
	"linux-amd-znver3-headers"
	"pacman-contrib"
	"trizen"
	"hp-omen-wmi-dkms"
	"xfce4-power-manager"
	"git"
	"floorp"
	"ccache"
	"pipewire"
	"pipewire-alsa"
	"pipewire-audio"
	"pipewire-jack"
	"pipewire-pulse"
	"wireplumber"
	"nautilus"
	"nautilus-sendto"
	"sushi"
	"acpi"
	"rsync"
	"apparmor"
	"xorg-xhost"
	"irqbalance"
	"pkgfile"
	"firewalld"
	"diff-so-fancy"
	"mcfly"
	"mkinitcpio"
	"neovim"
	"chrony"
	"dkms"
	"expac"
	"findutils"
	"cava"
	"thefuck"
	"texlive-basic"
	"texlive-latex"
	"texlive-latexextra"
	"texlive-plaingeneric"
	"texlive-binextra"
	"python-pylatexenc"
	"ngrok"
	"supergfxctl"
	"openbsd-netcat"
	"wofi"
	"ananicy-cpp"
	"preload"
	"libnotify"
	"qt5ct"
	"qt5-wayland"
	"qt6-wayland"
	"grim"
	"slurp"
	"profile-sync-daemon"
	"zsh"
	"zsh-completions"
	"zsh-autosuggestions"
	"zsh-history-substring-search"
	"zsh-syntax-highlighting"
	"lsd"
	"fzf"
	"ripgrep"
	"the_silver_searcher"
	"sd"
	"bat"
	"playerctl"
	"net-tools"
	"wl-clipboard"
	"xdg-user-dirs"
	"swappy"
	"bleachbit"
	"pamixer"
	"foot"
	"zathura"
	"zathura-pdf-mupdf"
	"wf-recorder"
	"brightnessctl"
	"swayidle"
	"pavucontrol"
	"mpd"
	"upower"
	"mpc"
	"imagemagick"
	"ibus"
	"cowsay"
	"wildmidi"
	"timidity++"
	"ytfzf"
	"ncdu"
	"duf"
	"vnstat"
	"inxi"
	"wget"
	"taskell"
	"usbutils"
	"udiskie"
	"zenity"
	"python-pip"
	"trash-cli"
	"fd"
	"man"
	"xdotool"
	"xterm"
	"progress"
	"tokei"
	"procs"
	"npm"
	"kitty"
	"translate-shell"
	"hub"
	"nvtop"
	"socat"
	"ttf-jetbrains-mono-nerd"
	"ttf-meslo-nerd"
	"newsboat"
	"keepassxc"
	"xclip"
	"st"
	"songrec"
	"pv"
	"dog"
	"dust"
	"downgrade"
	"neofetch"
	"proxychains-ng"
	"torbrowser-launcher"
	"tor"
	"nyx"
	"torsocks"
	"openvpn"
	"protonvpn-cli"
	"gnome-calculator"
	"inetutils"
	"xh"
	"python-pyopenssl"
	"tgpt-bin"
	"python-pycryptodomex"
	"graphviz"
	"wlogout"
	"hblock"
	"nyancat"
	"ffmpeg4.4"
	"superproductivity-bin"
	"zotero-bin"
	"gnome-maps"
	"gnome-weather"
	"android-tools"
	"gvfs"
	"gvfs-gphoto2"
	"gvfs-mtp"
	"gvfs-nfs"
	"gvfs-smb"
	"xdg-user-dirs-gtk"
	"blanket"
	"swayimg"
	"tldr"
	"dbus-broker"
	"appmenu-gtk-module"
	"libdbusmenu-glib"
	"stacer"
	"python-pywhat"
	"megasync-bin"
	"megacmd"
	"evince"
	"git-delta"

	# Hyprland-specific
	"swaylock-effects-git"
	"fuzzel"
	"gnome-keyring"
	"polkit-gnome"
	"swww"
	"python-pywal"
	"dunst"
	"fortune-mod"
	"lolcat"
	"figlet"
)

packagesParu=(
	"pfetch"
	"yt-dlp"
	"tabbed-git"
	"nohang-git"
	"btop-git"
	"exa-git"
	"rofi-lbonn-wayland-git"
	"sway-audio-idle-inhibit-git"
	"wdisplays"
	"nwg-look-bin"
	"wlr-randr-git"
	"wl-clip-persist-git"
	"udev-block-notify-git"
	"dragon-drop"
	"xdg-ninja-git"
	"yt-dlp"
	"checkupdates-with-aur"
	"nohang-git"
	"cliphist"
	"authenticator"
	"cheat-bin"
	"tabbed-git"
	"betterlockscreen"
	"ffsend-bin"
	"ascii-image-converter-git"
	"cpufetch-git"
	"cpupower"
	"cloneit-git"
	"boxes"
	"wire-desktop"
	"sysz"
	"shellcheck-bin"
	"gitleaks"
	"net-snmp"
	"xcp-git"
	"nodejs-git-stats"
	"noise-suppression-for-voice-git"

	# Hyprland-specific
	"grimblast-git"
	"zsh-theme-powerlevel10k-git"
	"hyprland-git"
	"xdg-desktop-portal-hyprland-git"
	"xdg-desktop-portal"
	"hyprpicker-git"
)

nonessentialpackages=(
	"nautilus-megasync"
	"session-desktop"
	"musikcube-bin"
	"webcord"
	"tty-clock-git"
	"toilet"
	"cmatrix-git"
	"openrazer-meta"
	"ookla-speedtest-bin"
	"nitch-git"
	"caffeine-ng"
	"polychromatic-git"
	"asciiquarium-transparent-git"
)
