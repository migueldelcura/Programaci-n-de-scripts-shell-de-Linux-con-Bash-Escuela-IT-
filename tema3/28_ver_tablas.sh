#!/bin/bash
#Script que muestra las tablas de una base de mysql
#Primero se generan variables para usar en la sentencia de mysql, bash no las conoce!!!
host="localhost"
usuario="root"
clave="Clave"
database="fop2"
#Juntamos esas variables como parámetros del comando mysql,
#con -s para modo silencioso y -e para que salga de mysql al terminar
mysql_param="-h $host -u $usuario -p$clave -D $database -s -e"
#Ejecución de mysql
mysql $mysql_param "show tables;"
