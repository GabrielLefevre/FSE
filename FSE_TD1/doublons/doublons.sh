#! /bin/csh
if ($#argv > 0) then 
	set rep = $argv[1]
else 
	set rep = .
endif

if (! -d $rep) then 
  echo "$rep n'est pas accessible"
  exit 1
endif

# suppression des fichiers temporaires
ls data* >& /dev/null
if ($status == 0) rm -f data*
if (-f resultat) rm -f resultat

#sauvegarder le résultat de find dans le fichier data
touch data 
find Rep/ -type f > data

touch data2

foreach fic(`cat data`)
   dirname  "$fic" >> data2
  end
  
  

#créer le fichier data4 contenant la liste des noms de fichier sans doublons
touch data3

foreach fich(`cat data`)
   basename  "$fich" >> data3
  end

sort data3 >> datatmp
touch data4
uniq datatmp >> data4
rm datatmp


foreach fichier(`cat data4`)
	
   #extraire la liste de référence de $fichier
   #effectuer la comparaison 2 à 2 des fichiers
end
