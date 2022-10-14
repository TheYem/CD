%option noyywrap
%{
#include<stdio.h>
char arr[100];
int i=0;
%}
%%
(abc) {arr[i++]='A';arr[i++]='B';arr[i++]='C';}
[a-zA-Z] {arr[i++]=*yytext;}
\n {arr[i]='\0'; printf("%s\n",arr); return 0;}
%%

int main(){
extern FILE *yyin;
yyin= fopen("spot.txt","r");
yylex();
return 0;
}
