%option noyywrap
%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

double yyval_num;
bool isDouble; 

void yyerror(const char *msg);
int yylex();
%}
DIGIT   [0-9]
LETTER     [A-Za-z]
IDT        {LETTER}({LETTER}|{DIGIT}|_)*
STRING     \"[^\"]*\"
%%

[ |\t]                      { /* skip whitespace */ }

\/\/[^\n]*                  ;

{DIGIT}+"."{DIGIT}+         {
                             isDouble = true;
                             yyval_num = atof(yytext); 
                             return NUM;  
                            }

{DIGIT}+                    {
                             isDouble = false;
                             yyval_num = atoi(yytext);    
                             return NUM;
                            }

"("                         {return L_PAR;}

")"                         {return R_PAR;}

"+"                         {return PLUS;}

"-"                         {return MINUS;}

"*"                         {return TIMES;}

"/"                         {return DIV;}

","                         {return COMMA;}

"="                         {return ASSIGN;}

{STRING}                    {return STRING;}

"print"                     {return PRINT;}

"concat"                     {return CONCAT;}

"length"                     {return LENGTH;}

{IDT}                        {return ID;}

\n                          {return EOL;}

.                           { return ERROR; }

%%
