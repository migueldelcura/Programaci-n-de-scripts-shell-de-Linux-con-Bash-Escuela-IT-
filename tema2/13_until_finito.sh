#!/bin/bash
until ! :
   do
	echo Esto se para con CTRL-C
	echo O poniendo "parar" en el archivo control.txt
	if [ $(cat control.txt) = parar ]
	   then
		echo Por fin
		exit
	fi
done
