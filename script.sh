#!/bin/bash

#if [ "$(id -u)" != "0" ]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi
sudo pacman 
clear
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
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" >> file
pacman -S
echo "Press Enter to exit "
read exit
clear