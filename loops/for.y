%{
	#include<stdio.h>
	#include<string.h>
	int yywrap();
	int yylex();	
	void yyerror(char *s);
	int yyparse();
%}

%token FOR OP CL OP1 CL1 TEXT SC UNR DO WHILE

%union{
	char *str;
}

%type <str> s stmt for do FOR OP CL OP1 CL1 TEXT SC UNR DO WHILE

%%

s:		for s| stmt s | do s | {};
for:	FOR OP TEXT SC TEXT SC TEXT CL {printf("%s;while(%s)",$3,$5);} OP1 {printf("%s",$10);} s CL1 {printf("%s;%s",$7,$13);};
do:		DO OP1 stuff CL1 WHILE OP TEXT CL SC {printf("while(%s)\n{%s}",$7,$3);};
stmt:	TEXT {printf("%s",$1);} SC {printf("%s",$3);};
stuff:	TEXT SC {strcat($1,$2);$$=$1}stuff | TEXT SC;
%%

void yyerror(char *s)
{
	printf("%s\n",s);
}
int yywrap()
{
	return 1;
}
int main(void)
{
	yyparse();
}
