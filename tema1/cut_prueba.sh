#!/bin/bash
fecha=$(date | tr -s " " | cut -d " " -f 1,2,3)
hora=$(date | tr -s " " |cut -d " " -f 5)
echo "Hoy es $fecha y son las $hora"
