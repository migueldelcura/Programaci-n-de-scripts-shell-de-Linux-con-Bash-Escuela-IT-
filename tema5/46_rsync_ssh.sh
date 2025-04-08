#!/bin/bash
carpeta=~/curso/
usuario=jefe
rsync -az -e "ssh -p 33030" "$carpeta" "$usuario"@192.168.15.24:/home/jefe/copias/
