#!/bin/bash

# Script para actualizar automaticamente dependiendo de la distribucion que se utilice

# Variable que apunta al archivo con el release del sistema
release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater-error.log

# Funcion que indica si ocurrió un error y donde revisarlo
revisar_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Ha ocurrido un error, revisa el log $errorlog"
    fi
}

if grep -q "Arch" $release_file; then
    # Host basado en Arch, utilizar gestor pacman
    sudo pacman -Syu >>$logfile 2>> $errorlog
    revisar_exit_status
fi

if grep -q "fedora" $release_file; then
    # Host basado en Fedora, utilizar gestor dnf
    sudo dnf update | tee -a $logfile 2>> $errorlog
    revisar_exit_status
fi

if grep -q "debian" $release_file || grep -q "debian" $release_file; then
    # Host basado en Debian, utilizar gestor apt
    sudo apt update >>$logfile 2>>errorlog
    revisar_exit_status
    sudo apt dist-upgrade >>$logfile 2>>errorlog
    revisar_exit_status
fi
