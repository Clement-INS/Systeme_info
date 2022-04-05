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
    tSUP = 258,
    tINF = 259,
    tEXCL = 260,
    tIF = 261,
    tWHILE = 262,
    tMAIN = 263,
    tAOUV = 264,
    tAFER = 265,
    tCONST = 266,
    tPLUS = 267,
    tMOINS = 268,
    tMUL = 269,
    tDIV = 270,
    tEQ = 271,
    tPOUV = 272,
    tPFERM = 273,
    tVIRG = 274,
    tSEMCOL = 275,
    tPRINT = 276,
    tNB = 277,
    tSTR = 278,
    tINT = 279,
    tID = 280
  };
#endif
/* Tokens.  */
#define tSUP 258
#define tINF 259
#define tEXCL 260
#define tIF 261
#define tWHILE 262
#define tMAIN 263
#define tAOUV 264
#define tAFER 265
#define tCONST 266
#define tPLUS 267
#define tMOINS 268
#define tMUL 269
#define tDIV 270
#define tEQ 271
#define tPOUV 272
#define tPFERM 273
#define tVIRG 274
#define tSEMCOL 275
#define tPRINT 276
#define tNB 277
#define tSTR 278
#define tINT 279
#define tID 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "analyseur.y"
 int nb; char* str; char* id; char* type

#line 110 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
