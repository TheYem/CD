%option noyywrap
%{
        #include<stdio.h>
%}
%%
"+" {fprintf(yyout, "|| "); }
"*" {fprintf(yyout, "&& "); }
. {fprintf(yyout, "%s", yytext); }
%%
int main(int argc, char* argv[]){
        if(argc>1){
                FILE *fp = fopen(argv[1], "r");
                if(fp)  yyin = fp;
        }
        yylex();
        printf("\n\n");
        return 0;
}
