 set nb = `wc -l BDD`
echo $nb
head -$nb BDD | tail -1
set ligne = `head -5 BDD | tail -1`
echo $ligne
echo $#ligne
echo $ligne[1]
echo $ligne[2]
expr substr $ligne[2] 1 3
set login = "`expr substr $ligne[2] 1 3`$ligne[1]"
echo $login
echo $login > resultat
cat resultat
echo $login >> resultat
cat resultat
echo $login > resultat
cat resultat
#echo -n "adduser -d /home/info/prof/hsu -g prof -s /bin/csh -c "; echo -n \""$login"\" ; echo " thsu"
#echo "adduser -d /home/info/prof/hsu -g prof -s /bin/csh -c #Tiente HSU# thsu" | sed 's/#/\"/g' 
