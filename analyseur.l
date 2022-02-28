%{
#include <stdlib.h>
#include <stdio.h>
%}

%option noyywrap

%%
"main" {printf("tMAIN");
            return tMAIN; }
"{" {printf("tAOUV");
        return tAOUV;}
"}" {printf("tAFER");
        return tAFER;}
"const" {printf("tCONST");
        return tCONST;}
"int " {printf("tINT");
        return tINT;}
\"[a-zA-Z0-9]*\"  {printf("tSTR");
        yylval.str = yytext;
        return tSTR;}
"+" {printf("tPLUS");
        return tPLUS;}
"-" {printf("tMOINS");
        return tMOINS;}
"*" {printf("tMUL");
        return tMUL;}
"/" {printf("tDIV");
        return tDIV;}
"=" {printf("tEQ");
        return tEQ;}
"(" {printf("tPOUV");
        return tPOUV;}
")" {printf("tPFERM");
        return tPFERM;}
[ \t\n]      {}
"," {printf("tVIRG");
        return tVIRG;}
";" {printf("tSEMCOL");
        return tSEMCOL;}
"printf" {printf("tPRINT");
        return tPRINT;}
[0-9]+(e[0-9]+)? {
    printf("number");
    int n = strtold(yytext, NULL);
//	  yylval.nb = n;
printf(">>> %d\n", n);
	  return tNB;}
"if" {printf("tIF");
        return tIF;}
"while" {printf("tWHILE");
        return tWHILE}



%%

int main(){
    yylex();
    return 1;
}
