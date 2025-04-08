#!/bin/bash
mi_funcion () {
valor=hola #Esta es global
local valor2=adiós
echo $valor y $valor2
}
mi_funcion # A la salida se verán los dos valores
echo $valor y $valor2 #a la salida solo se verá la global
