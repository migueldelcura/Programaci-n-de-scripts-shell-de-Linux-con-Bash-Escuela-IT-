#!/bin/bash
#para copiar archivos especificos, que si da un error, programe una tarea
#con at, para hacerlo más tarde
cp -v at_prueba.txt /home/$USERNAME/curso/temporal/ &>> error.log

if [ $? -ne 0  ]
then
	echo Hubo un error de copia >> error.log
	echo lo intentaremos a las 13:00
	echo "$0" | at 13:00
else
	echo Copia realizada >> error.log
fi
