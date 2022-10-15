%option noyywrap
%{
        int t = 0;
%}

%%
^[a]*$  {t = 1;}
^abb$   {t = 1;}
^[a]*[b]+$      {t = 1;}
end     {return 0;}
\n      {if(t) printf(" - valid\n"); else printf(" - invalid\n"); t = 0;}
%%
int main(){
        printf("Enter strings:\n");
        yylex();
        return 0;
}

