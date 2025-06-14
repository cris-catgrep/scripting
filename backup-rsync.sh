#!/bin/bash

back_dest_path=/home/$USER/Documents/testing/bash/backup
back_org_path=/home/$USER/Documents/testing/bash/
file=$(date +"%Y-%m-%d").tar.gz

# Realiza un backup del directorio origen al directorio destino de forma incremental comprimiendo los archivos
/usr/bin/rsync -azv $back_org_path $back_dest_path

if [[ ! -f /home/$USER/Documents/"$file" ]]; then
    # Crea un .tar.gz del directorio destino especificado con -C y el punto
    tar  -cvzf /home/$USER/Documents/"$file" -C $back_dest_path .
else
    echo "Respaldo existente"
    exit 0
fi
