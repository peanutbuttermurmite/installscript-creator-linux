#!/bin/bash
#Creates the main installation script
read -p "Name of your application:" appname2
read -p "Name/directory of .desktop file (optional):" desktopfile2
read -p "Name/directory of .png file (optional)(referenced in .desktop file):" imagefile2
read -p "Python dependencies, separated by spaces (optional):" pythondeps2
read -p "Directory of binary file:" binaryfile2
read -p "Enter dependencies, separated by spaces:" dependencies2

mkdir $appname2
cd $appname2
mkdir install
cd ..
mv binaryfile2 $appname2/install
mv imagefile2 $appname2/install
mv desktopfile2 $appname2/install
mv script.txt $appname2/install
cd $appname2/install
touch installer.sh
sed -i 's/$appname/'"$appname2"'/g' script.txt
sed -i 's/$desktopfile/'"$desktopfile2"'/g'script.txt
sed -i 's/$binaryfile/'"$binaryfile2"'/g' script.txt
sed -i 's/$pythondeps/'"$pythondeps2"'/g' script.txt
sed -i 's/$dependencies/'"$dependencies2"'/g' script.txt
cat script.txt >> installer.sh
