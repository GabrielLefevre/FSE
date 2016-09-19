#! /bin/csh

if ($#argv != 1) then
  echo " Usage : $0 nomRepertoireTest"
  exit 1
endif

if (-d $argv) then 
  echo "le repertoire $argv existe deja"
  exit 2
endif

set repACreer = (r1 r2 r3/r31 r3/r32  r4 r5)

foreach rep ($repACreer)
  mkdir -p $argv/$rep
end

ls $argv > $argv/r4/F1
ls $argv > $argv/r5/F1

ls / > $argv/F1
ls / > $argv/r1/F1
ls / > $argv/r3/r31/F1
ls / > $argv/r3/r32/F1

ls /etc > $argv/r2/F2
ls /etc > $argv/r3/F2

ls /dev > $argv/r3/r31/F3
ls /dev > $argv/r5/F3

cd $argv
touch ./F2
touch ./r3/r32/F4
touch ./r3/r32/F3
date    > ./r2/F1
ls -l   > ./r3/F1
ps aux  > ./r3/r31/F2
ls -al  > ./r3/r31/F4

echo "1 Rep/r4/F1"     > resultat_doublons
echo "1 Rep/r5/F1"     >> resultat_doublons
echo "2 Rep/F1"        >> resultat_doublons
echo "2 Rep/r1/F1"     >> resultat_doublons
echo "2 Rep/r3/r31/F1" >> resultat_doublons
echo "2 Rep/r3/r32/F1" >> resultat_doublons
echo "3 Rep/r2/F2"     >> resultat_doublons
echo "3 Rep/r3/F2"     >> resultat_doublons
echo "4 Rep/r3/r31/F3" >> resultat_doublons
echo "4 Rep/r5/F3"     >> resultat_doublons

echo "Le repertoire test $argv est cree"
