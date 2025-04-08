#!/bin/bash
clear
for user in $(cat usuarios_datos.txt)
do
        read -p "Indique tlfno. y edad de $user: " tfno edad
        echo "$user: $tfno, $edad" >> usuarios_completado.txt
done
echo Los datos almacenados son:
echo
cat usuarios_completado.txt
echo FIN de ARCHIVO
