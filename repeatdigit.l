%option noyywrap
%{
   #include <string.h>
  int flag=1;
   int freq[10]={0};
%}

%%
[0-9]+ {
  char* str=yytext;
  int n=strlen(str);
  for(int i=0;i<n;i++){
         int digit=str[i]-'0';
         if(digit<0||digit>9){
                 flag=0;
                   break;
         }
         freq[digit]++;
         if(freq[digit]>2){
               flag=0;
               break;
         }
   }
}
\n {
    if(flag==0) {
         printf("This string cannot be recognised!\n");
    }else{
         printf("Given string has atmost one repeated digit\n");
      }
     return 0;
}
. {flag=0;}
%%

int main(){
     printf("Enter a string\n");
     yylex();
     return 0;
}
