%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include "syntax_tree.h"

// external functions from lex
extern int yylex();
extern int yyparse();
extern int yyrestart();
extern FILE * yyin;

// external variables from lexical_analyzer module
extern int lines;
extern char * yytext;
extern int pos_end;
extern int pos_start;

// Global syntax tree
syntax_tree *gt;

// Error reporting
void yyerror(const char *s);

// Helper functions written for you with love
syntax_tree_node *node(const char *node_name, int children_num, ...);
%}

/* TODO: Complete this definition.
   Hint: See pass_node(), node(), and syntax_tree.h.
         Use forward declaring. */
%union {
    struct syntax_tree_node *node;
}

/* TODO: Your tokens here. */
%token <node> ERROR
%token <node> ADD SUB MUL DIV LT LTE GT GTE EQ NEQ ASSIGN SEMICOLON COMMA MOD NOT AND OR
%token <node> LPARENTHESE RPARENTHESE LBRACKET RBRACKET LSPLINT RSPLINT
%token <node> ELSE IF INT VOID FLOAT CONST WHILE BREAK CONTINUE RETURN
%token <node> Ident IntConst floatConst

%type <node> CompUnit Decl ConstDecl BType ConstDef ConstInitVal VarDecl VarDef InitVal 
%type <node> FuncDef FuncType FuncFParams FuncFParam Block BlockItem Stmt Exp Cond LVal
%type <node> PrimaryExp Number UnaryExp UnaryOp FuncRParams MulExp AddExp RelExp EqExp LAndExp LOrExp ConstExp
%type <node> ConstDefs ConstExps ConstInitVals VarDefs InitVals Exps BlockItems

%start CompUnit

%%
/* TODO: Your rules here. */

/* Example:
program: declaration-list {$$ = node( "program", 1, $1); gt->root = $$;}
       ;
*/

CompUnit 
: Decl {$$ = node("CompUnit", 1, $1); gt->root = $$;}
| FuncDef {$$ = node("CompUnit", 1, $1); gt->root = $$;}
| CompUnit Decl {$$ = node("CompUnit", 2, $1, $2); gt->root = $$;}
| CompUnit FuncDef {$$ = node("CompUnit", 2, $1, $2); gt->root = $$;}

Decl
: ConstDecl {$$ = node("Del", 1, $1);}
| VarDecl {$$ = node("Del", 1, $1);}

ConstDecl
: CONST BType ConstDefs SEMICOLON {$$ = node("ConstDecl", 4, $1, $2, $3, $4);}

ConstDefs
: ConstDef {$$ = node("ConstDefs", 1, $1);}
| ConstDefs COMMA ConstDef {$$ = node("ConstDefs", 3, $1, $2 ,$3);}

BType
: INT {$$ = node("BType", 1, $1);}
| FLOAT {$$ = node("BType", 1, $1);}

ConstDef
: Ident ASSIGN ConstInitVal {$$ = node("ConstDef", 3, $1, $2, $3);}
| Ident ConstExps ASSIGN ConstInitVal {$$ = node("ConstDef", 4, $1, $2, $3, $4);}

ConstExps
: LBRACKET ConstExp RBRACKET {$$ = node("ConstExps", 3, $1, $2, $3);}
| LBRACKET ConstExp RBRACKET ConstExps {$$ = node("ConstExps", 4, $1, $2, $3, $4);}

ConstInitVal
: ConstExp {$$ = node("ConstInitVal", 1, $1);}
| LSPLINT RSPLINT {$$ = node("ConstInitVal", 2, $1, $2);}
| LSPLINT ConstInitVals RSPLINT {$$ = node("ConstInitVal", 3, $1, $2, $3);}

ConstInitVals
: ConstInitVal {$$ = node("ConstInitVals", 1, $1);}
| ConstInitVals COMMA ConstInitVal {$$ = node("ConstInitVals", 3, $1, $2, $3);}

VarDecl
: BType VarDefs SEMICOLON {$$ = node("VarDecl", 3, $1, $2, $3);}

VarDefs
: VarDef {$$ = node("VarDefs", 1, $1);}
| VarDefs COMMA VarDef {$$ = node("VarDefs", 3, $1, $2, $3);}

