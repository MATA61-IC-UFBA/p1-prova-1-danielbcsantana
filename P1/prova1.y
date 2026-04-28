%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token ID
%token L_PAR
%token R_PAR
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token COMMA
%token STRING
%token PRINT
%token CONCAT
%token LENGTH
%token ASSIGN
%token ERROR
%token NUM

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: ID ASSIGN expr
| PRINT L_PAR exprlist R_PAR
| expr
;

expr_list
: expr
|expr_list COMMA expr
;

expr
: expr PLUS expr   |
  expr MINUS expr  |
  expr TIMES expr  |
  expr DIV expr    |
  L_PAR expr R_PAR |
  CONCAT L_PAR expr_list R_PAR |
  LENGTH L_PAR expr R_PAR |
  ID               |
  STRING           |
  NUM
;

/* completar */

%%
