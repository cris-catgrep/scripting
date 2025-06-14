#!/bin/bash
# Script para imprimir variables
echo "Cual es tu nombre?"
read a
#a=Hello
b=$a
# c=`hostname`
c=$(hostname)

echo $a $b $c
