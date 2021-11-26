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
