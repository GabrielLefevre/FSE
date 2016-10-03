#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char **argv) {
  pid_t respid=0;
  int nbgene,i;
  pid_t pid_initial = getpid();

  if (argc !=2) {
    printf("Usage : %s nb_generations\n", argv[0]);
    exit(1);
  }
  nbgene = atoi(argv[1]);
  i=0; 

  while (i<nbgene && respid==0 ) {
    respid = fork();
    if (respid == -1) {  // erreur création
      perror("fork \n");
      exit(2);
    }
    if (respid==0) i++; 
  } // while 
  if (respid>0) 
    printf ("Pinit=%d, pid=%d, ppid=%d, generation=%d\n", pid_initial, getpid(), getppid(),i);
  else printf("Dernier processus de pid = %d, ppid : %d, generation=%d\n",getpid(),getppid(),i);
  exit(0);
}
