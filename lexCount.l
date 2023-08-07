%{
#include <stdio.h>
int keyword_count = 0;
int identifier_count = 0;
int digit_count = 0;
int line_count = 0;
int operator_count = 0;
int special_cnt = 0;
int spaces_cnt = 0;
int tab_cnt =0;
int string_literal_cnt = 0;
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
OPERATOR    [-+*/=<>]

%%
\n          { line_count++; }
[ ]+        { spaces_cnt++; } 
[	\t]+		{tab_cnt++;}

"int"|"float"|"char"|"case"|"default"|"if"|"for"|"printf"|"scanf" {
    keyword_count++;
}

{LETTER}({LETTER}|{DIGIT})* {

    identifier_count++;
}

\"[^\"]*\" {
	string_literal_cnt++;
}

{DIGIT}+    {

    digit_count++;
}

{OPERATOR}  {
    operator_count++;
}


[=,;(){}] {	
	special_cnt++;
}


%%

int main()
{	
	printf("Enter the Sentence : ");
     while (yylex() != 0) {
        // Loop until end of input (Ctrl+D)
    }

    printf("Number of keywords: %d\n", keyword_count);
    printf("Number of identifiers: %d\n", identifier_count);
    printf("Number of digits: %d\n", digit_count);
    printf("Number of lines: %d\n", line_count-1);
    printf("Number of operators: %d\n", operator_count);
    printf("Number of Special characters: %d\n", special_cnt);
    printf("Number of Tab spaces : %d\n", tab_cnt);
    printf("Number of spaces : %d\n", spaces_cnt);
	
    printf("Number of String Literals : %d\n", string_literal_cnt);
    return 0;
}


int yywrap(){ return 1;    }
