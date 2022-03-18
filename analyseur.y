%{
#include <stdlib.h>
#include <stdio.h>
#include "symbols.h"
#include "asm.h"

int var[26];
void yyerror(char *s);
%}
%union { int nb; char* str; char* id; char* type}
%token tEXCL tIF tWHILE tMAIN tAOUV tAFER tCONST tPLUS tMOINS tMUL tDIV tEQ tPOUV tPFERM tVIRG tSEMCOL tPRINT
%token <nb> tNB 
%token <str> tSTR
%token <str> tINT
%token <id> tID
%type <type> Type Op

%start Program

%%

Program : Functions;

Functions : Function Functions
        | Main;

Function : Type tID tPOUV Params tPFERM Body;

Main : Type tMAIN tPOUV tPFERM Body {print_instruction_table();};

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
        /*| tIF tPOUV Condition tPFERM tAOUV Body tAFER
        | tWHILE tPOUV Condition tPFERM tAOUV Body tAFER;*/

/*Condition : Elem tEQ tEQ Elem
        | Elem tEXCL tEQ Elem
        | Elem;

Elem : tID
        | tINT;*/

Affect : tID {select_result($1);} tEQ Operations tSEMCOL {reset_operator();};

Operations : Operation Operations
        | Operation;

Operation : tNB {add_result_number($1);}
        | tNB {add_result_number($1);} Op {select_operator($2);} Operation
        | tID {add_result_variable($1);} Op Operation
        | tID {add_result_variable($1);};

Op : tPLUS {$$ = "ADD";}
        | tMOINS {$$ = "SOU";}
        | tDIV {$$ = "DIV";}
        | tMUL {$$ = "MUL";};

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Program C\n"); // yydebug=1;
  yyparse();
  print_symbols();
  return 0;
}