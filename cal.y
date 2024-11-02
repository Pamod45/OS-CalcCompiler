%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
int symbols[52];
void yyerror (char *s);
int yylex();
int symbolVar(char symbol);  
double getExponentiation(double base, double exponent);  
void updateSymbolVal(char symbol, double val);
double getModulus(double num1,double num2);
%}

%union { double num; char id; }
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%left '+' '-'
%left '*' '/' '%'
%left '^'
%left '(' ')'
%type <num> line exp term primary factor statement
%type <id> assignment

%%

line        :   statement '\n'              {$$=$1;}             
            |   line statement '\n'         {$$=$1;}
            ;
statement   :   assignment ';'              {;}
            |   print exp ';'               { printf("%.3f\n", $2); }
            |   exit_command ';'            { exit(EXIT_SUCCESS); }
            |   statement assignment ';'    {;}
            ;

assignment  :   identifier  '=' exp         { updateSymbolVal($1, $3); }
            |   identifier                  {yyerror("Variable declare without assignment"); exit(EXIT_FAILURE);}
            |   identifier '='              {yyerror("Variable assigned without a value"); exit(EXIT_FAILURE);}
            ;

exp         :   term                        { $$ = $1 ;}
            |   exp '+' term                { $$ = $1 + $3 ;}
            |   exp '-' term                { $$ = $1 - $3 ;} 
            ;

term        :   factor                      { $$ = $1; }            
            |   term '*' factor             { $$ = $1 * $3; }
            |   term '/' factor             { $$ = $1 / $3; }  
            |   term '%' factor             { $$ = getModulus($1, $3); }  
            ;

factor      :   primary                     {$$ = $1;}
            |   factor '^' primary          {$$ = getExponentiation($1, $3);}
            ;

primary     :   number                      { $$ = $1; }
            |   identifier                  { $$ = symbolVar($1); }
            |   '(' exp ')'                 { $$ = $2; }
            ;

%%
double getModulus(double num1,double num2){
    double mod = num1-(int)(num1/num2)*num2;
    return mod;
}
double getExponentiation(double base, double exponent){
    double num = base;
    for(int i = 1; i < exponent; i++){
        num = base * num;
    }
    return num;
}

int computeSymbolIndex(char token){
    int index = -1;
    if(islower(token)){
        index = token - 'a' + 26;
    }
    else if(isupper(token)){
        index = token - 'A';
    }
    return index;
}

int symbolVar(char symbol){
    int bucket = computeSymbolIndex(symbol);
    return symbols[bucket];
}

void updateSymbolVal(char symbol, double val){
    int bucket = computeSymbolIndex(symbol);
    symbols[bucket] = val;
}

void yyerror(char *s){
    fprintf(stderr, "Syntax Error :%s\n",s);
}

int main(void){
    for(int i = 0; i < 52; i++){
        symbols[i] = 0;
    }
    return yyparse();
}