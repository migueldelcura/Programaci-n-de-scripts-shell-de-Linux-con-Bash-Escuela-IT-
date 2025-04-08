#!/bin/bash
servidor=192.168.15.24
fecha=$(date)
while :
do
    contador=0
        sleep 10m #Lo prueba cada 10 minutos
        for num in {1..5} ; do
                ping -c 1 "$servidor" &> /dev/null
                if [ $? -eq 1 ]; then
                        sleep 2 #falló el ping
                        contador=$(($contador + 1))
                fi
done
        if [ "$contador" -eq 5 ]; then
                echo Servidor caído "$fecha" >> /home/jefe/alerta_servidor
                mail -s "Servidor caído" usuario@gmail.com <<< "Alerta de caída"
        fi
done

