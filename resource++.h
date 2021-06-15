#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#define SHOW 0
#define SHOW1 0
#define pr if(SHOW1)printf("---------------in Resource----------------\n\n");
#define type(var) printf("Data type %s\n\n",var);

int place = 0; int cPlace = 0;
char dataType[100];

typedef struct identifiers {
    char name[100];
    int tag;
    int val;
    float floatval;
    char charval[100];
}varIds;

varIds id[1000];

typedef struct containers {
    char name[100];
    int stuff[100];
} container;

container cx[1000];

int getTag(char curr[]);

int isDeclared(char curr[]) {
    pr 
    for(int i=0;i<place;i++){
        if( strcmp(id[i].name,curr) == 0 ){
            if(SHOW) printf("%s declared before\n",id[i].name);
            return i;
        }
    }
    return -1;
}

int declareVal (char curr[]) {
    pr 

    if(isDeclared(curr)>=0) return 0;

    strcpy(id[place].name,curr);
    if(SHOW){printf("New declaration %s of TYPE %s\t\n",id[place].name,dataType);}
    
    if(!strcmp(dataType,"int")){
        id[place].tag = 0; 
    }
    else if (!strcmp(dataType,"float")){
        id[place].tag = 1;
    }
    else {
        id[place].tag = 2;
    }

    id[place].val = -1; id[place].floatval=-1.0; strcpy(id[place].charval,"/0");
    place++;
    return 1;
}

int initVal (char curr[], float num) {

    pr 
    if(isDeclared(curr)<0) return 0;

    int pos = isDeclared(curr);
    id[pos].val = num;
    id[pos].floatval = num;
    if(SHOW){printf("INITIALIZATION %s\t%n\t%f\n",id[pos].name,id[pos].val,id[pos].floatval);}
    return 1;
}


int assgnVal (char curr[], float num) {
    pr 

    int pos = isDeclared(curr);
    id[pos].val = num;
    id[pos].floatval = num;
    if(SHOW){printf("New assignment %s\t%n\t%f\n",id[place].name,id[place].val,id[pos].floatval);}

    return 1;
}

int getVal(char curr[]){
    pr 
    int notFound=1;
    for(int i=0;i<place;i++){
        if( strcmp(id[i].name,curr)==0 ){
            notFound = 0;
            return id[i].val; 
        }
    }
    if(notFound) {
        if(SHOW) {printf("variable %s never declared",curr);}
        return -1000;
    }
}


char* getCharval(char curr[]){
    if(isDeclared(curr)>=0){
        int pos = isDeclared(curr);
        return id[pos].charval;
    }
    else {
        if(SHOW) printf("Error in char val\n");
    }
}

float getFloatval(char curr[]){
    if(isDeclared(curr)>=0){
        int pos = isDeclared(curr);
        return id[pos].floatval;
    }
    else {
        if(SHOW) printf("Error in float val\n");
    }
}

int getSize(){
    if(SHOW) printf("size %n\n",place);
    return place;
}

int getTag(char curr[]){
    if(isDeclared(curr)<0) return -1;

    for(int i=0;i<place;i++){
        if( strcmp(id[i].name,curr)==0 ){
            return id[i].tag; 
        }
    }
}

void printOutVars(){
    for(int i=0;i<place;i++){
        printf("|| %s - %d - %f ||\n\n",id[i].name,id[i].val,id[i].floatval,id[i].charval);
    }
}