VarDef
: Ident {$$ = node("VarDef", 1, $1);}
| Ident ConstExps {$$ = node("VarDef", 2, $1, $2);}
| Ident ASSIGN InitVal {$$ = node("VarDef", 3, $1, $2, $3);}
| Ident ConstExps ASSIGN InitVal {$$ = node("VarDef", 4, $1, $2, $3, $4);}

InitVal
: Exp {$$ = node("InitVal", 1, $1);}
| LSPLINT RSPLINT {$$ = node("InitVal", 2, $1, $2);}
| LSPLINT InitVals RSPLINT {$$ = node("InitVal", 3, $1, $2, $3);}

InitVals
: InitVal {$$ = node("InitVals", 1, $1);}
| InitVals COMMA InitVal {$$ = node("InitVals", 3, $1, $2, $3);}

FuncDef
: FuncType Ident LPARENTHESE RPARENTHESE Block {$$ = node("FuncDef", 5, $1, $2, $3, $4, $5);}
| FuncType Ident LPARENTHESE FuncFParams RPARENTHESE Block {$$ = node("FuncDef", 6, $1, $2, $3, $4, $5, $6);}

FuncType
: VOID {$$ = node("FuncType", 1, $1);}
| INT {$$ = node("FuncType", 1, $1);}
| FLOAT {$$ = node("FuncType", 1, $1);}

FuncFParams
: FuncFParam {$$ = node("FuncFParams", 1, $1);}
| FuncFParams COMMA FuncFParam {$$ = node("FuncFParams", 3, $1, $2, $3);}

FuncFParam
: BType Ident {$$ = node("FuncFParam", 2, $1, $2);}
| BType Ident LBRACKET RBRACKET {$$ = node("FuncFParam", 4, $1, $2, $3, $4);}
| BType Ident LBRACKET RBRACKET Exps {$$ = node("FuncFParam", 5, $1, $2, $3, $4, $5);}

Exps
: LBRACKET Exp RBRACKET {$$ = node("Exps", 3, $1, $2, $3);}
| LBRACKET Exp RBRACKET Exps {$$ = node("Exps", 4, $1, $2, $3, $4);}

Block
: LSPLINT RSPLINT {$$ = node("Block", 2, $1, $2);}
| LSPLINT BlockItems RSPLINT {$$ = node("Block", 3, $1, $2, $3);}

BlockItems
: BlockItem {$$ = node("BlockItems", 1, $1);}
| BlockItem BlockItems {$$ = node("BlockItems", 2, $1, $2);}

BlockItem
: Decl {$$ = node("BlockItem", 1, $1);}
| Stmt {$$ = node("BlockItem", 1, $1);}

Stmt
: LVal ASSIGN Exp SEMICOLON {$$ = node("Stmt", 4, $1, $2, $3, $4);}
| SEMICOLON {$$ = node("Stmt", 1, $1);}
| Exp SEMICOLON {$$ = node("Stmt", 2, $1, $2);}
| Block {$$ = node("Stmt", 1, $1);}
| IF LPARENTHESE Cond RPARENTHESE Stmt {$$ = node("Stmt", 5, $1, $2, $3, $4, $5);}
| IF LPARENTHESE Cond RPARENTHESE Stmt ELSE Stmt {$$ = node("Stmt", 7, $1, $2, $3, $4, $5, $6, $7);}
| WHILE LPARENTHESE Cond RPARENTHESE Stmt {$$ = node("Stmt", 5, $1, $2, $3, $4, $5);}
| BREAK SEMICOLON {$$ = node("Stmt", 2, $1, $2);}
| CONTINUE SEMICOLON {$$ = node("Stmt", 2, $1, $2);}
| RETURN SEMICOLON {$$ = node("Stmt", 2, $1, $2);}
| RETURN Exp SEMICOLON {$$ = node("Stmt", 3, $1, $2, $3);}

Exp
: AddExp {$$ = node("Exp", 1, $1);}

Cond
: LOrExp {$$ = node("Cond", 1, $1);}

LVal
: Ident {$$ = node("LVal", 1, $1);}
| Ident Exps {$$ = node("LVal", 2, $1, $2);}

PrimaryExp
: LPARENTHESE Exp RPARENTHESE {$$ = node("PrimaryExp", 3, $1, $2, $3);}
| LVal {$$ = node("PrimaryExp", 1, $1);}
| Number {$$ = node("PrimaryExp", 1, $1);}

