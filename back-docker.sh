#!/bin/bash

# Ciclo for que imprime el directorio donde se encuentran los archivos docker-compose de contenedor ejecutandose
for dir in $(sudo docker compose ls | awk 'NR>1 { print $3 }'); do
    # Retirar permiso sudo a docker
    # Guarda una variable con el directorio del docker compose, luego hace cd al director y detiene todo el compose
    directory=$(dirname "$dir")
    cd "$directory" #&& sudo docker compose stop
    
    for cont in $(sudo docker compose ps -a | awk 'NR>1 { print $1 }'); do
        echo $cont 
        sudo docker inspect --format '{{range .Mounts}} {{.Source}} {{.Destination}} {{println}}{{end}}'
    done
done
