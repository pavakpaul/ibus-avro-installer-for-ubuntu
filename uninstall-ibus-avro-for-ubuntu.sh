#! /bin/bash
#
#==================================================================
#This is a one click for for ibus-avroinstall via ibus-avro-installer-for-ubuntu-wily.sh
#this will uninstall avro phonetic keyboard layout for ibus engine, which was installed via ibus-avro-installer-for-ubuntu-wily.sh

#ibus-avro: http://linux.omicronlab.com/
#This script is written by Pavak Paul | https://pavakpaul.in
#==================================================================
#
#zenity --info --text "You must run this script from a terminal program!"
##Installing dependencies... 
##Ignoring package gir1.2-gjsdbus-1.0 as not found in wily 
#echo "Installing dependencies"
#sudo apt-get install -y git ibus libibus-1.0-dev automake autoconf gjs gir1.2-ibus-1.0
##setting up path for phase #1
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
#uninstalling
echo "Uninstalling ibus-avro"
sudo make uninstall
zenity --info --text "Avro should be uninstalled on your system."
echo "Avro should be uninstalled on your system."
echo "Bye..."
sleep 5s
