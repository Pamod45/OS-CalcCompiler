%{
    #include "y.tab.h"
    void yyerror(char *s);
    int yylex();
%}

%%

[\n]        { return '\n';}
"print"     { return print;}
"exit"      { return exit_command;}
[a-zA-Z]    { yylval.id=yytext[0]; return identifier;}
[0-9]+(\.[0-9]+)?     { yylval.num=strtod(yytext,NULL); return number;}
[ \t]       { ; }
[()\-+=*/%^;] { return yytext[0];}
.           { fprintf(stderr,"Unexpected character: %c \nError at line no:%d \n",yytext[0],yylineno); exit(EXIT_FAILURE);}


%%

int yywrap(void){return 1;}