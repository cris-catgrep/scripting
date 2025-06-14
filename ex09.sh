#!/bin/bash

# Script que comprueba si se le dio un solo argumento y muestra la cantidad de archivos en el directorio indicado como argumento

lines=$(ls -lh $1 | wc -l)

# $# indica la cantidad de argumentos totales
if [ $# -ne 1 ]; then
    echo "Necesitas especificar un argumento"
    exit 1
fi

# Es necesario utilizar doble () o no ejecutará el comando de la variable lines
echo "Tinenes $(($lines-1)) archivos en el directorio $1"
