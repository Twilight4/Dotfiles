#!/bin/bash
sudo rm -R /etc/pacman.d/gnupg
sudo rm -R /root/.gnupg
sudo rm /var/cache/pacman -rf
sudo dirmngr </dev/null
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syyuu
