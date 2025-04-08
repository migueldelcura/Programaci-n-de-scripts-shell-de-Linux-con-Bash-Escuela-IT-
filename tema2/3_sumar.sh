#!/bin/bash
echo Los números a sumar son $1 y $2
#suma=$(echo "scale=2; $1+$2" | bc)
suma=$(echo "scale=2; ${1-0}+${2-0}" | bc)
echo La suma de ambos es: $suma

