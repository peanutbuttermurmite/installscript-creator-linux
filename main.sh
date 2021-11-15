#!/bin/bash
#Creates the main installation script
read -p "Name of your application:" appname2
read -p "Name/directory of .desktop file (optional):" desktopfile2
read -p "Name/directory of .png file (optional)(referenced in .desktop file):" imagefile
read -p "Python dependencies, separated by spaces (optional):" pythondeps2
read -p "Directory of binary file:" binaryfile2
read -p "Enter dependencies, separated by spaces:" dependencies2

mkdir $appname
cd $appname
mkdir install
cd ..
mv binaryfile $appname/install
mv imagefile $appname/install
mv desktopfile $appname/install

cd $appname/install
touch installer.sh
sed -i 's/$appname/$appname2/g' script.txt
sed -i 's/$desktopfile/$desktopfile2/g' script.txt
sed -i 's/$binaryfile/$binaryfile2/g' script.txt
sed -i 's/$pythondeps/$pythondeps2/g' script.txt
sed -i 's/$dependencies/$dependencies2/g' script.txt
cat script.txt >> installer.sh
