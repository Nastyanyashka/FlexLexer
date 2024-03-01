#include "LexAnalyzer.h"

#include "FlexLexer.h"


namespace {
	yyFlexLexer* lexer = nullptr;
}

int yylex() {
	return lexer->yylex();
}

const char* Yytext(){
	
    return lexer->YYText();
}

void InitLexer(std::istream* stream) {
	if (lexer) {
		delete lexer;
	}

	lexer = new yyFlexLexer(stream);
}

void DestroyLexer() {
	if (lexer) {
		delete lexer;
	}
}

