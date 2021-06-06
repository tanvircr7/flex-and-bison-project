%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "jj.tab.h"
	
%}

digit [0-9]
variable [a-zA-Z]*
comment "//".*

%%

"START"                                         { printf("Started..\n\n");	return START; }
"END"                                           { printf("\n\n ENded...\n\n");	return END;}

"'"                                             {return SINGLE_QUOTES;}
","                                             {return COMMA;}
";"                                             {return SEMI_COLON;}
"="                                             {return EQUALS;}
"("                                             {return BRACKET_OPEN;}
")"                                             {return BRACKET_CLOSE;}
"{"                                             {return CURLY_BRACE_OPEN;}
"}"                                             {return CURLY_BRACE_CLOSE;}
"["                                             {return BIG_BRACKET_OPEN;}
"]"                                             {return BIG_BRACKET_CLOSE;}

"int"  		                                    {return INT;}
"char" 		                                    {return CHAR;}
"float"                                         {return FLOAT;}

"+"                                             {return PLUS;}
"-"                                             {return SUB;}
"*"                                             {return MUL;}
"/"                                             {return DIV; }

{digit}+                                        {yylval.intVal = atoi(yytext); return NUMBER; }
{variable}                                      {strcpy(yylval.strVal,yytext); printf("variable %s\n",yylval.strVal); return VAR; }

{comment}										{printf("\nSingle line comment found :  ");ECHO;printf("\n");}




%%