Number
: IntConst {$$ = node("Number", 1, $1);}
| floatConst {$$ = node("Number", 1, $1);}

UnaryExp
: PrimaryExp {$$ = node("UnaryExp", 1, $1);}
| Ident LPARENTHESE RPARENTHESE {$$ = node("UnaryExp", 3, $1, $2, $3);}
| Ident LPARENTHESE FuncRParams RPARENTHESE {$$ = node("UnaryExp", 4, $1, $2, $3, $4);}
| UnaryOp UnaryExp {$$ = node("UnaryExp", 2, $1, $2);}

UnaryOp
: ADD {$$ = node("UnaryOp", 1, $1);}
| SUB {$$ = node("UnaryOp", 1, $1);}
| NOT {$$ = node("UnaryOp", 1, $1);}

FuncRParams
: Exp {$$ = node("FuncRParams", 1, $1);}
| FuncRParams COMMA Exp {$$ = node("FuncRParams", 3, $1, $2, $3);}

MulExp
: UnaryExp {$$ = node("MulExp", 1, $1);}
| MulExp MUL UnaryExp {$$ = node("MulExp", 3, $1, $2, $3);}
| MulExp DIV UnaryExp {$$ = node("MulExp", 3, $1, $2, $3);}
| MulExp MOD UnaryExp {$$ = node("MulExp", 3, $1, $2, $3);}

AddExp
: MulExp {$$ = node("AddExp", 1, $1);}
| AddExp ADD MulExp {$$ = node("AddExp", 3, $1, $2, $3);}
| AddExp SUB MulExp {$$ = node("AddExp", 3, $1, $2, $3);}

RelExp
: AddExp  {$$ = node("RelExp", 1, $1);}
| RelExp LT AddExp {$$ = node("RelExp", 3, $1, $2, $3);}
| RelExp LTE AddExp {$$ = node("RelExp", 3, $1, $2, $3);}
| RelExp GT AddExp {$$ = node("RelExp", 3, $1, $2, $3);}
| RelExp GTE AddExp {$$ = node("RelExp", 3, $1, $2, $3);}

EqExp
: RelExp  {$$ = node("EqExp", 1, $1);}
| EqExp EQ RelExp  {$$ = node("EqExp", 3, $1, $2, $3);}
| EqExp NEQ RelExp  {$$ = node("EqExp", 3, $1, $2, $3);}

LAndExp
: EqExp {$$ = node("LAndExp", 1, $1);}
| LAndExp AND EqExp  {$$ = node("LAndExp", 3, $1, $2, $3);}

LOrExp
: LAndExp {$$ = node("LOrExp", 1, $1);}
| LOrExp OR LAndExp  {$$ = node("LOrExp", 3, $1, $2, $3);}

ConstExp
: AddExp {$$ = node("ConstExp", 1, $1);}


%%

/// The error reporting function.
void yyerror(const char * s)
{
    // TO STUDENTS: This is just an example.
    // You can customize it as you like.
    fprintf(stderr, "error at line %d column %d , %d: %s\n", lines, pos_start, pos_end,s);
}

/// Parse input from file `input_path`, and prints the parsing results
/// to stdout.  If input_path is NULL, read from stdin.
///
/// This function initializes essential states before running yyparse().
syntax_tree *parse(const char *input_path)
{
    if (input_path != NULL) {
        if (!(yyin = fopen(input_path, "r"))) {
            fprintf(stderr, "[ERR] Open input file %s failed.\n", input_path);
            exit(1);
        }
    } else {
        yyin = stdin;
    }

    lines = pos_start = pos_end = 1;
    gt = new_syntax_tree();
    yyrestart(yyin);
    yyparse();
    return gt;
}

/// A helper function to quickly construct a tree node.
///
/// e.g. $$ = node("program", 1, $1);
syntax_tree_node *node(const char *name, int children_num, ...)
{
    syntax_tree_node *p = new_syntax_tree_node(name);
    syntax_tree_node *child;
    if (children_num == 0) {
        child = new_syntax_tree_node("epsilon");
        syntax_tree_add_child(p, child);
    } else {
        va_list ap;
        va_start(ap, children_num);
        for (int i = 0; i < children_num; ++i) {
            child = va_arg(ap, syntax_tree_node *);
            syntax_tree_add_child(p, child);
        }
        va_end(ap);
    }
    return p;
}
