#!/bin/bash
# para mover los archivos de una unidad RAM
# Revisa el contenido de esa unidad y lo pasa a disco duro
ram="/tmp/ram"
servidor="/mnt/servidor" #unidad remota, previamente montada
dia=$(date +%F_%H_%M)
cd $ram
for i in $(ls -1) ; do
	lsof $i &> /dev/null #comprueba los archivos abiertos para no moverlos todavía
				#puede generar avisos molestos en algunos sistemas
		if [ $? -ne 0 ] ; then
		   mkdir -p $servidor/$dia
		   mv $i $servidor/$dia
		fi
done

