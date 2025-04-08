#!/bin/bash
echo valor del PID $$ y del padre $PPID
var=prueba
source 1.sh
./2.sh #Este se ejecuta cómo script externo, sin relación con el principal
source 3.sh
