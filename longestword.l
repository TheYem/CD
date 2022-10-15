%option noyywrap

%{
int longest = 0;
int length;
#include<stdio.h>
%}
%%
[A-Z|a-z] {length++;}
[ ] {if(length>longest) longest=length; length=0;}

.;
\n {return 0;}

%%

int main(void){
yylex();
printf("Length of Longest Word:%d \n",longest);
return 0;
}
