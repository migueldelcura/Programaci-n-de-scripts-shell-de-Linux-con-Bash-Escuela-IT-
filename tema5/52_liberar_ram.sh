#!/bin/bash
ram="/tmp/ram"
servidor="/mnt/servidor/"

liberar (){
mv $ram/* $servidor 2> /dev/null 
mountpoint $ram > /dev/null
if [ $? -ne 1 ] ; then
	umount /tmp/ram
fi
}
while true
do
	sleep 3
	mem_libre=$(free | grep Memoria | tr -s " " | cut -d " " -f 4)
	if [ $mem_libre -lt 262144 ]
#	if [ $mem_libre -lt 2262144 ] #para pruebas
   	then
		liberar
	fi
done
