#!/bin/bash
#contaremos el número de copias en destino, para empezar las nuevas
#Una completa y seis incrementales
destino=/mnt/copias
metadatos=$destino/marca_copia.met #archivo de metadatos
				#con las marcas de tiempo para incrementos
origen=/home/jefe/curso/
fecha=$(date +%Y-%m-%d-%H-%M) #ponemos horas y minutos para poder hacer pruebas
contador=1
for ((num=1; num<=10; num++)); do
	copias=$(ls -1 $destino | grep back_$contador | wc -l)
	if [ $copias -lt 7 ] ; then
		tar cpzf $destino/back_"$contador"_"$fecha" -g "$metadatos""$contador" $origen
		# La p indica que se salven los permisos de archivo
		#con -g indicamos que genere un archivo con metadatos
		#temporales para que haga incrementales
		echo Realizado
		exit
	else
		contador=$(($contador + 1))
	fi
done
