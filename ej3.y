/* Julen Salceda Zubero NIP: 957049 
   Daniel del Prado Parada NIP: 958028*/

%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}

%token X Y Z EOL
%start inicio

%%
inicio:	/* epsilon */
	|inicio entrada //Invoco más de una vez para permitir entradas
	;

entrada: s EOL

s:	/*epsilon*/
	| c X s	{printf("CxS\n");}
	;
b:	 X c Y Z Y {printf("xCyzy\n");}
	| X c {printf("xC\n");}
	;
c:	 X b X {printf("xBx\n");}
	| Z {printf("z\n");}
	;
	
%%
int yyerror(char *s){
	printf("\n%s\n", s);
	return 0;
}
int main(){
	yyparse();
}


