#!/bin/bash
#Por parámetro se introduce el nombre del usuario a crear
useradd $1
usermod -L $1
clear
echo "Escriba la clave del usuario $1"
smbpasswd -L -a $1
smbpasswd -L -e $1
#Para que tenga efecto debemos reiniciar el servicio
systemctl restart smbd
#Hacemos matrices para almacenar la secuencia del comando y las opciones del mismo
dial=(dialog --separate-output --checklist "Selecciona los grupos a los que pertenece:" 22 76 16)
opciones=(1 "sala" on 2 "direccion" off  3 "ventas" off  4 "compras" off)
seleccion=$("${dial[@]}" "${opciones[@]}" 2>&1 >/dev/tty)
clear
for sel in $seleccion
do
    case $sel in
	1) adduser $1 sala;; #Este comando añade el usuario a un grupo
	2) adduser $1 direccion;;
	3) adduser $1 ventas;;
	4) adduser $1 compras;;
    esac
done
clear
echo $1 pertenece a los grupos: ; groups $1
