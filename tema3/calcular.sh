#!/bin/bash
#no es necesario shebang ni que sea ejecutable
calculo (){
suma=$(echo "scale=2; $1+$2" | bc)
resta=$(echo "scale=2; $1-$2" | bc)
producto=$(echo "scale=2; $1*$2" | bc)
division=$(echo "scale=2; $1/$2" | bc)
}
