/* Julen Salceda Zubero NIP: 957049 
   Daniel del Prado Parada NIP: 958028*/

%{
#include "y.tab.h"
%}

%%

"x"	{return X;}
"y"	{return Y;}
"z"	{return Z;}
\n	{return EOL;}
[ \t]	{} //Para ignorar los espacios
%%
