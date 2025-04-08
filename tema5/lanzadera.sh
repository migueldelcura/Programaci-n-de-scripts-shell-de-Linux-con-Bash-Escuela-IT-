#!/bin/bash
scp -P 33030 48_mysql_lanzada.sh jefe@192.168.15.24:/home/jefe
ssh jefe@192.168.15.24 -p 33030  "/home/jefe/48_mysql_lanzada.sh"
