# installscript-creator-linux
Creates a install script suitable for your project in Bash

Run in terminal with installscript-creator command

Commands:

```
installscript-creator --reinstall (reinstall/update the application)
installscript-creator --uninstall (uninstall the application)
installscript-creator --run (runs the application)

Part of peanut-tools

How to create binary file with subcommands:
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
