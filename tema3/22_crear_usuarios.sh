#!/bin/bash
matriz=($(cat usuarios.txt))

crearusuario () {
if [ "$1" = "auto" ]
   then
	echo Se van a crear usuarios automáticamente
	echo Pulse CTRL-C para cancelar
	for ((i=0; i<${#matriz[*]}; i++)); do
		echo se creará el usuario ${matriz[$i]}
		sleep 0.5
		useradd -m ${matriz[$i]}
		local marca=$(date +%N) #nanosegundos para generar contraseñas pseudoaleatorias
		echo Aqui la passwd automática: ${matriz[$i]}_$marca
		echo "${matriz[$i]}:${matriz[$i]}_$marca" | chpasswd
		mresumen[$i]=${matriz[$i]}_$marca
	done
fi
if [ "$1" = "manual" ]
   then
	echo Se van a crear usuarios manualmente
        echo Pulse CTRL-C para cancelar
	for ((i=0; i<${#matriz[*]}; i++)); do
                echo se creará el usuario ${matriz[$i]}
		useradd -m ${matriz[$i]}
                read -p "Ponga la contraseña para ${matriz[$i]}: " clave
		echo La clave es: $clave
		echo "${matriz[$i]}:$clave" | chpasswd
		mresumen[$i]=$clave
        done
fi
}

resumen (){
echo ${matriz[*]}  > lista_claves.txt
echo ${mresumen[*]} >> lista_claves.txt
echo Resumen de usuarios:
cat lista_claves.txt | column -t
}

if [ $# -eq 0 ]
   then
        echo Faltan parámetros
        echo -e "Escriba $0 \e[3m auto o manual \e[0m"
        exit 1 #Terminamos mal
   elif [ "$1" = "auto" ]
   then
        crearusuario auto
        resumen
	echo Terminado
        exit 0 #Sale bien
   elif [ "$1" = "manual" ]
   then
	crearusuario manual
	resumen
	echo Terminado
	exit 0
   else
	echo Opción no válida
	exit 100
fi

