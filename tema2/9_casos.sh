#!/bin/bash
#Para consultar diversos archivos diferentes condiciones
read -p "Indique el criterio de búsqueda: " criterio
echo Para buscar en /var/log/auth.log pulse 1
echo Para buscar en /var/log/syslog pulse 2
read pulsar
case $pulsar in
 1) cat /var/log/auth.log | grep "$criterio"
	read -n 1 -p "¿Desea guardar el resultado? s/n " si
	 if [ "$si" = s ]
	 then
		cat /var/log/auth.log | grep "$criterio" > consulta_$USERNAME.txt
	 fi ;;
 2) cat /var/log/syslog | grep "$criterio"
	read -n 1 -p "¿Desea guardar el resultado? s/n " si
	 case $si in
	 	[sS]) cat /var/log/syslog | grep "$criterio" > consulta_$USERNAME.txt
	 ;;
	 esac
esac
echo Finalizado
