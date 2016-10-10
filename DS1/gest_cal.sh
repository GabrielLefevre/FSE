#!/bin/csh
# nom du programme : gest_cal
if ($#argv == 0 ) then 
	echo "Format de la commande : $0  -option <argument>"
else 
  	# verifie que le fichier CALEPIN existe
  	if (! -f CALEPIN) touch CALEPIN
  	# met toutes les notes du fichier CALEPIN dans la varible tableau notes
  	set notes = `cat CALEPIN`
  	if ("$argv[1]" == "-n") then 
     		echo "Il y a $#notes note(s) dans le calepin"
  	else  if ("$argv[1]" == "-e") then 
     		rm CALEPIN
     		touch CALEPIN
  	else if ("$argv[1]" == "-i") then 
     		if (-f $argv[2]) then 
       			cp $argv[2]  CALEPIN
     		else
       			echo "Le fichier $argv[2] n'existe pas"
     		endif
     else if ("$argv[1]" == "-s") then
		if (! -f nomfic) touch nomfic
		cat "CALEPIN" > "nomfic"
     else if ("$argv[1]" == "-max") then
		
		set nblignes=`cat CALEPIN | wc -l`
		set i=1;

		while ( $i <= $nblignes)
		set l=`cat CALEPIN | head -n $i | tail -n 1`0
		echo $l
		set i=`expr $i + 1`
		end 
		
		echo "non terminé"
     else if ("$argv[1]" == "-add") then
		if (! -f ficNotes) then
			echo "le fichiers ficNotes n'existe pas"
			exit 1
		 endif 
		 cat "ficNotes" >> "CALEPIN"
     else if ("$argv[1]" == "-delete") then
		echo "non terminé"
	endif
endif
