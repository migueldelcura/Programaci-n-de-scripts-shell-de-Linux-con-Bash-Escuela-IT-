#!/bin/bash
echo Comenzamos
cat /var/log/auth.log | grep Jun | grep sudo > /home/$USERNAME/resultado.txt
chmod 740 /home/$USERNAME/resultado.txt
echo Finalizada la creación
cat /home/$USERNAME/resultado.txt
echo FIN

