#!/bin/bash
# definimos las variables
usuario=jefe
clave=Clave
servidor=localhost
directorio=/home/jefe/mysql_copias/ #debe estar creado en el servidor
bd=fop2
fecha=$(date +%d-%b-%Y)
mysqldump -u $usuario -p$clave -h $servidor $bd > "$directorio"back_"$bd"_"$fecha".sql
