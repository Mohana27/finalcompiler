%{
#include "y.tab.h"
%}

%%
if  				return IF ;
else 				return ELSE ;
"(" 				return OP ;
")"					return CP;
"{"					return OB ;
"}"					return CB ;
[ \t]+			printf("%s",yytext);
[a-zA-Z0-9_+\-=*/%;]+	return TEXT ;
. 					return UNR ;
%%
