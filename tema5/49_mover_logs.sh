#!/bin/bash
logs="/var/log/mis_logs"
destino="/home/jefe/curso/mis_logs/"
mover () {
date >> "$destino"milog
mv $logs/* $destino
trap - TERM INT #reasignamos las señales por defecto
exit
}
while : ; do
trap mover TERM INT #capturamos interrupciones típicas
done
