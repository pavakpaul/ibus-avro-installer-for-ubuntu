#! /bin/bash
#
#==================================================================
#This is a one click installer for ibus-avro for Ubuntu
#this will install avro phonetic keyboard layout for ibus engine.
#ibus-avro autometically integrates with Ubuntu desktop.
#ibus-avro: http://linux.omicronlab.com/
#This script is written by Pavak Paul | http://pavakpaul.in
#==================================================================
#
zenity --info --text "You must run this script from a terminal program!"
#Installing dependencies... 
#Ignoring package gir1.2-gjsdbus-1.0 as not found in wily 
echo "Installing dependencies"
sudo apt-get install -y git ibus libibus-1.0-dev automake autoconf gjs gir1.2-ibus-1.0
#setting up path for phase #1
echo "Setting up paths for phase #1"
cd /tmp
mkdir -p git
cd git
echo "current working directory: "
pwd
#Cloning git repository
echo "Downloading from git repository..."
git clone https://github.com/sarim/ibus-avro.git
#setting up path phase #2
echo "Setting up path for phase #2"
echo "Current working directory: "
pwd
cd ibus-avro
#compiling
echo "Compiling ibus-avro"
aclocal && autoconf && automake --add-missing
./configure --prefix=/usr
#installing
echo "Installing ibus-avro"
sudo make install
zenity --info --text "Avro should be installed on your system.\nPlease add avro in your Text Entry settings."
echo "Avro should be installed on your system. Please reboot system or re-login and add avro in your Text Entry settings."
echo "Bye..."
sleep 5s

