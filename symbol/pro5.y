%{
#include<stdio.h>
#include<string.h>
int err_no=0,fl=0,i=0,j=0,type[100];
char symbol[100][100],temp[100];
FILE *yyin;
%}
%token ID NL SE C INT FLOAT CHAR DOUBLE Op Cp
%%
START:Op NL  START  NL Cp|SS START|SS NL START|SS NL  ;
SS:S NL SS | S NL ;
S: INT L1 E
|
FLOAT L2 E
|
CHAR L3 E
|
DOUBLE L4 E
|
INT L1 E S
|
FLOAT L2 E S
| 
CHAR L3 E S
| 
DOUBLE L4 E S
|
L1:L1 C ID{strcpy(temp,(char *)$3); insert(0);}
|ID{strcpy(temp,(char *)$1); insert(0);}
;
L2:L2 C ID{strcpy(temp,(char *)$3); insert(1);}
|ID{strcpy(temp,(char *)$1); insert(1);}
;
L3:L3 C ID{strcpy(temp,(char *)$3); insert(2);}
|ID{strcpy(temp,(char *)$1); insert(2);}
;
L4:L4 C ID{strcpy(temp,(char *)$3); insert(3);}
|ID{strcpy(temp,(char *)$1); insert(3);}
;
E:SE
;
%%
int yyerror(const char *str) 
{
return 1;
}
int yywrap()
{
return 1;
}
int main(int argc,char **argv)
{
	yyin=fopen("output.c","r");
	yyparse();
if(err_no==0)
{
int x=0;
//int f=0;
//int d=0;
//int c=0;
for(j=0;j<i;j++)
{
//printf("\n j is %d",j);
switch(type[j])
{
case 0:
printf("\n%d",x);
printf("\t%s",symbol[j]);
printf("\tINT");
x=x+2;
break;
case 1:
printf("\n%d",x);
printf("\t%s",symbol[j]);
x=x+4;
 printf("\tFLOAT");
break;
case 2:
printf("\n%d",x);
printf("\t%s",symbol[j]);
printf("\tCHAR");
x=x+1;
break;
case 3:printf("\n%d",x);
printf("\tDOUBLE");
x=x+8;
break;
}
}
}
//yyparse();
/*if(err_no==0)
{
for(j=0;j<i;j++)
{
if(type[j]==0) printf("INT");
if(type[j]==1) printf("FLOAT");
if(type[j]==2) printf("CHAR");
if(type[j]==3) printf("DOUBLE");
printf("%s",symbol[j]);
}
}*/
}
void insert(int type1)
{
fl=0;
 for(j=0;j<i;j++)
if(strcmp(temp,symbol[j])==0)
{
if(type[i]==type1) 
{
printf("Redeclaration of variable");
}
else 
{
printf("Multiple Declaration of Variable");
err_no=1;
}
fl=1;
}
if(fl==0)
{
type[i]=type1;
strcpy(symbol[i],temp);
i++;
}
}

