%option noyywrap
%{
  #include <stdio.h>
  int flag=0;
%}

%%
end {return 0;}
[A-Z] {flag=0;printf("String not Matched");return 0;}
(aeiou)* {flag=1;}
\n {if(flag==1)printf("String Matched\n");return 0;}
. flag=0;

%%

int main(){
     yylex();
     return 0;
}
