#!/bin/bash
#angel y el jefe pueden ver el archivo más restringido
#pepe y nacho otros menos restringidos, el resto no accede a nada
case $USERNAME in
        pepe)
                cat restringido.txt;;
        angel | jefe)
                cat muy_restringido.txt;;
        nacho)
                cat poco_restringido.txt;;
        *)
                echo Usted no puede ver nada;;
esac
