#ifndef PARSER_H
#define PARSER_H


/* Token types */
enum TokenType {
    TOKEN_INT = 1,
    TOKEN_STRING,
    TOKEN_DICTIONARY,
    TOKEN_NEW,
    TOKEN_IDENTIFIER,
    TOKEN_WHITESPACE,
    TOKEN_EQUALS,
    TOKEN_SEMICOLON,
    TOKEN_LEFT_ANGLE_BRACKET,
    TOKEN_RIGHT_ANGLE_BRACKET,
    TOKEN_LEFT_PARANTHESES,
    TOKEN_RIGHT_PARANTHESES,
    TOKEN_COMMA,
    TOKEN_ERROR,
};

#endif
