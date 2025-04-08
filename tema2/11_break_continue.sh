#!/bin/bash
read -p "Hasta qué número deseas contar: " cont
for ((num=1; num<=10; num++)); do
	echo Llegamos hasta el $num
	if [ $num -eq $cont ]; then
		break
	fi
done
echo
echo Estos números son mayores que 4:
for ((num2=1; num2<10; num2++)); do
	if [ $num2 -gt 0 ] && [ $num2 -lt 5 ]; then
		continue #No muestra los menores de 5
	fi
	echo $num2
done
