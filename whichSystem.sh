#!/bin/bash
# Herramienta desarrolada por RiJaba1 https://github.com/rijaba1/


# Declaramos los colores
declare -r yellowColour="\e[0;33m\033[1m"
declare -r redColour="\e[0;31m\033[1m"
declare -r grayColour="\e[0;37m\033[1m"
declare -r blueColour="\e[0;34m\033[1m"

clear

# Definimos la IP

# [0-9,]+[^.]

re='[0-9,]+[^.]'

while :
do
	read -rep $'\n - Inserte la IP: ' ip
	if [[ $ip =~ $re ]];then
		break
	else
		clear
		echo -e " - $ip no es una IP."
	fi
done

clear

# Comprobamos el TTL
ttl=$(ping -c 1 $ip | awk '{ print $6 }' | tr -d '\n' | cut -c 7- | rev | cut -c3- | rev)

# Parcheamos el TTL
echo -e "\n${grayColour}El TTL es: ${yellowColour}$ttl\n"


# Comprobamos el valor del TTL y lo mostramos
if [[ "$ttl" =~ ^(64|63|65)$ ]]
then
	echo -e "  ${redColour}[+] ${grayColour}Linux"
fi

if [[ "$ttl" =~ ^(128|127|129)$ ]]
then
	echo -e "  ${redColour}[+] ${grayColour}Windows"
fi
