#!/bin/bash
backup_dir=/home/$USER/backup

mkdir -p $backup_dir

# Ciclo for que imprime el directorio donde se encuentran los archivos docker-compose de contenedor ejecutandose
for dir in $(sudo docker compose ls | awk 'NR>1 { print $3 }'); do
    # Retirar permiso sudo a docker
    # Guarda una variable con el directorio del docker compose, luego hace cd al director y detiene todo el compose
    directory=$(dirname "$dir")
    cd "$directory" #&& sudo docker compose stop
    
    # Ciclo en el que ira por cada compose activo o detenido
    for cont in $(sudo docker compose ps -a | awk 'NR>1 { print $1 }'); do
        if [[ -z "$vol" ]]; then
            echo "$cont"
        elif [[ -d "$vol" ]]; then
            sudo docker compose stop
            if [[ "$vol" == "$directory"* ]]; then
                sudo docker run --rm -v "$vol":/volume -v "$backup_dir":/backup alpine tar -czf /backup/$cont.tar.gz -C /volume ./
            else
                echo "nada"
            fi
        fi

        done
    done
done
