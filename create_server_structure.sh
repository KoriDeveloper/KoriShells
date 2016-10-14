#!/bin/sh

echo "Channel number: "
read nch
echo "Cores per channel: "
read ncores

mkdir share
cd share
	mkdir configs
	mkdir data
	mkdir locale
	mkdir logs
	mkdir package
	mkdir protos
	touch game
	touch db
	cd ..

mkdir share/logs/auth
touch share/configs/AUTH.CONFIG
mkdir auth
cd auth
	ln -s ../share/locale/ locale
	ln -s ../share/logs/auth/ log
	ln -s ../share/package/ package
	ln -s ../share/configs/AUTH.CONFIG CONFIG
	ln -s ../share/game auth
	cd ..

mkdir share/logs/database
touch share/configs/DATABASE.CONFIG
mkdir database
cd database
	ln -s ../share/logs/database/ log
	ln -s ../share/configs/DATABASE.CONFIG conf.txt
	ln -s ../share/database database
	ln -s ../share/protos/item_names.txt item_names.txt
	ln -s ../share/protos/item_proto.txt item_proto.txt
	ln -s ../share/protos/mob_names.txt mob_names.txt
	ln -s ../share/protos/mob_proto.txt mob_proto.txt
	cd ..

for i in `seq 1 $nch`
do
	mkdir share/logs/channel${i}
	mkdir share/configs/channel${i}
	mkdir channel${i}
	cd channel${i}
		for j in `seq 1 $ncores`
		do
			mkdir ../share/logs/channel${i}/core${j}
			touch ../share/configs/channel${i}/CORE${j}.CONFIG
			mkdir core${j}
			cd core${j}
				ln -s ../../share/data/ data
				ln -s ../../share/locale/ locale
				ln -s ../../share/logs/channel${i}/core${j}/ log
				ln -s ../../share/package/ package
				ln -s ../../share/configs/channel${i}/CORE${j}.CONFIG CONFIG
				ln -s ../../share/game channel${i}_core${j}
				cd ..
		done
		cd ..
done

mkdir share/logs/channel99
mkdir share/configs/channel99
mkdir channel99
cd channel99
	for j in `seq 1 $ncores`
	do
		mkdir ../share/logs/channel99/core${j}
		touch ../share/configs/channel99/CORE${j}.CONFIG
		mkdir core${j}
		cd core${j}
			ln -s ../../share/data/ data
			ln -s ../../share/locale/ locale
			ln -s ../../share/logs/channel99/core${j}/ log
			ln -s ../../share/package/ package
			ln -s ../../share/configs/channel99/CORE${j}.CONFIG CONFIG
			ln -s ../../share/game channel99_core${j}
			cd ..
	done
	cd ..

echo "Done!"
