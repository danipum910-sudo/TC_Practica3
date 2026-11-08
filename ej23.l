%{
#define YYSTYPE double
#include "y.tab.h"
#include <math.h>
#include <stdlib.h>
%}

REAL  ([0-9]+"."[0-9]*|"."[0-9]+|[0-9]+)
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"**"    {return(EXP);}
"["	{return(OVA);}
"]"	{return(CVA);}
"("	{return(OP);}
")"	{return(CP);}
{REAL}  { yylval = atof(yytext); return(NUMBER); }
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
