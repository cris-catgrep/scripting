#!/bin/bash

back_dest_path=/home/$USER/disc/backup/
back_org_path=/home/$USER/Documents/
file=$(date +"%Y-%m-%d").tar.gz

# Realiza un backup del directorio origen al directorio destino de forma incremental comprimiendo los archivos
/usr/bin/rsync -azv --exclude={'isos/','BlackmagicDesign/','respaldo/','rev2/','logseq/','Notas/'} $back_org_path $back_dest_path

if [[ ! -f "$back_dest_path$file" ]]; then
    # Crea un .tar.gz del directorio destino especificado con -C y el punto
    tar  -cvzf "$back_dest_path$file" -C $back_dest_path .
else
    echo "Respaldo existente"
    echo "$back_dest_path""$file"
    exit 0
fi
