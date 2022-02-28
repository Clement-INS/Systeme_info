%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
%union { int nb; char str; }
%token tMAIN tAOUV tAFER tCONST tINT tPLUS tMOINS tMUL tDIV tEQ tPOUV tPFERM tVIRG tSEMCOL tPRINT
%token <nb> tNB 
%token <str> tSTR


%%

Program :   Function;
Function :  tMAIN tPOUV tPFERM Content 
        | tMAIN tPOUV Arg tPFERM Content;
Arg :   tNB 
        | tSTR 
        | Arg tVIRG Arg;
Content :   tAOUV Expr tAFER 
        | tAOUV tAFER;
Expr :  Expr Expr 
        | Decl 
        | If 
        | While 
        | Affect
        | tPRINT tPOUV tSTR tPFERM tSEMCOL;
Affect :    tCONST 
