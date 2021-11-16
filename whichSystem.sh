#!/usr/bin/bash

# Herramienta desarrolada por RiJaba1 https://github.com/rijaba1


# Declaramos los colores
declare -r yellowColour="\e[0;33m\033[1m"
declare -r redColour="\e[0;31m\033[1m"
declare -r grayColour="\e[0;37m\033[1m"
declare -r blueColour="\e[0;34m\033[1m"

clear

# Definimos la IP

read -rep $'\n - Inserte la IP: ' ip

clear

# Comprobamos el TTL
ttl=$(ping -c 1 $ip | awk '{ print $6 }' | tr -d '\n' | cut -c 7- | rev | cut -c3- | rev)

# Parcheamos el TTL
echo -e "\n${grayColour}El TTL es: ${yellowColour}$ttl\n"


# Comprobamos el valor del TTL y lo mostramos
if [ $ttl == "64" ]
then
	echo -e "  ${redColour}[+] ${grayColour}Linux"
fi

if [ $ttl == "128" ]
then
	echo -e "  ${redColour}[+] ${grayColour}Windows"
fi
