%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	#include<string.h>
	//#include "resource.h"
	#include "resource++.h"
	#include "resource2.h"
	#include "resource3.h"

	#include <stddef.h>
	#include <stdint.h>
	#define SHOWY 0
	#define pry if(SHOWY)


	#define typename(x) _Generic((x),        /* Get the name of a type */             \
                                                                                  \
    _Bool: "_Bool",                 unsigned char: "unsigned char",          \
    char: "char",                   signed char: "signed char",            \
    short int: "short int",         unsigned short int: "unsigned short int",     \
    int: "int",                     unsigned int: "unsigned int",           \
    long int: "long int",           unsigned long int: "unsigned long int",      \
	long long int: "long long int", unsigned long long int: "unsigned long long int", \
    float: "float",                 double: "double",                 \
  	long double: "long double",     char *: "pointer to char",        \
    void *: "pointer to void",      int *: "pointer to int",         \
    default: "other")

	int  yyerror(char *s);
    int yylex();
	

%}


%union{
    int intVal;
    char strVal[1000];
	float floatVal;
}

%token<intVal> NUMBER
%token<strVal> VAR
%token<floatVal> FLOAT_VALUE
%token<strVal> CHARACTER_VALUE


%type<floatVal> expression
%type<floatVal> statement
%type<strVal> TYPE

%token START END 
%token INT FLOAT CHAR 
%token IF ELSE ELIF FOR_LOOP WHILE PRINT ADD_THESE FACTORIAL ARRAY arrayName RAND
%token  COMMA   SINGLE_QUOTES   SEMI_COLON   EQUALS  COLON EOL LESS_THAN GT_THAN
%token  CURLY_BRACE_OPEN  CURLY_BRACE_CLOSE BIG_BRACKET_OPEN  BIG_BRACKET_CLOSE 
%token WALL 
%left PLUS SUB
%left MUL DIV
%left BRACKET_OPEN BRACKET_CLOSE

%%

program: START everything END { printf("COMPILED\n\n"); printOutVars();}
    ;

everything: 
    | everything statement { }
    ;

statement:SEMI_COLON { }
	| declaration SEMI_COLON { }
	| expression SEMI_COLON {
		$$=$1;  pry{printf("expr semicolon %f\n", $$);}
		}
	| VAR EQUALS expression SEMI_COLON {
		pry{ printf("var = expr semicolon  %d\n", $3);} 
		assgnVal($1,$3);
		$$=$3; printf("\n\n");
	}
	| IF expression COLON statement {
		printf(" ________ IF BLOCK _____START_____\n\n");
		if($2) printf("%.2f <-value IF BLOCK\n",$4);
		else printf(" %.2f <-IF BLOCK FAILED\n",$2); 
		printf(" ________ IF BLOCK _____END_____\n\n");
	}
	| IF expression COLON statement  ELSE COLON statement {
		printf(" ________ IF ELSE BLOCK ____START______\n\n");
		if($2) printf("value of expression %.2f IF BLOCK SUCCESS! %.2f\n",$2,$4);
		else { printf(" ELSE BLOCK EXECUTED\n");}
		printf(" ________ IF ELSE BLOCK _____END_____\n\n");
	}
	| FOR_LOOP BRACKET_OPEN statement WALL expression WALL statement BRACKET_CLOSE COLON CURLY_BRACE_OPEN statement CURLY_BRACE_CLOSE {
		printf("======FOR LOOP %.2f %.2f %.2f %.2f========\n",$3,$5,$7,$11);
	    forLoop($3,$5,$7,$11);
		printf(" ________ FOR LOOP  ____END______\n\n");
	}
	| WHILE BRACKET_OPEN statement WALL expression BRACKET_CLOSE COLON CURLY_BRACE_OPEN statement CURLY_BRACE_CLOSE {
		printf(" ========= while ========\n\n");
		whileLoop($3,$5,$9);
		printf(" ________ WHILE LOOP ____END______\n\n");
	}
	| PRINT CURLY_BRACE_OPEN expression CURLY_BRACE_CLOSE{
		printf("\n--------------\t\t\t<0><0>\t\t\t--------------\nValue of expression %.2f\n--------------END--------------\n\n",$3);
	}
	| ADD_THESE BRACKET_OPEN statement BRACKET_CLOSE{
		printf("\n -------- (++) ---------- \n");
		printf("summation %f\n",$3);
	}
	| FACTORIAL BRACKET_OPEN expression BRACKET_CLOSE {
		printf("\n -------- (FACTORIAL) ---------- \n");
		if($3>=0) printf("FACTORIAL %f - %d\n",$3,factorial($3));
		else      printf("ERROR-> Factorial of a negative number is not POSSIBLE\n");
	}
	| RAND BRACKET_OPEN expression COMMA expression BRACKET_CLOSE {
		printf("\n-------------------------------------------------------------- RANDOM ----------\n");
		if($3>$5) $3=$5;
		randNumGen($3,$5);
	}
	| statement statement { $$=$1+$2; }
	;

declaration: TYPE ID1  { /*printf("\n------- variable declaration-----\n");*/ }
	;

TYPE: INT   
	{ 
		/*printf("integer dec\n");*/ strcpy(dataType,"int"); //printf("Datatype %s\n",dataType);
	}
	| FLOAT 
	{ 
		/*printf("float dec\n");*/ strcpy(dataType,"float"); //printf("Datatype %s\n",dataType);
	}
	| CHAR  
	{ 
		/*printf("char dec\n");*/ strcpy(dataType,"char");// printf("Datatype %s\n",dataType);
	}
	;



ID1: ID1 COMMA VAR {
					int tmp = declareVal($3);
					if(tmp == 0){
						printf("Error -> Varriable already declared\n");
						exit(-1);
					}
	} 
	| VAR EQUALS expression { /* int item = 5; */
					/*printf("int item = 5\n");*/
					declareVal($1);
					initVal($1,$3);
	}
    | VAR {
		int tmp = declareVal($1); /*printf("JUST VAR\n");*/
		if(tmp == 0){
			printf("Compilation Error -> Variable already declared\n");
		}
	}
    ;



expression: NUMBER					    { $$ = $1; /*printf("EXPR = NUMBER %.2f\n",$$);*/ }

	| FLOAT_VALUE                   { $$=$1; /*printf("EXPR = FLoat %.2f\n",$$);*/ }

	| VAR							
		{ 	if(isDeclared($1)>=0) { 
			int tmp = getTag($1);
			
			if(tmp==0) $$ = getVal($1);
			else if(tmp==1) $$ = getFloatval($1);
			//else OPTION for char
			/*printf("%.2f<-getVal\n",$$);*/
			/*printf("GOT TAG for %s -> %d ->%.2f\n",$1,tmp,$$);*/
			}	
			else printf(" Error -> variable never declared \n");
		}
	
	| expression PLUS expression	
	  	{ $$ = add($1,$3); }

	| expression SUB expression		
		{ $$ = sub($1,$3); }


	| expression MUL expression		
		{ $$ = mul($1,$3); }

	| expression DIV expression		
		{   
			$$=divide($1,$3);	
		}
	| expression LESS_THAN expression 
		{ $$ = gt_Than($1,$3) ; }
	
	| expression GT_THAN expression   
		{$$ = lt_Than($1,$3); }

	| BRACKET_OPEN expression BRACKET_CLOSE	
		{$$ = $2;}
	;

%%

int  yyerror(char *s){
	printf( "%s\n", s);
}

int yywrap()
{
	return 1;
}

int main(){

	freopen("input2.txt","r",stdin);
	//freopen("output.txt","w",stdout);
	yyparse();

	
    
	return 0;
}

