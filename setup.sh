#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Script principal
## Desde aquí se llamaran a todos los demás scripts separando
## funciones para cada uno de ellos.
##
## Ten en cuenta que este script hace modificaciones en el equipo a mi gusto
## Puede no funcionar correctamente si usas software de repositorios externo
## Probablemente no funcionará en otras distribuciones distintas
## a Debian rama Stable.

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.0.1'  ## Versión en desarrollo
LOGERROR="$WORKSCRIPT/errores.log"  ## Archivo donde almacenar errores

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/functions.sh"

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################

exit 0
