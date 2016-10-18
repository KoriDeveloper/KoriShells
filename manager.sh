#!/bin/bash

#	Author:	Kori <http://www.kori-developer.eu/board/>
#
#	This file is only for KoriDev
#

# Manager Congigs
INSTALLER_VERSION="1.0"
MACHINE=`uname -m`

# Color Settings 
function greenMessage {
    echo -e "\\033[32;1m${@}\033[0m"
}

function cyanMessage {
    echo -e "\\033[36;1m${@}\033[0m"
}

function redMessage {
    echo -e "\\033[31;1m${@}\033[0m"
}

function yellowMessage {
	echo -e "\\033[33;1m${@}\033[0m"
}
###
## Manager Funktionen
function runSpinner {

    SPINNER=("-" "\\" "|" "/")

    for SEQUENCE in `seq 1 $1`; do
        for I in "${SPINNER[@]}"; do
            echo -ne "\b$I"
            sleep 0.1
        done
    done
}

function error {
	clear
	redMessage ${@}
	exit 0
}

function SystemInfo {
	if [ "$MACHINE" == "x86_64" ]; then
        ARCH="amd64"
    elif [ "$MACHINE" == "i386" ]||[ "$MACHINE" == "i686" ]; then
        ARCH="x86"
    else
        error "$MACHINE is not supported!"
    fi
}

## Main Manager Menue
greenMessage "Manager Startet...."
runSpinner
clear
cyanMessage "Was moechtest du machen?"

OPTIONS=("Ports Aktualisieren" "Mysql Installieren" "Python Installieren" "Libs Installieren" "KoriDev Files Menue" "Mysql Menu" "Quit")
select OPTION in "${OPTIONS[@]}"; do
    case "$REPLY" in
        1|2|3|4|5|6 ) break;;
        7 ) error "Bye!";;
        *) error "Error! Please contact Kori-Developer.eu/board";;
    esac
done

if [ "$OPTION" == "Ports Aktualisieren" ]; then
    INSTALL="PO"
elif [ "$OPTION" == "Mysql Installieren" ]; then
    INSTALL="MY"
elif [ "$OPTION" == "Python Installieren" ]; then
    INSTALL="PY"
elif [ "$OPTION" == "Libs Installieren" ]; then
    INSTALL="LI"
elif [ "$OPTION" == "KoriDev Files Menue" ]; then
    INSTALL="KD"
elif [ "$OPTION" == "Mysql Menu" ]; then
    INSTALL="MM"
fi


if [ "$INSTALL" ==  "PO" ]; then
	greenMessage "Erfolgreich"
	exit
fi
