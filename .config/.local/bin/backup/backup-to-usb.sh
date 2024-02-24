#!/bin/sh

# backup home to usb
rsync -aAXvz --ignore-errors --delete --progress \
	--exclude downloads \
	--exclude documents/BlackmagicDesign \
	--exclude GPUCache \
	--exclude music \
	--exclude torrents \
	--exclude videos \
	--exclude .config \
	--exclude .cache \
	--exclude .dbus \
	--exclude .floorp \
	--exclude .var \
	--exclude .googleearth \
	--exclude .local/share/flatpak \
	/home/twilight /mnt/usb
