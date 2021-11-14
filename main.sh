#!/bin/bash
#Creates the main installation script
read -p "Name of your application" appname
read -p "Name/directory of .desktop file (optional)" desktopfile
read -p "Name/directory of .png file (optional)(referenced in .desktop file" imagefile
read -p "Python dependencies, separated by spaces (optional)" pythondeps
read -p "Directory of binary file" binaryfile
read -p "Enter dependencies, separated by spaces:" dependencies

mkdir $appname
cd $appname
mkdir install
cd ..
mv binaryfile $appname/install
mv imagefile $appname/install
mv desktopfile $appname/install

cd $appname/install
touch installer.sh
echo "declare -A osInfo;
osInfo[/etc/debian_version]='apt install -y'
osInfo[/etc/alpine-release]='apk --update add'
osInfo[/etc/centos-release]='yum install -y'
osInfo[/etc/fedora-release]='dnf install -y'
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done
package1=$dependencies > /dev/null
{package_manager}{package1}
pip3 install $pythondeps
yad --progress \
  --title='Dependency Install' \
  --text='All dependencies installed' \
  --percentage=33
  --autoclose
yad --progress \
  --title='Setting up files' \
  --text='Setting up...' \
  --percentage=66
  --autoclose
chmod a+x $binaryfile
cd ..
cd ..
sudo mv $appname /opt
sudo ln -s /opt/$appname/install /usr/local/bin/$appname
sudo cp -r $desktopfile ~/.local/share
yad --progress \
  --title= 'Application has been set up' \
  --text='Application has been installed.' \
  --percentage=100
  --autoclose
printf 'Operation Complete'
" >> installer.sh