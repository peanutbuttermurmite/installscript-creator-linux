# installscript-creator-linux
Creates a install script suitable for your project in Bash using the included Bash snippets


How to add commands for your program:
```
#'Usage' outputs text when no subcommands are given
#eg. If you made an example.sh using the code below and did ./example.sh ,the output would be ./example.sh:command subcommand

if [ $# -ne 1 ]; then
    echo $0: usage: command subcommand
    exit 1
fi
#Define subcommands here
name=$1
name2="--reinstall"
#name2 defines the name of the subcommand
if [[ $name == $name2 ]]; then
 #Enter the desired function below
 echo "example"
```
Framework for Bash installer script:
```
#!/bin/bash
#Grabs OS info and uses it to install dependencies in a friendly, distro-agnostic way

declare -A osInfo;
#Operating Systems can be added here, but the os info needs to be in /etc
osInfo[/etc/debian_version]='apt install -y'
osInfo[/etc/alpine-release]='apk --update add'
osInfo[/etc/centos-release]='yum install -y'
osInfo[/etc/fedora-release]='dnf install -y'
for f in "${!osInfo[@]}"
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done
(
# =================================================================
echo "# Running First Task." ; sleep 2
# Command for first task goes on this line.
#Example Packages
PKGS=(
'python3'
'python3-tk'
'yad'
'python3-pip'
'python3-pil'
'python3-pil.imagetk'
)
space=" "

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    VAR3="$package_manager$space$PKG"
    $VAR3
done

# =================================================================
echo "25"
echo "# Running Second Task." ; sleep 2
# Command for second task goes on this line.
#Where pythondeps are your python dependencies
PYTHONDEPS=(
'python3'
'python3-tk'
'yad'
'python3-pip'
'python3-pil'
'python3-pil.imagetk'
)
space=" "
pythonpkg="pip3 install"

for PYTHONDEP in "${PYTHONDEPS[@]}"; do
    echo "INSTALLING: ${PYTHONDEP}"
    VAR4="$pythonpkg$space$PYTHONDEP"
    $VAR4
done

# =================================================================
echo "50"
echo "# Running Third Task." ; sleep 2
# Command for third task goes on this line.
#Where binaryfile is your binary file, appname is the name of your program and desktopfile is the name of your .desktop file
(cd $appname/install) || exit
chmod a+x $binaryfile
(cd ..)
(cd ..)
sudo mv $appname /opt
sudo ln -s /opt/$appname/install/$binaryfile /usr/local/bin/$binaryname
sudo cp -r $desktopfile ~/.local/share


# =================================================================

echo "# All finished." ; sleep 2
echo "100"


) |
yad --progress \
  --title="Progress Status" \
  --text="First Task." \
  --percentage=0 \
  --auto-close \
  --auto-kill

(( $? != 0 )) && zenity --error --text="Error in zenity command."

exit 0
```
