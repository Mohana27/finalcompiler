%{
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
FILE *yyin;
//FILE *fp;
//int flag=0;
//char ch;
 //FILE *fsring1, *fsring2, *ftemp;
//int i=0;
//int e=0;
extern char *yytext;
%}

%token IF ELSE OP CP OB CB TEXT SC UNR
%%
s:	TEXT {printf("%s",yytext);}| IF {printf("%s",yytext);} OP {printf("%s",yytext);} TEXT {printf("%s",yytext);} CP {printf("%s",yytext);} OB {printf("%s",yytext);} s CB {printf("%s",yytext);} t	| ;
t: 	ELSE {printf("%s",yytext);} OB {printf("%s",yytext);} s CB {printf("%s",yytext);} s | {fprintf(yyin,"else{}\n");} s;
%%
int yyerror(char *s)
{
	//printf("%s",s);
fprintf(stderr,"%s\n",s);
}
int yywrap()
{
return 1;
}

int main(void)
{
yyin=fopen("if2.c","a+");
//printf("\nifc ,efc is %d %d",ifc,efc);	
 	
yyparse();
//printf("\nifc ,efc is %d %d",ifc,efc);
	fclose(yyin);

	return 0;
}
