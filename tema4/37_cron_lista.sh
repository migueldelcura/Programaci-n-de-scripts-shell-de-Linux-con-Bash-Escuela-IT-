#!/bin/bash
#Para ver tareas programadas de todos
matriz_user=($(ls -1 /var/spool/cron/crontabs))
rm encontrados &> /dev/null
for ((i=0; i<${#matriz_user[*]}; i++))
do
	echo Usuario ${matriz_user[$i]} >> encontrados
	crontab -u ${matriz_user[$i]} -l | grep -v \# >> encontrados
done
echo Las de usuarios son:
cat encontrados
echo El resto
matriz_carpetas=(/etc/cron.*)
for ((j=0; j<${#matriz_carpetas[*]}; j++))
do
	ls -l ${matriz_carpetas[$j]}
done
echo FIN
