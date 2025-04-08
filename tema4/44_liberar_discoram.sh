#!/bin/bash
#Comprobar uso de memoria, para liberar RAM si es necesario
archivo_crontab=/etc/cron.d/ram_cron
touch $archivo_crontab
nombre=${0:2} #eliminamos el ./ de $0
mem_libre=$(free | grep Memoria | tr -s " " | cut -d " " -f 4)
liberar (){
mv /tmp/ram/* /home/jefe/curso/ram
umount /tmp/ram
}

tarea (){
cat $archivo_crontab | grep $nombre > linea_cron
if [ ! -s linea_cron ] #archivo vacío
   then
	echo "00 00-23 * * * root /home/jefe/scripts/$nombre" >> $archivo_crontab
fi
}

if [ $mem_libre -lt 512000 ] #liberar memoria si bajamos de 512MB
   then
	liberar
   else
	echo No es necesario liberar
fi
tarea
