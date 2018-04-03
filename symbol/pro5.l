%{
#include "y.tab.h"
extern YYSTYPE yylval;
int x=0;
%}
%%
"int" 	{x++;
	printf("\nInt variable declared\n");		
	return INT;
	}
"float" {x++;
	printf("\nFloat variable declared\n");
	return FLOAT;}
"char"  {x++;
	printf("\nChar variable declared\n"); 
	return CHAR;
	}
"double"  {x++;
	printf("\ndouble variable dechared\n");
	return DOUBLE;
	}
[a-z]+ {yylval=yytext;
	if(x>0)
	{
	return ID;
	} 
	return 0;
	}
"," return C;
[\n] return NL;
";" {x--;return SE;}
"{" {return Op;}
"}" {return Cp;}
%%
