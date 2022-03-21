#!/bin/bash

# Updating data in repositories, and updating packages
sudo apt update && upgrade

#Install packages
sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-11-jdk zram-config

# Adding configuration to ~/.profile
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile

# Configuration application
source ~/.profile

# Entering github account data
read -p "Enter your email:" email
read -p "Enter your github nickname:" nick

# Git configuration
git config --global user.email "$email"
git config --global user.name "$nick"

# Cache configuration
read -p "Enter your nickname user:" user

# Create cache
sudo mkdir /mnt/ccache
sudo mount --bind /home/$user/.cache/ccache /mnt/ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/mnt/ccache
ccache -M 100G -F 0

#disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
