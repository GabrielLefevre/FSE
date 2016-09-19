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
debut boucle
  	set nomfic = 
  	set repfic = 
  	sauvegarder nomfic et repfic dans le fichier data2
fin boucle

créer le fichier data4 contenant la liste des noms de fichier sans doublons


foreach fichier (`cat data4`)
   extraire la liste de référence de $fichier
   effectuer la comparaison 2 à 2 des fichiers
end
