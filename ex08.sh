#!/bin/bash

# Script que imprime la hora a la que se ejecuto

logfile=archlog.log

echo "Este script se ejecutó a las: $(date)" > $logfile
