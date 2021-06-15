#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
//#include "resource.h"
#define SHOW3 1
#define pr3 printf("in 3 resource\n\n");

float add(float a,float b){
    if(SHOW3) printf("Addition %.2f+%.2f = %.2f",a,b,a+b);
    return a+b;
} 

float sub(float a,float b){
    float res = a-b;
    if(SHOW3) printf("Subtraction %.2f-%.2f = %.2f",a,b,res);
    return res;
}

float mul(float a,float b){
    if(SHOW3) printf("Multiplication %.2f*%.2f = %.2f",a,b,a*b);
    return a*b;
} 

float divide(float a,float b){
    if(b){
        if(SHOW3) printf("Division %.2f/%.2f = %.2f",a,b,a/b);
        return a/b;
    }
    else {
        printf("ERROR: division by ZERO\n\n");
        return 0.0;
    }
} 

int gt_Than(float a,float b){
    if(SHOW3) printf("Greater than %.2f>%.2f = %.2f",a,b,a>b);
    return a>b;
}

int lt_Than(float a,float b){
    if(SHOW3) printf("Lest than %.2f<%.2f = %.2f",a,b,a<b);
    return a<b;
}

float diff(float a,float b){
    float res = ((a-b)>0)?(a-b):(b-a);
    return res;
}

long factorial(int n)
{
  if (n == 0) // Base case
    return 1;
  else
    return (n*factorial(n-1));
}

void randNumGen(int lower, int upper){
    srand(time(0)); int count = 10;
    printf("The random numbers are: ");
    for (int i = 0; i < count; i++) {
        int num = (rand() % (upper - lower + 1)) + lower;
        printf("%d ", num);
    }
    printf("\n--------- END---------\n");
}