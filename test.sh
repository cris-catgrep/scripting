#!/bin/bash

for dir1 in * ; do
    if [[ $(find $dir1 -mtime +1) ]]; then
        echo "$dir1 viejo"
    else
        echo "$dir1 nuevo"
    fi
done
