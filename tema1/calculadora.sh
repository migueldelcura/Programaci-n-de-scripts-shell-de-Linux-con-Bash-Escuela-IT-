#!/bin/bash
read -p "Escriba dos números seguidos, por favor " num1 num2
echo Los números escritos son $num1 y $num2
echo La suma de ambos es:
suma=$(echo "scale=2; $num1+$num2" | bc)
echo $suma
echo La resta:
resta=$(echo "scale=2; $num1-$num2" | bc)
echo $resta
echo El producto:
producto=$(echo "scale=2; $num1*$num2" | bc)
echo $producto
echo La división es:
(echo "scale=2; $num1/$num2" | bc)
echo $division

