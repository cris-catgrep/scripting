#!/bin/bash

# Script que utiliza una funcion recursiva y case para elegir tu distro favorita

function prompt_favorite_distro () {

  echo 'What is your favorite Linux distro?'
  echo "1 - Arch"
  echo "2 - CentOS"
  echo "3 - Debian"
  echo "4 - Mint"
  echo "5 - Ubuntu"
  echo "6 - Something else..."
  echo "x - exit"

  # Se lee el valor que el usuario le da a la variable distro
  read -r distro;

  # Se inicia un case utilizando el valor de distro como elección
  case $distro in
    1) echo "Arch is a rolling release";;
    2) echo "Centos";;
    3) echo "Debian";;
    4) echo "Mint";;
    5) echo "Ubuntu";;
    6) echo "6 - Something else...";;
    # Si el usuario elige salir se termina el script co exit code 0
    x) echo "Alright then, see ya." && exit 0;;
    # Si el usuario no da un valor valido se le pide ingresar uno y se vuelve a llamar a la funcion
    *) echo "$distro is not a valid option. Please select a valid option" && prompt_favorite_distro;;
  esac

}

