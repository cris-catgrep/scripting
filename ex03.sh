#!/bin/bash

# Programa que muestra el uso de exit codes con la variable "$?"

package=htop

# >> realiza una redireccion al archivo package_install_results.log, nosotros no vemos el proceso
sudo dnf install $package >> package_install_results.log

# Compara el resultado del exit code de la variable "$?"
if [ $? -eq 0 ]; then
    echo "La instalacion de $package fue exitosa"
    echo "Se encuentra instalado en:"
    which $package
else
    # Manda el resultado fallido al archivo package_install_failure.log
    echo "Fallo la instalacion de $package" >> package_install_failure.log
fi
