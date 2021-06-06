%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	#include<string.h>
	#include "resource.h"
	int  yyerror(char *s);
    int yylex();


%}


%union{
    int intVal;
    char strVal[1000];
}

%token<intVal> NUMBER
%token<strVal> VAR


%type<intVal> expression
%type<intVal> statement
%type<strVal> TYPE

%token START END 
%token INT FLOAT CHAR
%token  COMMA   SINGLE_QUOTES   SEMI_COLON   EQUALS 
%token  BRACKET_OPEN  BRACKET_CLOSE   CURLY_BRACE_OPEN  CURLY_BRACE_CLOSE BIG_BRACKET_OPEN  BIG_BRACKET_CLOSE
%token PLUS SUB MUL DIV
%left PLUS SUB
%left MUL DIV


%%

program: START line END { printf("COMPILED"); printOutVars();}
    ;

line: 
    | line statement { }
    ;

statement: SEMI_COLON { }
	| declaration SEMI_COLON { }
	| expression SEMI_COLON {
		printf("value of expression %d\n", $1); $$=$1;
		}
	| VAR EQUALS expression SEMI_COLON {
		printf("\nValue of expression %d\n", $3); 
		assgnVal($1,$3);
		$$=$3;
		printf("\n\n");
	}
	;

declaration: TYPE ID1  { printf("\n------- variable declaration-----\n"); }
	;

TYPE: INT   { printf("integer dec\n"); strcpy(dataType,"int"); printf("Datatype %s\n",dataType);}
	| FLOAT { printf("float dec\n"); strcpy(dataType,"float"); printf("Datatype %s\n",dataType);}
	| CHAR  {printf("char dec\n"); strcpy(dataType,"char"); printf("Datatype %s\n",dataType);}
	;



ID1: ID1 COMMA VAR {
					int tmp = declareVal($3);
					if(tmp == 0){
						printf("Compilation Error :: Varriable already declared\n");
						exit(-1);
					}
	} 
	| VAR EQUALS expression { // int item = 5;
					printf("id1 1nd");
					initVal($1,$3);
	}
    | VAR {
		int tmp = declareVal($1); printf("id1 2nd");
		if(tmp == 0){
			printf("Compilation Error :: Varriable already declared\n");
			exit(-1);
		}
	}
    ;


expression: NUMBER					{  $$ = $1;  }

	| VAR							{ if(isDeclared($1)>=0) $$=getVal($1); 
									  else printf("Error: variable never declared \n");
									}
	
	| expression '+' expression	    { printf("\nAddition : %d+%d = %d \n",$1,$3,$1+$3 );  $$ = $1 + $3; }

	| expression '-' expression		{ printf("\nSubtraction : %d-%d=%d \n ",$1,$3,$1-$3); $$ = $1 - $3; }



	| expression '*' expression		{ printf("\nMultiplication : %d*%d \n ",$1,$3,$1*$3); $$ = $1 * $3; }

	| expression '/' expression		{   if($3){
				     						printf("\nDivision : %d/%d \n ",$1,$3,$1/$3);
				     						$$ = $1 / $3;
				     					
				  						}
				  						else{
											$$ = 0;
											printf("\nDivision by zero\n\t");
				  						} 	
				    				}
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

