#!/bin/bash
#Para indicar si una espera de días queda dentro del año en curso
#O para decir cuántas semanas quedan para terminar el año
#Con un parámetro se indica (espera, o ,semanas) la opción a escoger.
#Por defecto, la primera
dias (){
local dias_hoy=$(date +%j)
let disponible=365-$dias_hoy
#echo Días disponibles este año: $disponible
}

if [ "${1-espera}" = "espera" ] #indicamos una opción por defecto
   then
	read -p "Indique días de espera: " x
	dias
	if [ $x -gt $disponible ]
	   then
		echo No entra en este año
		exit
	fi
   echo Queda dentro de este año
fi

if [ "$1" = "semanas" ]
   then
        dias
	let semanas=$disponible/7
	echo Quedan $semanas semanas completas
fi
echo FIN
