#pragma once

#include <istream>

int yylex();
const char* Yytext();
void InitLexer(std::istream* stream);
void DestroyLexer();
