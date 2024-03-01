#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstdlib>

#include "LexAnalyzer.h"
int GetPosition();

int main(int argc, char** argv)
{ 
    std::ifstream* ifs = new std::ifstream(argv[1]);
    int startpos = 1;
    int endpos = 0;
    InitLexer(ifs);
    for (int token = yylex(); token; token = yylex()) {
        std::cout << "Token: " << token << " '" << Yytext();
endpos = GetPosition();
       std::cout<<  "' Position ["<< startpos<<","<<endpos <<"]" << "\n";
       startpos = endpos+1;
    }

    return 0;
}