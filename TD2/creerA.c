#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char **argv) {
  pid_t respid=0;
  int hauteur,i;

  if (argc !=2) {
    printf("Usage : %s hauteur \n", argv[0]);
    exit(1);
  }
  hauteur = atoi(argv[1]);
  i=1; 

  while (i<hauteur && respid==0 ) {
    respid = fork();
    if (respid == -1) {  // erreur création
      perror("fork fils gauche \n");
      exit(2);
    }
    if (respid){ // processus père
      respid = fork();
      if (respid == -1) {  // erreur création
	perror("fork fils droit\n");
	exit(3);
      } 
    }     
    if (respid==0) i++; // fils gauche et fils droit 
  } // while 

  if (respid==0) 
    printf ("Processus feuille de pid = %d, ppid = %d, hauteur=%d\n",getpid(),getppid(),i);
  else printf("Processus noeud de pid = %d, ppid : %d, hauteur=%d\n",getpid(),getppid(),i);
  exit(0);
}
