#! /bin/csh
# On donne la possibilité au utilisateur de pouvoir saisir plusieurs nombres par ligne
# le programme s'arrête lorsque le nombre -1 est rencontré
# les éléments non numérique ne sont pas pris en compte
if ($#argv != 0) then 
  echo "Le programme ne comporte pas d'argument"
  exit 1
endif

@ somme = 0
echo "Entrez une suite d'entiers terminant par fin :"
set suite = ($<)
@ i = 1

while ("$suite[$i]" != "fin")
  if ("$suite[$i]" != "0") then 
	# On vérifie à l'aide d'une expression régulière que l'élément courant est un nombre 
	# un nombre commence par un chiffre[1-9] suivi de 0 ou plusieurs chiffres
	echo $suite[$i] | grep -i '^[1-9][0-9]*$' > /dev/null
	if ($status == 0) then
	  @ somme += $suite[$i]
	  @ i ++
	else
	  echo "$suite[$i] n'est pas un nombre"
	endif
  endif   
  if ($i > $#suite) then 
	echo "Entrez une suite d'entiers terminant par fin :"
	set suite = ($<)
	@ i = 1
  endif
end
echo "La somme de la liste est : $somme"

