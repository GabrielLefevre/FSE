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

find $rep -type f > data


touch data2
foreach nom (`cat data`)
   set nomfic = `basename $nom`
   set repfic = `dirname $nom`
   echo "$nomfic  $repfic" >> data2
end


cut -f 1 -d " " data2 | sort  | uniq -d  >  data4
@ ind = 1
foreach fichier (`cat data4`)
   @ i = 1
# sert à affecter un numéro de groupe aux fichiers
# si  num[i] = 0 ==> le fichier i n'est pas affecté
# si num[i] > 0 ==> le fichier i appartient au groupe num[i] 
   set  num = ( ) 
   set refs = `find $rep -name $fichier`
   while ($i <= $#refs)
     set num = ($num 0)
     @ i ++ 
   end
   @ i = 1

# comparaison 2 à 2 des fichiers
# si fichier i et fichier j sont identique alors 
# num[i]=num[j]=ind 
   while ($i <= $#refs)
      @ j = $i + 1
      while ($j <= $#refs)
         if ($num[$j] == 0) then
           cmp $refs[$i] $refs[$j] > /dev/null
           if ($status == 0) then
             set num[$j] = $ind
             set bool 
             set existe
           endif 
         endif
         @ j ++
      end 
      if ($?bool) then
        unset bool
        set num[$i] = $ind
        @ ind ++ 
      endif   
      @ i ++
   end
   if ($?existe) then
        unset existe
 	@ i = 1
        while ($i <= $#refs)
           if ($num[$i] > 0) then
             echo " $num[$i] $refs[$i]" >> resultat 
           endif
           @ i ++
        end
   endif   
end     
if (-z resultat) then 
  echo "Pas de doublons"
else
  @ n = 1
  while ($n < $ind) 
    grep " $n " resultat
    if ($status == 0) then 
      echo "-----------------------------"
    endif
    @ n ++
  end
endif
