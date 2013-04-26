#!/bin/bash

for i in On_Time_On_Time_Performance_*.zip;
do
	#ls -ld $i
	j=${i/zip/csv}
	if [ ! -f $j ];
	then
		echo "unpack: $i"
		unzip $i
		rm -f readme.html
	else
		echo "$j already unpacked"
	fi
done
