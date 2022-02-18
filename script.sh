#!/bin/bash

# Checking if user is Root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

clear
echo "Enter your Github Username "
read git_name
echo "Enter your Github Email "
read git_email
echo "Enter your Github Personal token "
read git_token

echo "#######################################################################################"
./figlet "Updating Mirrors"
echo "#######################################################################################"

pacman -Syy
# Setting Chaotic Aur, Blackarch and Sublime Repo
echo "Adding Chaotic-aur and Sublimetext to pacman.conf"

# Adding Sublime-text key and stuff
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

# Adding Chaotic essentials
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Adding chaotic aur and sublime-text in pacman.conf
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" >> /etc/pacman.conf

# Adding Blackarch
curl https://blackarch.org/strap.sh | sudo bash

# Installing Packages
pacman -Syyu fish yay git sublime-text sublime-merge vscodium vscodium-marketplace transmission-cli mpv-full-git tlauncher pamac appimagelauncher google-chrome gimp libreoffice-fresh

# Changing Shell
chsh dinex -s /bin/fish

# Setting up git 
figlet "Setting Up Git"
git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global credential.helper store
echo "https://$git_name:$git_token@github.com"> ~/.git-credentials
echo "Press Enter to exit "
read exit
clear