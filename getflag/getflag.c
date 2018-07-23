#include <unistd.h>
// @c0demech
// gcc -static -o getflag getflag.c

int
main(void)
{
 char *egg[3];

 egg[0] = "/bin/cat";
 egg[1] = "flag.txt";
 egg[2] = NULL;
 execve(egg[0],egg,NULL);
}
