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
## Funciones de apoyo

##
## Recibe una cadena y la muestra impresa
## @param  $1  String  Mensaje a pintar en el terminal
##
msg() {
    echo -e "$VE $1 $CL"
}

##
## Agrega la zona DNS
##
agregar_DNS() {
    msg "Agregando$RO $1 a su zona DNS"
}

##
## Clona un repositorio desde GitHub y lo despliega
## @param  $1  String  Nombre de Usuario
## @param  $2  String  Nombre del Repositorio
## @param  $3  String  Lugar donde guardamos el repositorio
##
gitHub() {
    msg "Preparando para descargar desde$RO GitHub"
    descargarGIT "$2" "https://github.com/$1/$2" "$DIR_APACHE/$3"
}

##
## Clona un repositorio desde gitlab y lo despliega
## @param  $1  String  Nombre de Usuario
## @param  $2  String  Nombre del Repositorio
## @param  $3  String  Lugar donde guardamos el repositorio
##
## Ejemplo:    gitLab fryntiz curriculum fryntiz/curriculum
gitLab() {
    msg "Preparando para descargar desde$RO GitLab"
    descargarGIT "$2" "https://gitlab.com/$1/$2" "$DIR_APACHE/$3"
}

##
## Recibe un nombre, el repositorio de origen y el directorio destino para
## descargar el repositorio controlando errores y reintentando cuando falle.
## @param  $1  String  Nombre, es más para informar y registrar log
## @param  $2  String  Repositorio desde donde descargar
## @param  $3  String  Lugar donde guardamos el repositorio
##
descargarGIT() {
    local reintentos=10
    msg "Descargando $RO$1$VE desde Repositorio$RO GIT"
    if [[ ! -d "$3" ]]; then
        for (( i=1; i<=$reintentos; i++ )); do
            msg "Descargando$RO $1$VE, intento$RO $i$CL"
            if [[ $i -eq $reintentos ]]; then
                rm -Rf "$3" 2>> /dev/null
                break
            fi
            git clone "$2" "$3" && break
            rm -Rf "$3" 2>> /dev/null
        done
    else
        msg "El repositorio $RO$1$VE ya existe el directorio$RO $3"
        actualizarGIT "$1" "$3"
    fi
}

##
## Recibe un nombre y el directorio donde se encuentra el repositorio.
## @param  $1  String  Nombre, es más para informar y registrar log.
## @param  $2  String  Ruta hacia la raíz del repositorio en el sistema.
##
actualizarGIT() {
    if [[ -d "$2" ]] && [[ -d "$2/.git" ]]; then
        echo -e "$VE Se actualizará el repositorio existente de$RO $1$CL"
        cd $2 || exit 1
        echo -e "$VE Limpiando posibles cambios en el repositorio$RO $1$CL"
        git checkout -- .
        echo -e "$VE Actualizando repositorio$RO $1$CL"
        git pull
        cd $WORKSCRIPT || return
    fi
}

##
## Agrega el archivo de configuración para el host virtual en
##
agregarConfigApache() {
    msg 'Configurando Host Virtual'
    ## Entrar al repositorio
    ## copiar el archivo .conf de la raíz
    ## pegarlo en /etc/apache2/sites-available
    ## activarlo con a2enssite ????
}

##
## Agrega al archivo /etc/hosts la configuración del sitio virtual
##
agregarConfigHost() {
    msg 'Añadiendo a /etc/hosts'
}

##
## Recibe uno o más nombres de servicios para reiniciarlos
## @param $* Recibe los servicios que necesite reiniciar
##
reiniciarServicio() {
    for x in $*; do
        echo -e "$RO Reiniciando $x$CL"
        sudo systemctl restart "$x"
    done
}
