%{
#include <stdio.h>
#include <string.h>
#include "tokens.h"
%}

%option yylineno
%option noyywrap

/* --- Regex Definitions --- */
DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*

%%
"/#".*          { /* Ye manual me nahi likha tha par test.txt files me kyu tha */ }
"//".*          { /* ignoring comments */ }
[ \t\r\n]+      { }

"if"            { return T_IF; }
"else"          { return T_ELSE; }
"while"         { return T_WHILE; }
"for"           { return T_FOR; }
"return"        { return T_RETURN; }
"int"           { return T_INT; }
"float"         { return T_FLOAT; }
"void"          { return T_VOID; }
"bool"          { return T_BOOL; }
"main"          { return T_MAIN; }
"cin"           { return T_CIN; }
"cout"          { return T_COUT; }
"true"          { return T_BOOL_LIT; }
"false"         { return T_BOOL_LIT; }

"=="            { return T_EQ; }
"!="            { return T_NEQ; }
"<="            { return T_LE; }
">="            { return T_GE; }
"&&"            { return T_AND; }
"||"            { return T_OR; }
"++"            { return T_INCREMENT; }
"--"            { return T_DECREMENT; }
"<<"            { return T_STREAM_OUT; }
">>"            { return T_STREAM_IN; }

{DIGIT}+\.{DIGIT}+ { return T_FLOAT_LIT; }
{DIGIT}+          { return T_INT_LIT; }

{ID}            { return T_ID; }

"+"             { return T_PLUS; }
"-"             { return T_MINUS; }
"*"             { return T_MULT; }
"/"             { return T_DIV; }
"%"             { return T_MOD; }
"="             { return T_ASSIGN; }
"<"             { return T_LT; }
">"             { return T_GT; }
"!"             { return T_NOT; }
"("             { return T_LPAREN; }
")"             { return T_RPAREN; }
"{"             { return T_LBRACE; }
"}"             { return T_RBRACE; }
"["             { return T_LBRACKET; }
"]"             { return T_RBRACKET; }
";"             { return T_SEMI; }
","             { return T_COMMA; }

.               { return T_ERROR; }

%%