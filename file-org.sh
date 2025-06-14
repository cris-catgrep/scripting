#!/bin/bash

# Definir array con los directorios y la variable del directorio de descargas
directories=("3dprint" "documents" "media" "misc-files" "compressed" "isos")
down_dir="/home/$USER/Downloads/"

#Ciclo for para crear los directorios
for dir in "${directories[@]}"; do
    mkdir -p $down_dir$dir
done

# Mover todos los archhivos dependiendo de su extension a el directorio indicado
mv $down_dir*.pdf $down_dir*.docx $down_dir*.epub $down_dir*.xlsx $down_dir*.csv $down_dir${directories[1]} 2> /dev/null
mv $down_dir*.STL $down_dir*.stl $down_dir*.gcode $down_dir${directories[0]} 2> /dev/null
mv $down_dir*.jpg $down_dir*.png $down_dir*.webm $down_dir*.gif $down_dir${directories[2]} 2> /dev/null
mv $down_dir*.zip $down_dir*.rar $down_dir*.tar $down_dir*.tar.gz $down_dir*.tar.xz $down_dir${directories[4]} 2> /dev/null
mv $down_dir*.iso $down_dir*.iso.gz $down_dir${directories[5]} 2> /dev/null

# Mueve todos los archivos que no sean un directorio a "misc-files"
for file in "$down_dir"* ; do
    if [[ ! -d $file ]]; then
        mv $file $down_dir${directories[3]} 2> /dev/null
    fi
done
