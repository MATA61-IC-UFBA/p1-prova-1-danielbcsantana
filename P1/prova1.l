%option noyywrap
%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

DIGIT   [0-9]
LETTER  [A-Za-z]
IDT     {LETTER}({LETTER}|{DIGIT}|_)*

%%

[ \t\n]+                    { /* Ignora espaços, tabs e QUEBRAS DE LINHA */ }

\/\/[^\n]* { /* Ignora comentários */ }

{DIGIT}+("."{DIGIT}+)?      { return NUM; }

"print"                     { return PRINT; }
"concat"                    { return CONCAT; }
"length"                    { return LENGTH; }

{IDT}                       { return ID; }

\"[^\"]*\"                  { return STRING; }

"("                         { return L_PAR; }
")"                         { return R_PAR; }
"+"                         { return PLUS; }
"-"                         { return MINUS; }
"*"                         { return TIMES; }
"/"                         { return DIV; }
","                         { return COMMA; }
"="                         { return ASSIGN; }

.                           { return ERROR; }

%%
