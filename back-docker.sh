#!/bin/bash

####################################################
# SOLO FUNCIONA CON MOUNT POINTS, NO CON VOLUMENES #
####################################################

backup_dir=/home/$USER/backup
fecha=$(date '+%Y-%m-%d')

mkdir -p $backup_dir
mkdir -p $backup_dir/$fecha

# Funcion que revisa la última fecha de modificación de los directorios de respaldos y elimina aquellos mayores a 7 dias
function dir_clean() {
    cd $backup_dir
    for dir1 in * ; do
        if [[ $(find $dir1 -mtime +7) ]]; then
            rm -rf $dir1
        fi
    done
}

# Ciclo for que imprime el directorio donde se encuentran los archivos docker-compose de contenedor ejecutandose
for dir in $(sudo docker compose ls | awk 'NR>1 { print $3 }'); do
    # Retirar permiso sudo a docker
    # Guarda una variable con el directorio del docker compose, luego hace cd al director y detiene todo el compose
    directory=$(dirname "$dir")
    cd "$directory" #&& sudo docker compose stop
    
    # Ciclo en el que ira por cada compose activo o detenido
    for cont in $(sudo docker compose ps -a | awk 'NR>1 { print $1 }'); do
        for vol in $(sudo docker inspect --format='{{range .Mounts}}{{println .Source}}{{end}}' "$cont"); do
            if [[ -z "$vol" ]]; then
                echo "$cont"
            elif [[ -d "$vol" ]]; then
                sudo docker compose stop
                if [[ "$vol" == "$directory"* ]]; then
                    dir=$(basename "$vol")
                    sudo docker run --rm -v "$vol":/volume -v "$backup_dir/$fecha":/backup alpine tar -czf /backup/$cont-$dir-$fecha.tar.gz -C /volume ./
                else
                    echo "nada"
                fi
            fi
            sudo docker compose up -d
        done
    done
done

dir_clean
