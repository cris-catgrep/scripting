#!/bin/bash

# Script que comprime todos los archivos .log dentro del directorio logfiles

# El loop se ejecutará por cada archivo dentro del directorio "logfiles" y que tenga una extensión .log
for file in ./logfiles/*.log
do
    # tar -create --gzip --file $file.tar.gz --verbose $file
    tar -czvf $file.tar.gz $file
done
