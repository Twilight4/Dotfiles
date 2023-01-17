#!/bin/bash

echo “###############################################################################”
echo “Removing the pacman databases at /var/lib/pacman/sync/*”
echo “###############################################################################”
echo
sudo rm /var/lib/pacman/sync/*
echo

echo “###############################################################################”
echo “Removing /etc/pacman.d/gnupg folder”
echo “###############################################################################”
echo
sudo rm -rf /etc/pacman.d/gnupg/*
echo

echo “###############################################################################”
echo “Initialize pacman keys with pacman-key –init”
echo “###############################################################################”
echo
sudo pacman-key –init
echo

echo “###############################################################################”
echo “Populating keyring with pacman-key –populate”
echo “###############################################################################”
echo
sudo pacman-key –populate
echo

echo “###############################################################################”
echo “Getting new databasesw with pacman -Sy”
echo “###############################################################################”
echo
sudo pacman -Sy
echo

echo “###############################################################################”
echo “### DONE ####”
echo “###############################################################################”
