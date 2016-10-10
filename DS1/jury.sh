#!/bin/csh
if  ($#argv == 0 ) then
	echo "erreur d'arguments : jury fichier_de_notes "
	exit 1
endif

set res = `wc -l $argv[1]`
set nbl = $res[1]
@ i = 1
while ($i <= $nbl) 
  set li = `head -$i $argv[1] | tail -1`
  echo "$li[1] : $li[2-]"
  @ i ++
end
