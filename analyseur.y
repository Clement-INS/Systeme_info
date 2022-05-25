%{
#include <stdlib.h>
#include <stdio.h>
#include "symbols.h"
#include "asm.h"

int var[26];
void yyerror(char *s);
%}
%union { int nb; char* str; char* id; char* type}
%token tSUP tINF tEXCL tIF tWHILE tMAIN tAOUV tAFER tCONST tPLUS tMOINS tMUL tDIV tEQ tPOUV tPFERM tVIRG tSEMCOL tPRINT tELSE
%token <nb> tNB
%token <str> tSTR
%token <str> tINT
%token <id> tID
%type <type> Type
%type <nb> Elem Condition
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

Decl : Type Ids tSEMCOL { update_type($1, 0);}
        | tCONST Type tID tEQ tNB tSEMCOL {push_sym($3); update_type($2, 1); add_instruction("AFC", get_adr($3), $5, -1);};
        
Ids : tID {push_sym($1);}
        | tID tVIRG Ids {push_sym($1);};

Insts : Inst Insts
        |;

Inst :  Affect
        | tPRINT tPOUV Elem tPFERM tSEMCOL {add_instruction("PRI", $3, -1, -1);}
        | tIF tPOUV Condition tPFERM {push_cond1(); add_instruction("JMF", $3, -1, -1); pop_tmp();} Body {push_cond0(); add_instruction("JMP", -1, -1, -1); pop_cond1();} Else {pop_cond0();}
        | tWHILE {push_while();} tPOUV Condition tPFERM {push_cond1(); add_instruction("JMF", $4, -1, -1); pop_tmp();} Body {pop_while(); pop_cond1();};

Else : tELSE Body
        | {remove_jmp();};

Condition : Elem tEQ tEQ Elem {int tmp = push_tmp(); add_instruction("EQU", tmp, $1, $4); $$ = tmp;}
        | Elem tSUP Elem {int tmp = push_tmp(); add_instruction("SUP", tmp, $1, $3); $$ = tmp;}
        | Elem tINF Elem {int tmp = push_tmp(); add_instruction("INF", tmp, $1, $3); $$ = tmp;}
        | Elem {$$ = $1; push_tmp();};

Elem : tNB { int tmp = push_tmp(); add_instruction("AFC", tmp, $1, -1); $$ = tmp; pop_tmp();}
        | tID {$$ = get_adr($1);};
        

Affect : tID tEQ {if(isconst($1)) {exit(14);}} Calcul tSEMCOL {add_instruction("COP", get_adr($1), pop_tmp(), -1);};

Calcul : Calcul tPLUS DivMul {add_operation("ADD");}
        | Calcul tMOINS DivMul {add_operation("SOU");}
        | DivMul;

DivMul : DivMul tMUL Terme {add_operation("MUL");}
        | DivMul tDIV Terme {add_operation("DIV");}
        | Terme;

Terme : tID {int tmp = push_tmp(); add_instruction("COP", tmp, get_adr($1), -1);}
        | tNB {int tmp = push_tmp(); add_instruction("AFC", tmp, $1, -1);};

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Program C\n"); // yydebug=1;
  yyparse();
  print_symbols();
  return 0;
}