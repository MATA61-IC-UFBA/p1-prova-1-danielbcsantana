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
: IDT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

expr
: expr PLUS expr   |
  expr MINUS expr  |
  expr TIMES expr  |
  expr DIV expr    |
  L_PAR expr R_PAR |
  NUM
;

/* completar */

%%
