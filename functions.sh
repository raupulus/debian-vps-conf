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
## Funciones de apoyo

agregar_DNS() {

}

gitHub() {

}


## llamada:
## gitLab fryntiz curriculum fryntiz/curriculum
gitLab() {
    ## $1 Nombre Usuario
    ## $2 Nombre Repositorio
    ## $3 subdirectorio/nombre

    echo "Descargando $2"
    git clone https://gitlab.com/$1/$2 $DIR_APACHE/$3
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
    echo -e "$VE Descargando $RO$1$VE desde Repositorio$RO GIT$CL"
    if [[ ! -d "$3" ]]; then
        for (( i=1; i<=$reintentos; i++ )); do
            echo -e "$VE Descargando$RO $1$VE, intento$RO $i$CL"
            if [[ $i -eq $reintentos ]]; then
                rm -Rf "$3" 2>> /dev/null
                break
            fi
            git clone "$2" "$3" && break
            rm -Rf "$3" 2>> /dev/null
        done
    else
        echo -e "$RO$1$VE ya está instalado$CL"
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

agregarConfigApache() {


}

agregarConfigHost() {


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




exit 0
