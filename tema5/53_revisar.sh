#!/bin/bash
#Comprobar en syslog una determinada cadena de caracteres.
#para enviar un correo en ese caso
mensaje="Revisar ahora"
grep "$mensaje" /var/log/syslog > miro_syslog
if [ $? -eq 0 ]
   then
        echo Se encontró el mensaje
        mail -s "$mensaje" usuario@gmail.com <<< "Se recibió mensaje en syslog"
        systemctl stop revision.timer
fi

