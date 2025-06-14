#!/bin/bash

# Este script es utilizado para respaldar el directorio home a /tmp/

user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d).tar.gz

# La función total_files reporta un número total de archivos en un directorio 
function total_files {
    find $1 -type f | wc -l
}

# La función total_directories reporta el número total de directorios en un directorio (especificado por la variable $1)

function total_directories {
    find $1 -type d | wc -l
}

function create_backup {
    if [ -e $output ]; then
        echo "Ya creado"
    else
        tar -czf $output $input 2> /dev/null
        echo "Respaldo de $input completado, detalles sobre el archivo de respaldo:"
        ls -l $output
        fi
    }

echo -n "Files to be included:"
total_files $input
echo -n "Directories to be included:"
total_directories $input

create_backup
