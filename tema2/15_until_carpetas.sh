#!/bin/bash
#para crear 10 carpetas
i=10
until [ $i -lt 1 ]
do
    mkdir carpeta$i
    ((i--))
done

