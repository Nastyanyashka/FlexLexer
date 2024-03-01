flex++ -s -o  lexer.cpp ./file.lex

g++ -Wall driver.cpp lexer.cpp LexAnalyzer.cpp -o driver