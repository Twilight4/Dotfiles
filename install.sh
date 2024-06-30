#!/bin/bash

#####################
# Installation mode #
#####################
source .config/.install/colors.sh
source .config/.install/library.sh
clear

mode="live"
if [ ! -z $1 ]; then
	mode="dev"
	echo "IMPORTANT: DEV MODE ACTIVATED. "
	echo "Existing dotfiles folder will not be modified."
	echo "Symbolic links will not be created."
fi

################
# Presentation #
################
echo "
          _ ._  _ , _ ._
        (_ ' ( \`  )_  .__)
      ( (  (    )   \`)  ) _)
     (__ (_   (_ . _) _) ,__)
           ~~\ ' . /~~
         ,::: ;   ; :::,
        ':::::::::::::::'
 ____________/_ __ \______________
|                                 |
| Welcome to Twilight4's dotfiles |
|_________________________________|
"
echo ""
echo "This script will delete all your configuration files."
echo "Use at your own risk."
echo ""

################
# Installation #
################
source .config/.install/confirm-start.sh
source .config/.install/install-hypr-packages.sh
source .config/.install/cleanup-homedir.sh
source .config/.install/wallpaper.sh
source .config/.install/install-fonts.sh
source .config/.install/install-dotfiles.sh
source .config/.install/button-layout.sh
source .config/.install/zsh.sh
source .config/.install/auto-cpufreq.sh
source .config/.install/enable-services.sh
source .config/.install/locales.sh
source .config/.install/final-message.sh
#source .config/.install/arch-install-pen.sh       # TODO
# Don't use anymore
#source .config/.install/display-manager.sh
#source .config/.install/tty-login.sh
#source .config/.install/nnn.sh
