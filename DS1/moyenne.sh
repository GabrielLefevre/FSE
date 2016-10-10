#!/bin/csh
# nom du programme : moyenne
if  ($#argv == 0 ) then
	echo "la moyenne des 0 "
	exit 1
endif

set res = 0

foreach i ($#)
	res =`expr $argv[i] + $res`
end

@ moy  =`$res / $#`
echo "la moyenne est de $moy"

