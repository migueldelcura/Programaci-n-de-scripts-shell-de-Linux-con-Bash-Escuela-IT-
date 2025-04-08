#!/bin/bash
#gigas=$(df -h | grep sda5 | cut -d " " -f 4)
gigas=$(df -h | grep sda5 | tr -s " " | cut -d " " -f 4)
echo “El tamaño de sda5 es $gigas”
echo ¿Seguro que todo está correcto?
