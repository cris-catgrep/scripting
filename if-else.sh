#!/bin/bash
#Script que compara la terminal actual $TERM con el valor dado por el usuario en un if else

function func01 {
    # Al ejecutar el script debes de especificar un nombre, por ello se utiliza la variable $1
    # Ej: ./if-else.sh xterm
    
    if [ $TERM = $1 ]; then
        echo $1
    else
        echo "no jala"
    fi
    }
func01 $1
