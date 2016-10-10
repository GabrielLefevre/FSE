#!/bin/csh
# nom du programme : nbFichiers
if ( $#argv  == 1) then 
  set nbfic=0
  set nbrep = 0
  foreach  fic(`\ls $argv`)
     if  (-f $argv/$fic || -d $argv/$fic)  then 
		if ( -f $argv/$fic) then
			@ nbfic++
		endif
		if ( -d $argv/$fic)  then
			@ nbrep++
			foreach nom (`find $argv/$fic -type f`)
				@ nbfic++
			end
		endif
     endif
  end
  echo  " il y a $nbfic fichiers et $nbrep dossiers"  
endif
