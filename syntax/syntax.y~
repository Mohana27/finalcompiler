%{
#include<stdio.h>
FILE *yyin;
%}
%token NUM
%left '-''+'
%right '*''/'
%%
start: exp
exp:exp'+'exp {$$=$1+$3; printf("+%d%d",$1,$3);}
|exp'-'exp {$$=$1-$3;printf("-%d%d",$1,$3);}
|exp'*'exp {$$=$1*$3;printf("*%d%d",$1,$3);}
|exp'/'exp {$$;
if($3==0)
yyerror("error");
else
{
$$=$1/$3; printf("/%d%d",$1,$3);
}
}
|'('exp')' {$$=$2;}
|NUM {$$=$1;}
;
%%
main()
{
yyin=fopen("syntax1.c","r");
if(yyparse()==0)
{
printf("\nSuccess\n");
}
fclose(yyin);
}
int yywrap()
{
return 1;
}
int yyerror()
{
//printf("ERROR: Invalid Arithmetic Expression\n");
} 
