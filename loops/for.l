%{
	#include <stdio.h>
	#include "for.tab.h"
%}
text [a-zA-Z0-9+\-=*/<>!&|,]
%%

for 						yylval.str=strdup(yytext);return FOR ;
do	 						yylval.str=strdup(yytext);return DO ;
while 						yylval.str=strdup(yytext);return WHILE ;
"(" 						yylval.str=strdup(yytext);return OP ;
";"							yylval.str=strdup(yytext);return SC ;
")"							yylval.str=strdup(yytext);return CL ;
"{"							yylval.str=strdup(yytext);return OP1 ;
"}"							yylval.str=strdup(yytext);return CL1 ;
({text}" "?)*				yylval.str=strdup(yytext);return TEXT ;
[\n \t]+					printf("%s",yytext);
. 							yylval.str=strdup(yytext);return UNR;

%%
