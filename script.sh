#!/bin/bash

#if [ "$(id -u)" != "0" ]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi

clear

echo "Enter your Github Username "
read git_name
echo "Enter your Github Email "
read git_email
echo "Enter your Github Personal token "
read git_oken

if pacman -Qs figlet > /dev/null ; then
  echo -e "#######################################################################################\n\nPrerequisites Satisfied Proceeding with installation\n"
else
	echo "installing prerequisites"
pacman -Sy figlet > /dev/null

fi
echo "#######################################################################################"
figlet "Updating system"
echo "#######################################################################################"
#pacman -Syyu

echo "Adding Chaotic-aur and Sublimetext to pacman.conf"
#curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
#pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
#pacman-key --lsign-key FBA220DFC880C036
#pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
#echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" >> file

#pacman -Syyu git sublime-text sublime-merge vscodium vscodium-marketplace transmission-cli mpv-full-git tlauncher pamac appimagelauncher google-chrome 

figlet "Setting Up Git"
git config --global user.name "$git_name"
git config --global user.email "$git_email"
echo "Press Enter to exit "
read exit
clear