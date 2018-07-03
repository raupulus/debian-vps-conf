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
## Script principal con la lógica del programa

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

## Configuraciones
DIR_APACHE='/var/www/html/Publico'

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

recorrerLista() {
    if [[ "$1" = '' ]] || [[ "$2" = '' ]]; then
        return 1
    fi

    ## Cada iteración del bucle:

    if [[ "$2" = 'general' ]]; then
        repo=descargarGIT
    elif [[ "$2" = 'gitlab' ]]; then
        repo=descargarGitLab
    elif [[ "$2" = 'github' ]]; then
        repo=descargarGitHub
    fi

    agregarConfigApache
    agregarConfigHost
    agregar_DNS
}

desplegarGeneral() {
    msg 'Desplegando repositorios GIT generales'
    recorrerLista 'repos.list' 'general'
}

desplegarGitLab() {
    msg "Desplegando repositorios desde$RO GitLab"
    recorrerLista 'reposGitLab.list' 'gitlab'
}

desplegarGitHub() {
    msg "Desplegando repositorios desde$RO GitHub"
    recorrerLista 'reposGitHub.list' 'github'
}

desplegarGeneral
desplegarGitHub
desplegarGitLab

exit 0
