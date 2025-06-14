#!/bin/bash

# Script que muestra la prioridad de ejecucion y manipulacion del codigo exit

directory=/etc

# Verifica la existencia del directorio $directory
if [ -d $directory ]; then
    echo "Existe el directorio $directory"
    # Termina el programa y da un valor de salida de 0 
    exit 0
else
    echo "No existe el directorio $directory"
    # Termina el programa y da un valor de salida de 1
    # De no hacerlo el valor de salida seria 0, ya que echo se ejecuto de forma satisfactoria
    exit 1
fi

echo "El codigo de salida es $?"
echo "Aunque no veras esto por la prioridad de ejecucion"
echo "El comando exit termina la ejecucion del script"
