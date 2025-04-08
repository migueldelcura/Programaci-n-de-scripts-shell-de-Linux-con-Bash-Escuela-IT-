#!/bin/bash
#Para probar con la función de mensaje
source mensaje.sh
echo Quiero ver lo que es cursiva
texto="Esto es cursiva"
formatexto "$texto" cursiva
echo Quiero ver lo que es color rojo
texto="Esto es rojo"
formatexto "$texto" rojo
echo Quiero ver lo que es negrita
texto="Esto es negrita"
formatexto "$texto" negrita
echo Quiero ver lo que es todo junto
texto="Y esto todo junto"
formatexto "$texto" todos
