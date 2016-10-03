#! /bin/csh

if ($#argv == 0) then 
  echo "Il faut mettre la liste d'entiers en arguments"
  exit 1
endif
 
set liste 
@ somme = 0
foreach nb ($argv)
  if ("$nb" != "0") then
	# On vérifie à l'aide d'une expression régulière que l'élément courant est un nombre 
	# un nombre commence par un chiffre[1-9] suivi de 0 ou plusieurs chiffres 
	echo $nb | grep -i '^[1-9][0-9]*$' > /dev/null
	if ($status == 0) then
	  @ somme += $nb
	  set liste = ($liste $nb)
	else 
	  echo "argument $i contient $nb n'est pas un nombre"
	endif
  endif
end
 
# Juste pour faire beau ...
echo -n $liste | sed s/\ /+/g
echo "=$somme"
