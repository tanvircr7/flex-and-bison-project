
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     VAR = 259,
     FLOAT_VALUE = 260,
     CHARACTER_VALUE = 261,
     START = 262,
     END = 263,
     INT = 264,
     FLOAT = 265,
     CHAR = 266,
     IF = 267,
     ELSE = 268,
     ELIF = 269,
     FOR_LOOP = 270,
     WHILE = 271,
     PRINT = 272,
     ADD_THESE = 273,
     FACTORIAL = 274,
     ARRAY = 275,
     arrayName = 276,
     RAND = 277,
     COMMA = 278,
     SINGLE_QUOTES = 279,
     SEMI_COLON = 280,
     EQUALS = 281,
     COLON = 282,
     EOL = 283,
     LESS_THAN = 284,
     GT_THAN = 285,
     CURLY_BRACE_OPEN = 286,
     CURLY_BRACE_CLOSE = 287,
     BIG_BRACKET_OPEN = 288,
     BIG_BRACKET_CLOSE = 289,
     WALL = 290,
     SUB = 291,
     PLUS = 292,
     DIV = 293,
     MUL = 294,
     BRACKET_CLOSE = 295,
     BRACKET_OPEN = 296
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 37 "jj.y"

    int intVal;
    char strVal[1000];
	float floatVal;



/* Line 1676 of yacc.c  */
#line 101 "jj.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


