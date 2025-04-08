#!/bin/bash
#Creamos la variable
fecha=$(date +%d_%m_%Y)

#Hacemos la copia
cp uno.txt "/home/$USERNAME/uno$fecha.txt"
#Hemos usado la variable de sistema USERNAME para que se guarde
#en el perfil del usuario en curso.
echo La variable \$fecha almacena la fecha del sistema #ejemplo de uso de un carácter de escape
