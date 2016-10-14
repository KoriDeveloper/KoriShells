#!/bin/sh
# Copyright (c) 2016 KoriDev
# All rights reserved

# Config ( change this paths )
SRC_DIR=/usr/src/
GAME_SRC_DIR=dev/src/game/src/ 
DB_SRC_DIR=dev/src/db/src/
GAME_NAME=game_40
DB_NAME=db_40

# Funktionen 

main() {
	echo -e "Welcome to KoriDev Compile Panel\n
1 - Install root for compiling\n
2 - Compile Menue"
	read menue
	case $menue in
		$menue*)
			if [ "$menue" -lt 3 ]; then
				if [ $menue == 1 ]; then
					install_root
				elif [ $menue == 2 ]; then
					compile_menue
				fi
			else
				echo -e "Error!"
			fi
		;;
	esac
}

install_root() {
	clear
	echo -e "Install root for compiling..."
	Packets="devel boost-libs cryptopp gmake makedepend"
	n=0
	for i in $Packets
		do n=`expr $n + 1`
			eval file$n="$i"
				for f in `expr $n` 
				do if pkg info | grep $file$i; then
					echo -e "$file$i allredy installed."
					else
						echo -e "Install $file$i..."
						pkg install $file$i
					fi
				done
	done
}

compile_menue() {
	echo -e "Compile Menu:\n
1 - Compile game and strip\n
2 - Compile game without strip\n
3 - Compile Database with strip\n
4 - Compile Database without strip"
	read compile
	case $compile in
		$compile*)
			if [ $compile -lt 5 ]; then
				if [ $compile == 1 ]; then
					clear
					echo -e "Compile Game..."
					cd $SRC_DIR$GAME_SRC_DIR && gmake clean && gmake
					clear
					echo -e "strip game..."
					cd .. && strip $GAME_NAME
					echo -e "Build and strip Done."
				elif [ $compile == 2 ]; then
					clear
					echo -e "Compile Game..."
					cd $SRC_DIR$GAME_SRC_DIR && gmake clean && gmake
					echo -e "Build Done."
				elif [ $compile == 3 ]; then
					clear
					echo -e "Compile Database..."
					cd $SRC_DIR$DB_SRC_DIR && gmake clean && gmake
					clear
					echo -e "strip Database..."
					cd .. && strip $DB_NAME
					echo -e "Build and strip Done."
				elif [ $compile == 4 ]; then
					clear
					echo -e "Compile Database..."
					cd $SRC_DIR$DB_SRC_DIR && gmake clean && gmake
					echo -e "Build Done."
				fi
			else
				echo -e "Error!"
				main
			fi
		;;
	esac
}
main
