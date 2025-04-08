#!/bin/bash
if [ $# -eq 0 ]
    then
        echo Faltan parámetros
        echo -e "Escriba $0 \"Directorio de destino\" \"Patrón de archivo\""
        exit 1 #Terminamos mal
 elif [ "$2" = "" ]
    then
	echo Falta el segundo parámetro
	echo -e "Escriba $0 \"Directorio de destino\" \"Patrón de archivo\""
        exit 2 #Terminamos mal
elif [ ! -f $patron ]
   then
        echo No existe ningún fichero así
        exit 3
fi

patron="*$2*"
ls $patron &> /dev/null
if [ $? != 0 ]
   then
        echo No existe ningún fichero así
        exit 3
fi

if [ ! -d $1 ]
    then
	echo La carpeta $1 no existe
	mkdir $1
	echo Creada
fi

for copi in *
  do
	cp $patron $1
done
echo Terminado
exit 0 # Esto es siempre por defecto, no es necesario
