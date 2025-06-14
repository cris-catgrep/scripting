#!/bin/bash
########## ESTE SCRIPT ES SOLO PARA APRENDER A UTILIZAR ARRAYS#############
########## NO FUNCIONA CORRECTAMENTE #############

# Definir un array  de las extensiones de los archivos

file_3dprint=(".gcode" ".stl" ".3mf")
file_docs=(".pdf" ".epub" ".docx")
file_images=(".jpg" ".png")
directorios=("document-files" "media" "3dprint" "misc-files")

downloads_directory=/home/$USER/Downloads/

#Cilclo for que crea los directorios necesarios dentro del directorios de descargas
for dir in "${directorios[@]}"; do
    mkdir -p $downloads_directory$dir
done

# Ciclo para ir a traves de los archivos dentro del directorio de Downloads.
for file in "$downloads_directory"*; do
    if [[ $file == *"${file_docs[0]}" || $file == *"${file_docs[1]}" || $file == *"${file_docs[2]}" ]]; then
       mv "$file" $downloads_directory${directorios[0]}
       #echo $downloads_directory${directorios[0]}
#        echo $file
    elif [[ $file == *"${file_3dprint[0]}" || $file == *"${file_3dprint[1]}" || $file == *"${file_3dprint[2]}" ]]; then
       mv "$file" $downloads_directory${directorios[2]}
       #echo $downloads_directory${directorios[1]}

    elif [[ $file == *"${file_images[0]}" || $file == *"${file_images[1]}" || $file == *"${file_images[2]}" ]]; then
       mv "$file" $downloads_directory${directorios[1]}
       #echo $downloads_directory${directorios[2]}
    else;
        mv "$file" $downloads_directory${directorios[3]}
    fi
done

if [ -d $downloads_directory$directorios ]; then
    echo "No existen los directorios $directorios"
 #   exit 0
fi

echo ${directorios[@]}

#mkdir document-files
#ls -lh $downloads_directory*$file_3dprint
