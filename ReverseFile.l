%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}
%%
[a-zA-Z0-9]+ {char *temp=yytext,arr[100];
int n=strlen(temp);
for (int i=0;i<n;i++) arr[n-i-1]=temp[i];
arr[n] = '\0';
fprintf (yyout,"%s", arr);}
. {fprintf (yyout,"%s",yytext);}
%%

int main(){
extern FILE *yyin,*yyout;
yyin= fopen("input.txt","r");
yyout= fopen("output.txt","w");
yylex();
return 0;
}
