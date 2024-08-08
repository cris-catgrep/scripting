#!/bin/bash

# Script para sincronizar los respaldos de mi servidor
# Agregar "@reboot /path/al/script" en crontab para ejecutarlo en cada inicio del equipo

mkdir -p /home/$USER/disc/backup/server

rsync -az user@ip:/home/server-user/backup/ /home/$USER/disc/backup/server/
