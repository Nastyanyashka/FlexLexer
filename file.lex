%{

#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>

#include "Parser.h"
#include "LexAnalyzer.h"
int position = 0;

%}

white_space       [ \t]*
digit             [0-9]
alpha             [A-Za-z_]
alpha_num         ({alpha}|{digit})
hex_digit         [0-9a-fA-F]
identifier        {alpha}{alpha_num}*
unsigned_integer  {digit}+
hex_integer       ${hex_digit}{hex_digit}*
exponent          e[+-]?{digit}+
i                 {unsigned_integer}
real              ({i}\.{i}?|{i}?\.{i}){exponent}?
string            \'([^'\n]|\'\')*\'
bad_string        \'([^'\n]|\'\')*

%x COMMENT

%option batch noyywrap c++
%option yylineno

%%

int            position+=3; return TOKEN_INT;
string         position+=6; return TOKEN_STRING;
Dictionary     position+=10; return TOKEN_DICTIONARY;
new            position+=3; return TOKEN_NEW;

{alpha}{alpha_num}* position+=YYLeng(); return TOKEN_IDENTIFIER;


"("                 position+=1;return TOKEN_LEFT_PARANTHESES;
")"                 position+=1;return TOKEN_RIGHT_PARANTHESES;
"<"                 position+=1;return TOKEN_LEFT_ANGLE_BRACKET;
">"                 position+=1;return TOKEN_RIGHT_ANGLE_BRACKET;
","                 position+=1;return TOKEN_COMMA;
";"                 position+=1;return TOKEN_SEMICOLON;
"="                 position+=1;return TOKEN_EQUALS;

{white_space}        {position+=1; return TOKEN_WHITESPACE; }
[\n\r] {position+=1;return TOKEN_WHITESPACE;}
.                    std::cerr << "Lexer error (line " << lineno() << "): " << ": lexeme '" << YYText() << "'\n";
%%

int GetPosition()
{
    return position;
}