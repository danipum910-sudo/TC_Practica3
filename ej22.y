%{
#define YYSTYPE double
#include <stdio.h>
#include <math.h>
extern int yylex();
extern int yyerror(char*);
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV EXP
%right EXP
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%f\n", $2); }
	;
exp : 	factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple
		;
factorsimple :	factorsimple EXP factorsimple { $$ = pow($1, $3); }
	     	| OP exp CP { $$ = $2; }
		| NUMBER 
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}

int main() {
  yyparse();
}
