#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

DIR_APACHE='/var/www/html/Publico'

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

agregarConfigApache() {


}

agregarConfigHost() {


}






exit 0
