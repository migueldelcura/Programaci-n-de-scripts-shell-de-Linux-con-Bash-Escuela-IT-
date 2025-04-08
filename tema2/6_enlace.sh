#!/bin/bash
#!/bin/bash
#enlace=$(ip route | grep default | cut -d " " -f 3)
enlace=192.168.15.55 #una ip que sirva para hacer pruebas
echo La puerta de enlace es $enlace
falla=$(ping -c 1 $enlace | grep Unreachable | cut -d " " -f 6)

if [ -n "$falla" ]
   then
	echo Mensaje de vuelta: "$falla"
	echo "¡La puerta de enlace falla!"
   else
	echo "¡La puerta de enlace funciona!"
fi

