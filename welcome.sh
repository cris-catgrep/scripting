#!/bin/bash

greeting="Welcome"
user=$(whoami)
day=$(date +%A)

echo "$greeting back $user! Today is $day"
# Para imprimir el output de un comando se deben de agregar esas comillas
echo `whoami`
echo "Your Bash shell version is: $BASH_VERSION. Enjoy!"
