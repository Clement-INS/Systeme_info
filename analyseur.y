%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
%union { int nb; char* str; char* id}
%token tMAIN tAOUV tAFER tCONST tINT tPLUS tMOINS tMUL tDIV tEQ tPOUV tPFERM tVIRG tSEMCOL tPRINT
%token <nb> tNB 
%token <str> tSTR
%token <id> tID
%start Program

%%

Program : Functions ;

Functions : Function Functions
        | Main;

Function : Type tID tPOUV Params tPFERM Body;

Main : Type tMAIN tPOUV tPFERM Body;

Body : tAOUV Decls Insts tAFER;

Type : tINT;

Params : Param
        | Param tVIRG Params;

Param : Type tID;

Decls : Decl Decls
        |;

Decl : Type Ids tSEMCOL
        | tCONST Type Ids tSEMCOL;
        
Ids : tID
        | tID tVIRG Ids;

Insts : Inst Insts
        |;

Inst : Affect
        | tPRINT tPOUV tSTR tPFERM tSEMCOL;

Affect : tID tEQ Operations tSEMCOL;

Operations : Operation Operations
        | Operation;

Operation : tNB
        | tNB Op Operation
        | tID Op Operation
        | tID;

Op : tPLUS
        | tMOINS
        | tDIV
        | tMUL;

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Program C\n"); // yydebug=1;
  yyparse();
  return 0;
}