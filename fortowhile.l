%option noyywrap
%{
                                                                                                                                                                                             
#include <string.h>
        int inside_loop = 0;
        char init_buffer[20], cond_buffer[20], step_buffer[20], other_buffer[20];
%}
%option noyywrap
%%
                                                                                                                                                                                             
for\( {inside_loop = 1;}
                                                                                                                                                                                             
\)    {inside_loop = 0;}
                                                                                                                                                                                             
[a-z]\=[1-9]* {if(inside_loop) strcat(init_buffer,yytext); else strcat(other_buffer, yytext);}
                                                                                                                                                                                             
[a-z][<>=!][=].. {if(inside_loop) strcat(cond_buffer,yytext);strcat(other_buffer, yytext);}
                                                                                                                                                                                             
[a-z][-+]*           {if(inside_loop) strcat(step_buffer,yytext);strcat(other_buffer, yytext);}
                                                                                                                                                                                             
.                       {strcat(other_buffer, yytext);}
                                                                                                                                                                                             
%%
int main(int argc, char* argv[]) {
        if(argc > 1) {
                FILE* fp = fopen(argv[1], "r");
                if(fp)
                        yyin = fp;                                                                                                                                                           
        }                                                                                                                                                                                    
        yylex();                                                                                                                                                                             
        FILE* fp = fopen("spotoutput2.txt", "w");
        fprintf(fp, "%s\nwhile(%s) {\n%s;\n}\n", init_buffer, cond_buffer, step_buffer);
        fclose(fp);                                                                                                                                                                          
        return 0;
}
