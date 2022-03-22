/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tEXCL = 258,
    tIF = 259,
    tWHILE = 260,
    tMAIN = 261,
    tAOUV = 262,
    tAFER = 263,
    tCONST = 264,
    tPLUS = 265,
    tMOINS = 266,
    tMUL = 267,
    tDIV = 268,
    tEQ = 269,
    tPOUV = 270,
    tPFERM = 271,
    tVIRG = 272,
    tSEMCOL = 273,
    tPRINT = 274,
    tNB = 275,
    tSTR = 276,
    tINT = 277,
    tID = 278
  };
#endif
/* Tokens.  */
#define tEXCL 258
#define tIF 259
#define tWHILE 260
#define tMAIN 261
#define tAOUV 262
#define tAFER 263
#define tCONST 264
#define tPLUS 265
#define tMOINS 266
#define tMUL 267
#define tDIV 268
#define tEQ 269
#define tPOUV 270
#define tPFERM 271
#define tVIRG 272
#define tSEMCOL 273
#define tPRINT 274
#define tNB 275
#define tSTR 276
#define tINT 277
#define tID 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "analyseur.y"
 int nb; char* str; char* id; char* type

#line 106 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
