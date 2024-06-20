#!/bin/bash

# Ciclo for que imprime el directorio donde se encuentran los archivos docker-compose de contenedor ejecutandose
for dir in $(sudo docker compose ls | awk 'NR>1 { print $3 }'); do
    # Retirar permiso sudo a docker
    dirname "$dir"
done
