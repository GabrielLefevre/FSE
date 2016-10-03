#! /bin/csh
if ($#argv < 2) then 
  echo "il faut 2 fichiers (src/dest) "
  exit 1
endif

set src = $argv[1]
if (! -d $src) then
  echo "le répertoire source $src n'existe pas"
  exit 2
endif

set dest = $argv[2]
if (! -d $dest) then
  mkdir -p $dest
endif

foreach tmp(`ls $src`)
  if (-f $src/$tmp) then
    cp $src/$tmp $dest
  endif  
end
