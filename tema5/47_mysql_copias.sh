#!/bin/bash
# definimos las variables
usuario=jefe
clave=Clave
servidor=192.168.15.24
directorio=/home/jefe/mysql_copias/
fecha=$(date +%d-%b-%Y)
# ejecución del volcado de la base de datos
mysqldump -u $usuario -p$clave -h $servidor -A > "$directorio"back_$fecha.sql
