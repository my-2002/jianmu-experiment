%option noyywrap
%{
/*****************声明和选项设置  begin*****************/
#include <stdio.h>
#include <stdlib.h>

#include "syntax_tree.h"
#include "syntax_analyzer.h"

int lines;
int pos_start;
int pos_end;

void pass_node(char *text){
     yylval.node = new_syntax_tree_node(text);
}

/*****************声明和选项设置  end*****************/

%}


%%
 /* to do for students */
 /* two cases for you, pass_node will send flex's token to bison */
/* 专用符号 */
\+ 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
\-   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return SUB;}
\*   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return MUL;}
\/   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return DIV;}
\<   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return LT;}
\<\= {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return LTE;}
\>   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return GT;}
\>\= {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return GTE;}
\=\= {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return EQ;}
\!\= {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return NEQ;}
\=   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return ASSIGN;}
\;   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return SEMICOLON;}
\,   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return COMMA;}
\%   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return MOD;}
\!   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return NOT;}
\&\&  {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return AND;}
\|\|  {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return OR;}

\(   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return LPARENTHESE;}
\)   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return RPARENTHESE;}
\[   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return LBRACKET;}
\]   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return RBRACKET;}
\{   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return LSPLINT;}
\}   {pos_start=pos_end;pos_end=pos_start+1;pass_node(yytext);return RSPLINT;}
 /* 关键字 */
"else" {pos_start=pos_end;pos_end=pos_start+4;pass_node(yytext);return ELSE;}
"if"   {pos_start=pos_end;pos_end=pos_start+2;pass_node(yytext);return IF;}
"int"  {pos_start=pos_end;pos_end=pos_start+3;pass_node(yytext);return INT;}
"return" {pos_start=pos_end;pos_end=pos_start+6;pass_node(yytext);return RETURN;}
"void" {pos_start=pos_end;pos_end=pos_start+4;pass_node(yytext);return VOID;}
"while" {pos_start=pos_end;pos_end=pos_start+5;pass_node(yytext);return WHILE;}
"float" {pos_start=pos_end;pos_end=pos_start+5;pass_node(yytext);return FLOAT;}
"const" {pos_start=pos_end;pos_end=pos_start+5;pass_node(yytext);return CONST;}
"break" {pos_start=pos_end;pos_end=pos_start+5;pass_node(yytext);return BREAK;}
"continue" {pos_start=pos_end;pos_end=pos_start+8;pass_node(yytext);return CONTINUE;}
" " {pos_start=pos_end;pos_end=pos_start+1;}
 /* 其余 */

([a-zA-Z_]+[0-9]*[a-zA-Z_]+) {pos_start=pos_end;pos_end=pos_start+strlen(yytext);pass_node(yytext);return Ident;}
(0X|0x)[0-9a-fA-F]+|[1-9][0-9]*|0[0-7]* {pos_start=pos_end;pos_end=pos_start+strlen(yytext);pass_node(yytext);return IntConst;}
((0x|0X)([0-9a-fA-F]+)|([0-9a-fA-F]+\.|[0-9a-fA-F]*\.[0-9a-fA-F]+)([pP][+-]?\d+))|((\d+\.|\d*\.\d+([eE][+-]?\d+)?)|(\d+[eE][+-]?\d+)) {pos_start=pos_end;pos_end=pos_start+strlen(yytext);pass_node(yytext);return floatConst;}
\/\*([^\*]|\*+[^\/\*])*\*+\/  {}
\/\/.* {}
 /* 保证了中间不会出现\*\/，即判断若出现*，后面那个一定不能是/,这是|后面部分的作用 */
\n { pos_start = 1;pos_end = 1;lines++;}
[\f\n\r\t\v] { pos_end++;pos_start = pos_end;}
. { pos_start = pos_end; pos_end++; return ERROR; }

 /****请在此补全所有flex的模式与动作  end******/
%%
