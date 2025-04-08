#!/bin/bash
echo Se va a copiar el archivo $1 en $2 y en $3
echo En 5 segundos comenzará la copia.
echo Puede cancelar pulsando CTRL-C
sleep 5
cp $1 $2 &>> copia1.log || exit 1
cp $1 $3 &>> copia2.log || echo Falló la copia 2
echo Copias finalizadas

