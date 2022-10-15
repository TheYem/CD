%option noyywrap
digit [0-9]
letter [A-Za-z]
%{
int count=0;
int c=0;
char word[1000];
int i=0;
#include<stdio.h>
%}
%%
[aeiouAEIOU] {count++;}
[\n] {if (count>=2){
        printf("this word has atleast 2 vowels"); c++;} count=0;
        }
.;
end {return 0;}

%%

int main(void){
yylex();
printf("No. of Words with atleast 2 vowels is %d \n",c);
return 0;
}
