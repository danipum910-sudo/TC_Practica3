/* calcMejor.y fichero para la practica 3
 de Teoria de la Computacion  */
%{
#include <stdio.h>
#include <math.h>
extern int yylex();
extern int yyerror();
#define YYSTYPE double
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV EXPONENTIAL DECIMAL
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
		| potencia
		;

potencia:	factorsimple /* Puede haber o no un exponencial */
		| factorsimple EXPONENTIAL potencia { $$ = pow($1,$3);}
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER DECIMAL NUMBER {$$ = $1 + (double)$3/10;}
		| DECIMAL NUMBER { $$ =$2/10.0;}
		| NUMBER DECIMAL { $$ = (double)$1;}
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

