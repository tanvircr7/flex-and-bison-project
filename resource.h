#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#define SHOW 1
#define pr printf("in Resource\n\n");

int place = 0;
char dataType[100];

typedef struct identifiers {
    char name[100];
    int val;
}varIds;

varIds id[1000];


int isDeclared(char curr[]) {
    pr
    for(int i=0;i<place;i++){
        if( strcmp(id[i].name,curr) == 0 ){
            if(SHOW) printf("%s declared before",id[i].name);
            return i;
        }
    }
    return -1;
}

int declareVal (char curr[]) {
    pr

    if(isDeclared(curr)>=0) return 0;

    strcpy(id[place].name,curr);
    if(SHOW){printf("New declaration %s\t\n",id[place].name);}
    id[place].val = -1; 
    place++;
    return 1;
}

int initVal (char curr[], int num) {

    pr
    if(isDeclared(curr)>=0) return 0;

    strcpy(id[place].name,curr);
    id[place].val = num;
    if(SHOW){printf("New assignment %s\t%n\n",id[place].name,id[place].val);}
    place++;
    return 1;
}

int assgnVal (char curr[], int num) {
    pr

    int pos = isDeclared(curr);
    id[pos].val = num;
    if(SHOW){printf("New assignment %s\t%n\n",id[place].name,id[place].val);}

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


char* getIdName(int idx){
    return id[idx].name;
}

int getIdVal(int idx){
    return id[idx].val;
}

int getSize(){
    if(SHOW) printf("size %n\n",place);
    return place;
}

void printOutVars(){
    for(int i=0;i<place;i++){
        printf("%s - %d",id[i].name,id[i].val);
    }
}