%{
#include <stdlib.h>
#include <stdio.h>
#include "symbols.h"

int var[26];
void yyerror(char *s);
%}
%union { int nb; char* str; char* id; char* type}
%token tMAIN tAOUV tAFER tCONST tPLUS tMOINS tMUL tDIV tEQ tPOUV tPFERM tVIRG tSEMCOL tPRINT
%token <nb> tNB 
%token <str> tSTR
%token <str> tINT
%token <id> tID
%type <type> Type

%start Program

%%

Program : Functions;

Functions : Function Functions
        | Main;

Function : Type tID tPOUV Params tPFERM Body;

Main : Type tMAIN tPOUV tPFERM Body;

Body : tAOUV {increment_depth();} Decls Insts tAFER {pop_symbols();};

Type : tINT { $$ = $1;};

Params : Param
        | Param tVIRG Params;

Param : Type tID {push_sym($2); update_type($1, 0);};

Decls : Decl Decls
        |;

Decl : Type Ids tSEMCOL { update_type($1, 0); }
        | tCONST Type Ids tSEMCOL { update_type($2, 1); };
        
Ids : tID {push_sym($1);}
        | tID tVIRG Ids {push_sym($1);};

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
  print_symbols();
  return 0;
}