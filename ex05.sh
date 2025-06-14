#!/bin/bash
#Script que muestra el funcionamiento de un loop while

# Crea un loop while que comprueba si existe el archivo "testfile"
while [ -f ./testfile ]; do
    # Imprime la fecha y que existe
    echo "Hoy $(date), el archivo existe"
    sleep 5
done

# Imprime la última fecha en que no lo vio
echo "Hoy $(date), el archivo ya no se pudo encontrar"
