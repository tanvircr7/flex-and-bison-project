%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "jj.tab.h"
	#define SHOWL 0
	#define prL(n) if(SHOWL){n;}
	
%}

digit [+-]?[0-9]
variable [a-zA-Z]*
comment "//".*

%%

"START"                                         { /*printf("Started..\n\n");*/	return START; }
"END"                                           { /*printf("\n\n ENded...\n\n");*/	return END;}

"'"                                             {return SINGLE_QUOTES;}
","                                             {return COMMA;}
";"                                             {return SEMI_COLON;}
":"												{return COLON;}
"="                                             {return EQUALS;}
"("                                             {return BRACKET_OPEN;}
")"                                             {return BRACKET_CLOSE;}
"{"                                             {return CURLY_BRACE_OPEN;}
"}"                                             {return CURLY_BRACE_CLOSE;}
"["                                             {return BIG_BRACKET_OPEN;}
"]"                                             {return BIG_BRACKET_CLOSE;}
"|"											    {return WALL;}

"int"  		                                    {return INT;}
"char" 		                                    {return CHAR;}
"float"                                         {return FLOAT;}

"+"                                             {return PLUS;}
"-"                                             {return SUB;}
"*"                                             {return MUL;}
"/"                                             {return DIV; }
"<"												{return LESS_THAN; }
">"												{return GT_THAN; }


"IF"											{return IF;}
"ELSE"										    {return ELSE;}
"ELIF"											{return ELIF;}

"[F]"											{return FOR_LOOP;}
"[W]"											{return WHILE; }
"<0><0>"										{return PRINT; }
"(++)"											{return ADD_THESE;}
"<FACTORIAL>"									{return FACTORIAL;}
"array"											{return ARRAY;}
"RAND>>"									    {return RAND;}

{digit}+                                        {yylval.intVal = atoi(yytext); return NUMBER; }
{variable}                                      {strcpy(yylval.strVal,yytext); prL(printf("variable %s\n",yylval.strVal))
												return VAR; }
[+-]?([0-9]*[.])?[0-9]+                         {yylval.floatVal = atof(yytext); return FLOAT_VALUE;}
"**[a-zA-Z]+**"								    {strcpy(yylval.strVal,yytext); return CHARACTER_VALUE;}
{comment}										{/*printf("\nSingle line comment found :  ");*/ECHO;printf("\n");}




%%