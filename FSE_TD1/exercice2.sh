#! /bin/csh
echo "Le nombre d'arguments : $#argv"
@ i = 1
if ($#argv == 0) then 
  echo "Le programme ne contient pas d'arguments"
  exit 1
endif  
while ($i <= $#argv)
  echo "Argument[$i] est $argv[$i]"
  @ i ++
end

if ($#argv != 2) then 
  echo "Nombre d'arguments incorrect "
  echo "    Usage : $0 fichier1 fichier2"
  exit 1
endif
if (! -f $argv[1]) then 
  echo "Le fichier $argv[1] n'existe pas"
  exit 2
endif

if (! -f $argv[2]) then 
  echo "Le fichier $argv[2] n'existe pas"
  exit 3
endif    
diff $argv > /dev/null
if ($status == 0) then 
  echo "Les fichiers $argv sont identiques"
else 
  echo "Les fichiers $argv sont différents"
endif
exit 0
