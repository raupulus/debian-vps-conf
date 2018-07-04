#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        https://fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Este script comprueba todos los repositorios existentes en el directorio
## pasado como primer parámetros hasta 2 niveles

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

VERSION='0.0.1'  ## Versión en desarrollo
LOGERROR="$WORKSCRIPT/errores.log"  ## Archivo donde almacenar errores

## Configuraciones
DIR_GIT="$1"

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/functions.sh"

###########################
##       FUNCIONES       ##
###########################
comprobarRequisitos() {
    if [[ $DIR_GIT = '' ]]; then
        echo msg "$RO Es obligatorio indicar el directorio donde buscar repos"
        exit 1
    fi
}

comprobarRequisitos

exit 0
