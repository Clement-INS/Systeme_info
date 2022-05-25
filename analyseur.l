%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%
"main" {printf("tMAIN\n");
            return tMAIN; }
"if" {printf("tIF\n");
            return tIF; }
"else" {printf("tELSE\n");
            return tELSE; }
"while" {printf("tWHILE\n");
            return tWHILE; }
"{" {printf("tAOUV\n");
        return tAOUV;}
"}" {printf("tAFER\n");
        return tAFER;}
"const " {printf("tCONST\n");
        return tCONST;}
"int " {printf("tINT\n");
        yylval.type = strdup(yytext);
        return tINT;}
"+" {printf("tPLUS\n");
        return tPLUS;}
"-" {printf("tMOINS\n");
        return tMOINS;}
"*" {printf("tMUL\n");
        return tMUL;}
"/" {printf("tDIV\n");
        return tDIV;}
"=" {printf("tEQ\n");
        return tEQ;}
"!" {printf("tEXCL\n");
        return tEXCL;}
">" {printf("tSUP\n");
        return tSUP;}
"<" {printf("tINF\n");
        return tINF;}
"(" {printf("tPOUV\n");
        return tPOUV;}
")" {printf("tPFERM\n");
        return tPFERM;}
[ \t\n]      {}
"," {printf("tVIRG\n");
        return tVIRG;}
";" {printf("tSEMCOL\n");
        return tSEMCOL;}
"printf" {printf("tPRINT\n");
        return tPRINT;}
[0-9]+(e[0-9]+)? {
    printf("number\n");
    int n = strtold(yytext, NULL);
	yylval.nb = strtold(yytext, NULL);
printf(">>> %d\n", n);
	  return tNB;}
\".*\"  {printf("tSTR\n");
        yylval.str = strdup(yytext);
        return tSTR;}
[a-zA-Z][a-zA-Z0-9_]*  {printf("tID\n");
        yylval.id = strdup(yytext);
        return tID;}
