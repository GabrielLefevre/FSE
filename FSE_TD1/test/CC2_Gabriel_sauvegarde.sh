#! /bin/csh
if ($#argv < 2) then 
  echo "il faut 2 arguments ( extension et repertoire )"
  exit 1
endif
set ext = $argv[1]
set dest = $argv[2]
if (! -d $dest) then
  mkdir -p $dest
endif


find . -name \*.$ext -maxdepth 1 -type f -exec cp {} $dest \;



