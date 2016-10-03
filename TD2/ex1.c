#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char **argv) {
pid_t identite; 
if(fork()==fork())
	printf("A ");
else
	printf("B ");

identite=fork();
if (identite==-1) {
	perror("Fork : erreur creation processus\n");
	exit(1);
}

if (identite == 0 ) {
	printf ("Fils -> Je suis le processus %d, fils du processus %d \n",getpid(), getppid());
} else {
	printf ("Pere -> Je suis le processus %d, fils du processus %d \n",getpid(), getppid());
}
	exit(0);
}
