#!/bin/bash
# script que te pide nombre y lo compara con el del usuario actual
# Guarda el valor dado por el usuario en la variable "name"
read -p "Como te llamas?" name

if [ $name = $USER ]
then
	echo "Hola, yo"
else
	echo "hola $name"
fi
