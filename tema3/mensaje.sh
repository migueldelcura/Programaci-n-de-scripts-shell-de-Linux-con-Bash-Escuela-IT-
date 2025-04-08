#Función de uso externo para que los scripts puedan mostrar mensajes
# en diferentes formatos
formatexto (){
mensaje=
local mensaje=$1
formato=
local formato=$2
case "$formato" in
        cursiva)
                echo -e "\e[3m $mensaje \e[0m";;
        rojo)
                echo -e "\e[91m $mensaje \e[0m";;
	negrita)
                echo -e "\e[1m $mensaje \e[0m";;
        todos)
                echo -e "\e[1;3;91m $mensaje \e[0m";;
esac
}
#Sería bonito con dialog
