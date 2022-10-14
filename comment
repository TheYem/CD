%option noyywrap
S \/\*
E \*\/
%{
int flag=0;
%}
%%
{S}(.)\"{E}\"(.){E} {
    printf("Given String is a comment\n");
    flag=1;
}
{S}(.){E}(.){E} {
    flag=0;
}
{S}(.*){E} {
     printf("Given String is a comment\n");
     flag=1;
}
\n {
   if(flag==0){
         printf("This string cannot be recognised\n");
         return 0;
      }
}
end {return 0;}
%%

int main(){
    printf("Enter a string:");
    yylex();
return 0;
}
