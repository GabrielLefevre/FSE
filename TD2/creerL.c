#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <sys/wait.h>

int main(int argc, char **argv) {
  pid_t respid=1;
  int nbfils,i;

  if (argc != 2) {
    printf("Usage : %s nb_fils\n", argv[0]);
    exit(1);
  }
  nbfils = atoi(argv[1]);
  i=0; 

  while (i<nbfils && respid>0 ) {
    respid = fork();
    if (respid == -1) {  // erreur création
      perror("fork \n");
      exit(2);
    }
    if (respid > 0) i++; 
  } // while 
  if (respid>0) { // processus initial
    for (i=0;i<nbfils; i++) wait(NULL);
  }     
  printf ("PID = %d, PPID = %d\n", getpid(), getppid());
  exit(0);
}
