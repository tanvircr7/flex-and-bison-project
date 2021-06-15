#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
//#include "resource.h"
#define SHOW2 1
#define pr2 printf("in 2 resource\n\n");

void forLoop(int initial,int limit, int update, int printOut){
    if(SHOW2) printf("----- Loop execution------\n");
    for(int i=initial;i<limit;i+=update){
        printf("i= %d val %d\n",i,printOut);
    }
    if(SHOW2) printf("------END FOR LOOP --------\n");
}

void whileLoop(int initial,int limit,int printOut){
    if(SHOW2) printf("%------while loop ----------\n");
    while(initial<limit){
        printf(" val %d\n",printOut);
        initial+=1;
    }
    if(SHOW2) printf("------END WHILE LOOP --------\n");
}