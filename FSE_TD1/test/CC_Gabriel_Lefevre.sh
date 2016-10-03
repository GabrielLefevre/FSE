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

echo "le nombre de fichier dans le repertoire est de : "
echo `ls $argv | wc -l`

