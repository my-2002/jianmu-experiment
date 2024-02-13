/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "syntax_analyzer.y"

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

#line 101 "syntax_analyzer.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ERROR = 258,                   /* ERROR  */
    ADD = 259,                     /* ADD  */
    SUB = 260,                     /* SUB  */
    MUL = 261,                     /* MUL  */
    DIV = 262,                     /* DIV  */
    LT = 263,                      /* LT  */
    LTE = 264,                     /* LTE  */
    GT = 265,                      /* GT  */
    GTE = 266,                     /* GTE  */
    EQ = 267,                      /* EQ  */
    NEQ = 268,                     /* NEQ  */
    ASSIGN = 269,                  /* ASSIGN  */
    SEMICOLON = 270,               /* SEMICOLON  */
    COMMA = 271,                   /* COMMA  */
    MOD = 272,                     /* MOD  */
    NOT = 273,                     /* NOT  */
    AND = 274,                     /* AND  */
    OR = 275,                      /* OR  */
    LPARENTHESE = 276,             /* LPARENTHESE  */
    RPARENTHESE = 277,             /* RPARENTHESE  */
    LBRACKET = 278,                /* LBRACKET  */
    RBRACKET = 279,                /* RBRACKET  */
    LSPLINT = 280,                 /* LSPLINT  */
    RSPLINT = 281,                 /* RSPLINT  */
    ELSE = 282,                    /* ELSE  */
    IF = 283,                      /* IF  */
    INT = 284,                     /* INT  */
    VOID = 285,                    /* VOID  */
    FLOAT = 286,                   /* FLOAT  */
    CONST = 287,                   /* CONST  */
    WHILE = 288,                   /* WHILE  */
    BREAK = 289,                   /* BREAK  */
    CONTINUE = 290,                /* CONTINUE  */
    RETURN = 291,                  /* RETURN  */
    Ident = 292,                   /* Ident  */
    IntConst = 293,                /* IntConst  */
    floatConst = 294               /* floatConst  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 34 "syntax_analyzer.y"

    struct syntax_tree_node *node;

#line 191 "syntax_analyzer.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ERROR = 3,                      /* ERROR  */
  YYSYMBOL_ADD = 4,                        /* ADD  */
  YYSYMBOL_SUB = 5,                        /* SUB  */
  YYSYMBOL_MUL = 6,                        /* MUL  */
  YYSYMBOL_DIV = 7,                        /* DIV  */
  YYSYMBOL_LT = 8,                         /* LT  */
  YYSYMBOL_LTE = 9,                        /* LTE  */
  YYSYMBOL_GT = 10,                        /* GT  */
  YYSYMBOL_GTE = 11,                       /* GTE  */
  YYSYMBOL_EQ = 12,                        /* EQ  */
  YYSYMBOL_NEQ = 13,                       /* NEQ  */
  YYSYMBOL_ASSIGN = 14,                    /* ASSIGN  */
  YYSYMBOL_SEMICOLON = 15,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 16,                     /* COMMA  */
  YYSYMBOL_MOD = 17,                       /* MOD  */
  YYSYMBOL_NOT = 18,                       /* NOT  */
  YYSYMBOL_AND = 19,                       /* AND  */
  YYSYMBOL_OR = 20,                        /* OR  */
  YYSYMBOL_LPARENTHESE = 21,               /* LPARENTHESE  */
  YYSYMBOL_RPARENTHESE = 22,               /* RPARENTHESE  */
  YYSYMBOL_LBRACKET = 23,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 24,                  /* RBRACKET  */
  YYSYMBOL_LSPLINT = 25,                   /* LSPLINT  */
  YYSYMBOL_RSPLINT = 26,                   /* RSPLINT  */
  YYSYMBOL_ELSE = 27,                      /* ELSE  */
  YYSYMBOL_IF = 28,                        /* IF  */
  YYSYMBOL_INT = 29,                       /* INT  */
  YYSYMBOL_VOID = 30,                      /* VOID  */
  YYSYMBOL_FLOAT = 31,                     /* FLOAT  */
  YYSYMBOL_CONST = 32,                     /* CONST  */
  YYSYMBOL_WHILE = 33,                     /* WHILE  */
  YYSYMBOL_BREAK = 34,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 35,                  /* CONTINUE  */
  YYSYMBOL_RETURN = 36,                    /* RETURN  */
  YYSYMBOL_Ident = 37,                     /* Ident  */
  YYSYMBOL_IntConst = 38,                  /* IntConst  */
  YYSYMBOL_floatConst = 39,                /* floatConst  */
  YYSYMBOL_YYACCEPT = 40,                  /* $accept  */
  YYSYMBOL_CompUnit = 41,                  /* CompUnit  */
  YYSYMBOL_Decl = 42,                      /* Decl  */
  YYSYMBOL_ConstDecl = 43,                 /* ConstDecl  */
  YYSYMBOL_ConstDefs = 44,                 /* ConstDefs  */
  YYSYMBOL_BType = 45,                     /* BType  */
  YYSYMBOL_ConstDef = 46,                  /* ConstDef  */
  YYSYMBOL_ConstExps = 47,                 /* ConstExps  */
  YYSYMBOL_ConstInitVal = 48,              /* ConstInitVal  */
  YYSYMBOL_ConstInitVals = 49,             /* ConstInitVals  */
  YYSYMBOL_VarDecl = 50,                   /* VarDecl  */
  YYSYMBOL_VarDefs = 51,                   /* VarDefs  */
  YYSYMBOL_VarDef = 52,                    /* VarDef  */
  YYSYMBOL_InitVal = 53,                   /* InitVal  */
  YYSYMBOL_InitVals = 54,                  /* InitVals  */
  YYSYMBOL_FuncDef = 55,                   /* FuncDef  */
  YYSYMBOL_FuncFParams = 56,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 57,                /* FuncFParam  */
  YYSYMBOL_Exps = 58,                      /* Exps  */
  YYSYMBOL_Block = 59,                     /* Block  */
  YYSYMBOL_BlockItems = 60,                /* BlockItems  */
  YYSYMBOL_BlockItem = 61,                 /* BlockItem  */
  YYSYMBOL_Stmt = 62,                      /* Stmt  */
  YYSYMBOL_Exp = 63,                       /* Exp  */
  YYSYMBOL_Cond = 64,                      /* Cond  */
  YYSYMBOL_LVal = 65,                      /* LVal  */
  YYSYMBOL_PrimaryExp = 66,                /* PrimaryExp  */
  YYSYMBOL_Number = 67,                    /* Number  */
  YYSYMBOL_UnaryExp = 68,                  /* UnaryExp  */
  YYSYMBOL_UnaryOp = 69,                   /* UnaryOp  */
  YYSYMBOL_FuncRParams = 70,               /* FuncRParams  */
  YYSYMBOL_MulExp = 71,                    /* MulExp  */
  YYSYMBOL_AddExp = 72,                    /* AddExp  */
  YYSYMBOL_RelExp = 73,                    /* RelExp  */
  YYSYMBOL_EqExp = 74,                     /* EqExp  */
  YYSYMBOL_LAndExp = 75,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 76,                    /* LOrExp  */
  YYSYMBOL_ConstExp = 77                   /* ConstExp  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   252

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  38
/* YYNRULES -- Number of rules.  */
#define YYNRULES  98
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  170

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   294


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    61,    61,    62,    63,    64,    67,    68,    71,    74,
      75,    78,    79,    80,    83,    84,    87,    88,    91,    92,
      93,    96,    97,   100,   103,   104,   107,   108,   109,   110,
     113,   114,   115,   118,   119,   122,   123,   126,   127,   130,
     131,   132,   135,   136,   139,   140,   143,   144,   147,   148,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   160,
     161,   164,   167,   170,   171,   174,   175,   176,   179,   180,
     183,   184,   185,   186,   189,   190,   191,   194,   195,   198,
     199,   200,   201,   204,   205,   206,   209,   210,   211,   212,
     213,   216,   217,   218,   221,   222,   225,   226,   229
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ERROR", "ADD", "SUB",
  "MUL", "DIV", "LT", "LTE", "GT", "GTE", "EQ", "NEQ", "ASSIGN",
  "SEMICOLON", "COMMA", "MOD", "NOT", "AND", "OR", "LPARENTHESE",
  "RPARENTHESE", "LBRACKET", "RBRACKET", "LSPLINT", "RSPLINT", "ELSE",
  "IF", "INT", "VOID", "FLOAT", "CONST", "WHILE", "BREAK", "CONTINUE",
  "RETURN", "Ident", "IntConst", "floatConst", "$accept", "CompUnit",
  "Decl", "ConstDecl", "ConstDefs", "BType", "ConstDef", "ConstExps",
  "ConstInitVal", "ConstInitVals", "VarDecl", "VarDefs", "VarDef",
  "InitVal", "InitVals", "FuncDef", "FuncFParams", "FuncFParam", "Exps",
  "Block", "BlockItems", "BlockItem", "Stmt", "Exp", "Cond", "LVal",
  "PrimaryExp", "Number", "UnaryExp", "UnaryOp", "FuncRParams", "MulExp",
  "AddExp", "RelExp", "EqExp", "LAndExp", "LOrExp", "ConstExp", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-139)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     202,  -139,  -139,  -139,    86,   134,  -139,  -139,   -26,  -139,
    -139,    25,  -139,  -139,  -139,    10,    28,  -139,   147,    58,
    -139,   176,    74,   206,    44,  -139,    29,   191,    56,  -139,
      25,  -139,  -139,  -139,   206,    42,   114,  -139,  -139,  -139,
    -139,  -139,  -139,  -139,  -139,   206,     6,    23,    63,    55,
      69,  -139,    23,   121,   176,   148,  -139,    72,  -139,  -139,
     191,  -139,   116,  -139,  -139,    13,   199,   206,  -139,  -139,
     206,   206,   206,   206,   206,   118,  -139,   137,    86,    63,
     144,  -139,  -139,  -139,    45,  -139,  -139,   176,  -139,  -139,
    -139,    73,   152,  -139,  -139,  -139,     6,     6,  -139,  -139,
     156,   157,   153,   183,   103,  -139,    29,  -139,   173,   154,
    -139,   185,   188,   194,  -139,  -139,  -139,   191,  -139,  -139,
     206,  -139,   196,   206,   206,  -139,  -139,  -139,   207,  -139,
    -139,  -139,   206,   196,  -139,  -139,  -139,   201,    23,   197,
     100,   216,   205,   204,  -139,   224,  -139,    17,   206,   206,
     206,   206,   206,   206,   206,   206,    17,  -139,   213,    23,
      23,    23,    23,   197,   197,   100,   216,  -139,    17,  -139
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    11,    13,    12,     0,     0,     2,     6,     0,     7,
       3,     0,     1,     4,     5,    26,     0,    24,     0,     0,
       9,     0,     0,     0,    27,    23,     0,     0,     0,     8,
       0,    74,    75,    76,     0,     0,    63,    68,    69,    28,
      30,    66,    70,    67,    79,     0,    83,    61,     0,     0,
       0,    37,    98,     0,     0,    26,    25,     0,    14,    18,
       0,    10,     0,    31,    33,     0,     0,     0,    64,    73,
       0,     0,     0,     0,     0,     0,    35,    39,     0,     0,
      16,    29,    19,    21,     0,    15,    65,     0,    32,    71,
      77,     0,     0,    80,    81,    82,    84,    85,    51,    44,
       0,     0,     0,     0,     0,    48,     0,    53,     0,    46,
      49,     0,    66,     0,    38,    36,    17,     0,    20,    34,
       0,    72,    42,     0,     0,    57,    58,    59,     0,    45,
      47,    52,     0,    40,    22,    78,    43,     0,    86,    91,
      94,    96,    62,     0,    60,     0,    41,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    50,    54,    87,
      88,    89,    90,    92,    93,    95,    97,    56,     0,    55
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -139,  -139,    15,  -139,  -139,    -3,   211,   -16,   -52,  -139,
    -139,  -139,   220,   -28,  -139,   237,  -139,   169,  -108,   -38,
     139,  -139,  -138,   -18,   125,   -69,  -139,  -139,    12,  -139,
    -139,    46,   -23,    21,    96,    97,  -139,   228
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     5,   105,     7,    19,     8,    20,    24,    58,    84,
       9,    16,    17,    39,    65,    10,    50,    51,    68,   107,
     108,   109,   110,   111,   137,    41,    42,    43,    44,    45,
      91,    46,    47,   139,   140,   141,   142,    59
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      52,    11,    28,    40,    52,    83,   112,    64,    85,   158,
      76,    15,    70,    71,   136,     6,    62,    40,   167,    49,
      13,    31,    32,    72,    21,   146,    81,    73,    74,    87,
     169,    22,    98,    23,    52,    33,    40,    52,    34,    88,
     112,   115,    75,    25,    26,   100,    31,    32,    90,    92,
     101,   102,   103,   104,    36,    37,    38,    69,    54,   119,
      33,   117,    18,    34,   116,   134,    55,    35,    63,    40,
      60,   118,   106,    29,    30,    49,    31,    32,   112,    36,
      37,    38,    93,    94,    95,    78,   128,   112,    75,   120,
      33,    79,    77,    34,    52,   121,    48,    57,    82,   112,
     138,   138,   135,     1,     2,     3,   106,    31,    32,    36,
      37,    38,   152,   153,   145,     1,     2,     3,   127,    96,
      97,    33,    31,    32,    34,   159,   160,   161,   162,   138,
     138,   138,   138,    98,    12,    66,    33,    67,    86,    34,
      36,    37,    38,    75,    99,    80,   100,     1,     2,     3,
       4,   101,   102,   103,   104,    36,    37,    38,    31,    32,
     113,    27,    21,     1,     2,     3,     4,    23,   125,    98,
      23,    23,    33,   163,   164,    34,   122,   123,   124,    75,
      31,    32,   100,     1,     2,     3,     4,   101,   102,   103,
     104,    36,    37,    38,    33,    31,    32,    34,   126,   129,
     131,    35,   132,    31,    32,   148,   149,   150,   151,    33,
      31,    32,    34,    36,    37,    38,    57,    33,   133,    67,
      34,    89,   144,   147,    33,   155,   156,    34,    36,    37,
      38,     1,     2,     3,     4,   154,    36,    37,    38,   157,
     168,    61,    14,    36,    37,    38,    56,   114,   130,   143,
     165,    53,   166
};

static const yytype_uint8 yycheck[] =
{
      23,     4,    18,    21,    27,    57,    75,    35,    60,   147,
      48,    37,     6,     7,   122,     0,    34,    35,   156,    22,
       5,     4,     5,    17,    14,   133,    54,     4,     5,    16,
     168,    21,    15,    23,    57,    18,    54,    60,    21,    26,
     109,    79,    25,    15,    16,    28,     4,     5,    66,    67,
      33,    34,    35,    36,    37,    38,    39,    45,    14,    87,
      18,    16,    37,    21,    80,   117,    37,    25,    26,    87,
      14,    26,    75,    15,    16,    78,     4,     5,   147,    37,
      38,    39,    70,    71,    72,    16,   104,   156,    25,    16,
      18,    22,    37,    21,   117,    22,    22,    25,    26,   168,
     123,   124,   120,    29,    30,    31,   109,     4,     5,    37,
      38,    39,    12,    13,   132,    29,    30,    31,    15,    73,
      74,    18,     4,     5,    21,   148,   149,   150,   151,   152,
     153,   154,   155,    15,     0,    21,    18,    23,    22,    21,
      37,    38,    39,    25,    26,    24,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,     4,     5,
      23,    14,    14,    29,    30,    31,    32,    23,    15,    15,
      23,    23,    18,   152,   153,    21,    24,    21,    21,    25,
       4,     5,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    18,     4,     5,    21,    15,    26,
      15,    25,    14,     4,     5,     8,     9,    10,    11,    18,
       4,     5,    21,    37,    38,    39,    25,    18,    24,    23,
      21,    22,    15,    22,    18,    20,    22,    21,    37,    38,
      39,    29,    30,    31,    32,    19,    37,    38,    39,    15,
      27,    30,     5,    37,    38,    39,    26,    78,   109,   124,
     154,    23,   155
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    29,    30,    31,    32,    41,    42,    43,    45,    50,
      55,    45,     0,    42,    55,    37,    51,    52,    37,    44,
      46,    14,    21,    23,    47,    15,    16,    14,    47,    15,
      16,     4,     5,    18,    21,    25,    37,    38,    39,    53,
      63,    65,    66,    67,    68,    69,    71,    72,    22,    45,
      56,    57,    72,    77,    14,    37,    52,    25,    48,    77,
      14,    46,    63,    26,    53,    54,    21,    23,    58,    68,
       6,     7,    17,     4,     5,    25,    59,    37,    16,    22,
      24,    53,    26,    48,    49,    48,    22,    16,    26,    22,
      63,    70,    63,    68,    68,    68,    71,    71,    15,    26,
      28,    33,    34,    35,    36,    42,    45,    59,    60,    61,
      62,    63,    65,    23,    57,    59,    47,    16,    26,    53,
      16,    22,    24,    21,    21,    15,    15,    15,    63,    26,
      60,    15,    14,    24,    48,    63,    58,    64,    72,    73,
      74,    75,    76,    64,    15,    63,    58,    22,     8,     9,
      10,    11,    12,    13,    19,    20,    22,    15,    62,    72,
      72,    72,    72,    73,    73,    74,    75,    62,    27,    62
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    40,    41,    41,    41,    41,    42,    42,    43,    44,
      44,    45,    45,    45,    46,    46,    47,    47,    48,    48,
      48,    49,    49,    50,    51,    51,    52,    52,    52,    52,
      53,    53,    53,    54,    54,    55,    55,    56,    56,    57,
      57,    57,    58,    58,    59,    59,    60,    60,    61,    61,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    63,    64,    65,    65,    66,    66,    66,    67,    67,
      68,    68,    68,    68,    69,    69,    69,    70,    70,    71,
      71,    71,    71,    72,    72,    72,    73,    73,    73,    73,
      73,    74,    74,    74,    75,    75,    76,    76,    77
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     2,     1,     1,     4,     1,
       3,     1,     1,     1,     3,     4,     3,     4,     1,     2,
       3,     1,     3,     3,     1,     3,     1,     2,     3,     4,
       1,     2,     3,     1,     3,     5,     6,     1,     3,     2,
       4,     5,     3,     4,     2,     3,     1,     2,     1,     1,
       4,     1,     2,     1,     5,     7,     5,     2,     2,     2,
       3,     1,     1,     1,     2,     3,     1,     1,     1,     1,
       1,     3,     4,     2,     1,     1,     1,     1,     3,     1,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     1,     3,     1,     3,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* CompUnit: Decl  */
#line 61 "syntax_analyzer.y"
       {(yyval.node) = node("CompUnit", 1, (yyvsp[0].node)); gt->root = (yyval.node);}
#line 1378 "syntax_analyzer.tab.c"
    break;

  case 3: /* CompUnit: FuncDef  */
#line 62 "syntax_analyzer.y"
          {(yyval.node) = node("CompUnit", 1, (yyvsp[0].node)); gt->root = (yyval.node);}
#line 1384 "syntax_analyzer.tab.c"
    break;

  case 4: /* CompUnit: CompUnit Decl  */
#line 63 "syntax_analyzer.y"
                {(yyval.node) = node("CompUnit", 2, (yyvsp[-1].node), (yyvsp[0].node)); gt->root = (yyval.node);}
#line 1390 "syntax_analyzer.tab.c"
    break;

  case 5: /* CompUnit: CompUnit FuncDef  */
#line 64 "syntax_analyzer.y"
                   {(yyval.node) = node("CompUnit", 2, (yyvsp[-1].node), (yyvsp[0].node)); gt->root = (yyval.node);}
#line 1396 "syntax_analyzer.tab.c"
    break;

  case 6: /* Decl: ConstDecl  */
#line 67 "syntax_analyzer.y"
            {(yyval.node) = node("Del", 1, (yyvsp[0].node));}
#line 1402 "syntax_analyzer.tab.c"
    break;

  case 7: /* Decl: VarDecl  */
#line 68 "syntax_analyzer.y"
          {(yyval.node) = node("Del", 1, (yyvsp[0].node));}
#line 1408 "syntax_analyzer.tab.c"
    break;

  case 8: /* ConstDecl: CONST BType ConstDefs SEMICOLON  */
#line 71 "syntax_analyzer.y"
                                  {(yyval.node) = node("ConstDecl", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1414 "syntax_analyzer.tab.c"
    break;

  case 9: /* ConstDefs: ConstDef  */
#line 74 "syntax_analyzer.y"
           {(yyval.node) = node("ConstDefs", 1, (yyvsp[0].node));}
#line 1420 "syntax_analyzer.tab.c"
    break;

  case 10: /* ConstDefs: ConstDefs COMMA ConstDef  */
#line 75 "syntax_analyzer.y"
                           {(yyval.node) = node("ConstDefs", 3, (yyvsp[-2].node), (yyvsp[-1].node) ,(yyvsp[0].node));}
#line 1426 "syntax_analyzer.tab.c"
    break;

  case 11: /* BType: INT  */
#line 78 "syntax_analyzer.y"
      {(yyval.node) = node("BType", 1, (yyvsp[0].node));}
#line 1432 "syntax_analyzer.tab.c"
    break;

  case 12: /* BType: FLOAT  */
#line 79 "syntax_analyzer.y"
        {(yyval.node) = node("BType", 1, (yyvsp[0].node));}
#line 1438 "syntax_analyzer.tab.c"
    break;

  case 13: /* BType: VOID  */
#line 80 "syntax_analyzer.y"
       {(yyval.node) = node("BType", 1, (yyvsp[0].node));}
#line 1444 "syntax_analyzer.tab.c"
    break;

  case 14: /* ConstDef: Ident ASSIGN ConstInitVal  */
#line 83 "syntax_analyzer.y"
                            {(yyval.node) = node("ConstDef", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1450 "syntax_analyzer.tab.c"
    break;

  case 15: /* ConstDef: Ident ConstExps ASSIGN ConstInitVal  */
#line 84 "syntax_analyzer.y"
                                      {(yyval.node) = node("ConstDef", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1456 "syntax_analyzer.tab.c"
    break;

  case 16: /* ConstExps: LBRACKET ConstExp RBRACKET  */
#line 87 "syntax_analyzer.y"
                             {(yyval.node) = node("ConstExps", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1462 "syntax_analyzer.tab.c"
    break;

  case 17: /* ConstExps: LBRACKET ConstExp RBRACKET ConstExps  */
#line 88 "syntax_analyzer.y"
                                       {(yyval.node) = node("ConstExps", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1468 "syntax_analyzer.tab.c"
    break;

  case 18: /* ConstInitVal: ConstExp  */
#line 91 "syntax_analyzer.y"
           {(yyval.node) = node("ConstInitVal", 1, (yyvsp[0].node));}
#line 1474 "syntax_analyzer.tab.c"
    break;

  case 19: /* ConstInitVal: LSPLINT RSPLINT  */
#line 92 "syntax_analyzer.y"
                  {(yyval.node) = node("ConstInitVal", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1480 "syntax_analyzer.tab.c"
    break;

  case 20: /* ConstInitVal: LSPLINT ConstInitVals RSPLINT  */
#line 93 "syntax_analyzer.y"
                                {(yyval.node) = node("ConstInitVal", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1486 "syntax_analyzer.tab.c"
    break;

  case 21: /* ConstInitVals: ConstInitVal  */
#line 96 "syntax_analyzer.y"
               {(yyval.node) = node("ConstInitVals", 1, (yyvsp[0].node));}
#line 1492 "syntax_analyzer.tab.c"
    break;

  case 22: /* ConstInitVals: ConstInitVals COMMA ConstInitVal  */
#line 97 "syntax_analyzer.y"
                                   {(yyval.node) = node("ConstInitVals", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1498 "syntax_analyzer.tab.c"
    break;

  case 23: /* VarDecl: BType VarDefs SEMICOLON  */
#line 100 "syntax_analyzer.y"
                          {(yyval.node) = node("VarDecl", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1504 "syntax_analyzer.tab.c"
    break;

  case 24: /* VarDefs: VarDef  */
#line 103 "syntax_analyzer.y"
         {(yyval.node) = node("VarDefs", 1, (yyvsp[0].node));}
#line 1510 "syntax_analyzer.tab.c"
    break;

  case 25: /* VarDefs: VarDefs COMMA VarDef  */
#line 104 "syntax_analyzer.y"
                       {(yyval.node) = node("VarDefs", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1516 "syntax_analyzer.tab.c"
    break;

  case 26: /* VarDef: Ident  */
#line 107 "syntax_analyzer.y"
        {(yyval.node) = node("VarDef", 1, (yyvsp[0].node));}
#line 1522 "syntax_analyzer.tab.c"
    break;

  case 27: /* VarDef: Ident ConstExps  */
#line 108 "syntax_analyzer.y"
                  {(yyval.node) = node("VarDef", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1528 "syntax_analyzer.tab.c"
    break;

  case 28: /* VarDef: Ident ASSIGN InitVal  */
#line 109 "syntax_analyzer.y"
                       {(yyval.node) = node("VarDef", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1534 "syntax_analyzer.tab.c"
    break;

  case 29: /* VarDef: Ident ConstExps ASSIGN InitVal  */
#line 110 "syntax_analyzer.y"
                                 {(yyval.node) = node("VarDef", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1540 "syntax_analyzer.tab.c"
    break;

  case 30: /* InitVal: Exp  */
#line 113 "syntax_analyzer.y"
      {(yyval.node) = node("InitVal", 1, (yyvsp[0].node));}
#line 1546 "syntax_analyzer.tab.c"
    break;

  case 31: /* InitVal: LSPLINT RSPLINT  */
#line 114 "syntax_analyzer.y"
                  {(yyval.node) = node("InitVal", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1552 "syntax_analyzer.tab.c"
    break;

  case 32: /* InitVal: LSPLINT InitVals RSPLINT  */
#line 115 "syntax_analyzer.y"
                           {(yyval.node) = node("InitVal", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1558 "syntax_analyzer.tab.c"
    break;

  case 33: /* InitVals: InitVal  */
#line 118 "syntax_analyzer.y"
          {(yyval.node) = node("InitVals", 1, (yyvsp[0].node));}
#line 1564 "syntax_analyzer.tab.c"
    break;

  case 34: /* InitVals: InitVals COMMA InitVal  */
#line 119 "syntax_analyzer.y"
                         {(yyval.node) = node("InitVals", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1570 "syntax_analyzer.tab.c"
    break;

  case 35: /* FuncDef: BType Ident LPARENTHESE RPARENTHESE Block  */
#line 122 "syntax_analyzer.y"
                                            {(yyval.node) = node("FuncDef", 5, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1576 "syntax_analyzer.tab.c"
    break;

  case 36: /* FuncDef: BType Ident LPARENTHESE FuncFParams RPARENTHESE Block  */
#line 123 "syntax_analyzer.y"
                                                        {(yyval.node) = node("FuncDef", 6, (yyvsp[-5].node), (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1582 "syntax_analyzer.tab.c"
    break;

  case 37: /* FuncFParams: FuncFParam  */
#line 126 "syntax_analyzer.y"
             {(yyval.node) = node("FuncFParams", 1, (yyvsp[0].node));}
#line 1588 "syntax_analyzer.tab.c"
    break;

  case 38: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 127 "syntax_analyzer.y"
                               {(yyval.node) = node("FuncFParams", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1594 "syntax_analyzer.tab.c"
    break;

  case 39: /* FuncFParam: BType Ident  */
#line 130 "syntax_analyzer.y"
              {(yyval.node) = node("FuncFParam", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1600 "syntax_analyzer.tab.c"
    break;

  case 40: /* FuncFParam: BType Ident LBRACKET RBRACKET  */
#line 131 "syntax_analyzer.y"
                                {(yyval.node) = node("FuncFParam", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1606 "syntax_analyzer.tab.c"
    break;

  case 41: /* FuncFParam: BType Ident LBRACKET RBRACKET Exps  */
#line 132 "syntax_analyzer.y"
                                     {(yyval.node) = node("FuncFParam", 5, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1612 "syntax_analyzer.tab.c"
    break;

  case 42: /* Exps: LBRACKET Exp RBRACKET  */
#line 135 "syntax_analyzer.y"
                        {(yyval.node) = node("Exps", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1618 "syntax_analyzer.tab.c"
    break;

  case 43: /* Exps: LBRACKET Exp RBRACKET Exps  */
#line 136 "syntax_analyzer.y"
                             {(yyval.node) = node("Exps", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1624 "syntax_analyzer.tab.c"
    break;

  case 44: /* Block: LSPLINT RSPLINT  */
#line 139 "syntax_analyzer.y"
                  {(yyval.node) = node("Block", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1630 "syntax_analyzer.tab.c"
    break;

  case 45: /* Block: LSPLINT BlockItems RSPLINT  */
#line 140 "syntax_analyzer.y"
                             {(yyval.node) = node("Block", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1636 "syntax_analyzer.tab.c"
    break;

  case 46: /* BlockItems: BlockItem  */
#line 143 "syntax_analyzer.y"
            {(yyval.node) = node("BlockItems", 1, (yyvsp[0].node));}
#line 1642 "syntax_analyzer.tab.c"
    break;

  case 47: /* BlockItems: BlockItem BlockItems  */
#line 144 "syntax_analyzer.y"
                       {(yyval.node) = node("BlockItems", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1648 "syntax_analyzer.tab.c"
    break;

  case 48: /* BlockItem: Decl  */
#line 147 "syntax_analyzer.y"
       {(yyval.node) = node("BlockItem", 1, (yyvsp[0].node));}
#line 1654 "syntax_analyzer.tab.c"
    break;

  case 49: /* BlockItem: Stmt  */
#line 148 "syntax_analyzer.y"
       {(yyval.node) = node("BlockItem", 1, (yyvsp[0].node));}
#line 1660 "syntax_analyzer.tab.c"
    break;

  case 50: /* Stmt: LVal ASSIGN Exp SEMICOLON  */
#line 151 "syntax_analyzer.y"
                            {(yyval.node) = node("Stmt", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1666 "syntax_analyzer.tab.c"
    break;

  case 51: /* Stmt: SEMICOLON  */
#line 152 "syntax_analyzer.y"
            {(yyval.node) = node("Stmt", 1, (yyvsp[0].node));}
#line 1672 "syntax_analyzer.tab.c"
    break;

  case 52: /* Stmt: Exp SEMICOLON  */
#line 153 "syntax_analyzer.y"
                {(yyval.node) = node("Stmt", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1678 "syntax_analyzer.tab.c"
    break;

  case 53: /* Stmt: Block  */
#line 154 "syntax_analyzer.y"
        {(yyval.node) = node("Stmt", 1, (yyvsp[0].node));}
#line 1684 "syntax_analyzer.tab.c"
    break;

  case 54: /* Stmt: IF LPARENTHESE Cond RPARENTHESE Stmt  */
#line 155 "syntax_analyzer.y"
                                       {(yyval.node) = node("Stmt", 5, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1690 "syntax_analyzer.tab.c"
    break;

  case 55: /* Stmt: IF LPARENTHESE Cond RPARENTHESE Stmt ELSE Stmt  */
#line 156 "syntax_analyzer.y"
                                                 {(yyval.node) = node("Stmt", 7, (yyvsp[-6].node), (yyvsp[-5].node), (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1696 "syntax_analyzer.tab.c"
    break;

  case 56: /* Stmt: WHILE LPARENTHESE Cond RPARENTHESE Stmt  */
#line 157 "syntax_analyzer.y"
                                          {(yyval.node) = node("Stmt", 5, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1702 "syntax_analyzer.tab.c"
    break;

  case 57: /* Stmt: BREAK SEMICOLON  */
#line 158 "syntax_analyzer.y"
                  {(yyval.node) = node("Stmt", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1708 "syntax_analyzer.tab.c"
    break;

  case 58: /* Stmt: CONTINUE SEMICOLON  */
#line 159 "syntax_analyzer.y"
                     {(yyval.node) = node("Stmt", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1714 "syntax_analyzer.tab.c"
    break;

  case 59: /* Stmt: RETURN SEMICOLON  */
#line 160 "syntax_analyzer.y"
                   {(yyval.node) = node("Stmt", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1720 "syntax_analyzer.tab.c"
    break;

  case 60: /* Stmt: RETURN Exp SEMICOLON  */
#line 161 "syntax_analyzer.y"
                       {(yyval.node) = node("Stmt", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1726 "syntax_analyzer.tab.c"
    break;

  case 61: /* Exp: AddExp  */
#line 164 "syntax_analyzer.y"
         {(yyval.node) = node("Exp", 1, (yyvsp[0].node));}
#line 1732 "syntax_analyzer.tab.c"
    break;

  case 62: /* Cond: LOrExp  */
#line 167 "syntax_analyzer.y"
         {(yyval.node) = node("Cond", 1, (yyvsp[0].node));}
#line 1738 "syntax_analyzer.tab.c"
    break;

  case 63: /* LVal: Ident  */
#line 170 "syntax_analyzer.y"
        {(yyval.node) = node("LVal", 1, (yyvsp[0].node));}
#line 1744 "syntax_analyzer.tab.c"
    break;

  case 64: /* LVal: Ident Exps  */
#line 171 "syntax_analyzer.y"
             {(yyval.node) = node("LVal", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1750 "syntax_analyzer.tab.c"
    break;

  case 65: /* PrimaryExp: LPARENTHESE Exp RPARENTHESE  */
#line 174 "syntax_analyzer.y"
                              {(yyval.node) = node("PrimaryExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1756 "syntax_analyzer.tab.c"
    break;

  case 66: /* PrimaryExp: LVal  */
#line 175 "syntax_analyzer.y"
       {(yyval.node) = node("PrimaryExp", 1, (yyvsp[0].node));}
#line 1762 "syntax_analyzer.tab.c"
    break;

  case 67: /* PrimaryExp: Number  */
#line 176 "syntax_analyzer.y"
         {(yyval.node) = node("PrimaryExp", 1, (yyvsp[0].node));}
#line 1768 "syntax_analyzer.tab.c"
    break;

  case 68: /* Number: IntConst  */
#line 179 "syntax_analyzer.y"
           {(yyval.node) = node("Number", 1, (yyvsp[0].node));}
#line 1774 "syntax_analyzer.tab.c"
    break;

  case 69: /* Number: floatConst  */
#line 180 "syntax_analyzer.y"
             {(yyval.node) = node("Number", 1, (yyvsp[0].node));}
#line 1780 "syntax_analyzer.tab.c"
    break;

  case 70: /* UnaryExp: PrimaryExp  */
#line 183 "syntax_analyzer.y"
             {(yyval.node) = node("UnaryExp", 1, (yyvsp[0].node));}
#line 1786 "syntax_analyzer.tab.c"
    break;

  case 71: /* UnaryExp: Ident LPARENTHESE RPARENTHESE  */
#line 184 "syntax_analyzer.y"
                                {(yyval.node) = node("UnaryExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1792 "syntax_analyzer.tab.c"
    break;

  case 72: /* UnaryExp: Ident LPARENTHESE FuncRParams RPARENTHESE  */
#line 185 "syntax_analyzer.y"
                                            {(yyval.node) = node("UnaryExp", 4, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1798 "syntax_analyzer.tab.c"
    break;

  case 73: /* UnaryExp: UnaryOp UnaryExp  */
#line 186 "syntax_analyzer.y"
                   {(yyval.node) = node("UnaryExp", 2, (yyvsp[-1].node), (yyvsp[0].node));}
#line 1804 "syntax_analyzer.tab.c"
    break;

  case 74: /* UnaryOp: ADD  */
#line 189 "syntax_analyzer.y"
      {(yyval.node) = node("UnaryOp", 1, (yyvsp[0].node));}
#line 1810 "syntax_analyzer.tab.c"
    break;

  case 75: /* UnaryOp: SUB  */
#line 190 "syntax_analyzer.y"
      {(yyval.node) = node("UnaryOp", 1, (yyvsp[0].node));}
#line 1816 "syntax_analyzer.tab.c"
    break;

  case 76: /* UnaryOp: NOT  */
#line 191 "syntax_analyzer.y"
      {(yyval.node) = node("UnaryOp", 1, (yyvsp[0].node));}
#line 1822 "syntax_analyzer.tab.c"
    break;

  case 77: /* FuncRParams: Exp  */
#line 194 "syntax_analyzer.y"
      {(yyval.node) = node("FuncRParams", 1, (yyvsp[0].node));}
#line 1828 "syntax_analyzer.tab.c"
    break;

  case 78: /* FuncRParams: FuncRParams COMMA Exp  */
#line 195 "syntax_analyzer.y"
                        {(yyval.node) = node("FuncRParams", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1834 "syntax_analyzer.tab.c"
    break;

  case 79: /* MulExp: UnaryExp  */
#line 198 "syntax_analyzer.y"
           {(yyval.node) = node("MulExp", 1, (yyvsp[0].node));}
#line 1840 "syntax_analyzer.tab.c"
    break;

  case 80: /* MulExp: MulExp MUL UnaryExp  */
#line 199 "syntax_analyzer.y"
                      {(yyval.node) = node("MulExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1846 "syntax_analyzer.tab.c"
    break;

  case 81: /* MulExp: MulExp DIV UnaryExp  */
#line 200 "syntax_analyzer.y"
                      {(yyval.node) = node("MulExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1852 "syntax_analyzer.tab.c"
    break;

  case 82: /* MulExp: MulExp MOD UnaryExp  */
#line 201 "syntax_analyzer.y"
                      {(yyval.node) = node("MulExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1858 "syntax_analyzer.tab.c"
    break;

  case 83: /* AddExp: MulExp  */
#line 204 "syntax_analyzer.y"
         {(yyval.node) = node("AddExp", 1, (yyvsp[0].node));}
#line 1864 "syntax_analyzer.tab.c"
    break;

  case 84: /* AddExp: AddExp ADD MulExp  */
#line 205 "syntax_analyzer.y"
                    {(yyval.node) = node("AddExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1870 "syntax_analyzer.tab.c"
    break;

  case 85: /* AddExp: AddExp SUB MulExp  */
#line 206 "syntax_analyzer.y"
                    {(yyval.node) = node("AddExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1876 "syntax_analyzer.tab.c"
    break;

  case 86: /* RelExp: AddExp  */
#line 209 "syntax_analyzer.y"
          {(yyval.node) = node("RelExp", 1, (yyvsp[0].node));}
#line 1882 "syntax_analyzer.tab.c"
    break;

  case 87: /* RelExp: RelExp LT AddExp  */
#line 210 "syntax_analyzer.y"
                   {(yyval.node) = node("RelExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1888 "syntax_analyzer.tab.c"
    break;

  case 88: /* RelExp: RelExp LTE AddExp  */
#line 211 "syntax_analyzer.y"
                    {(yyval.node) = node("RelExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1894 "syntax_analyzer.tab.c"
    break;

  case 89: /* RelExp: RelExp GT AddExp  */
#line 212 "syntax_analyzer.y"
                   {(yyval.node) = node("RelExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1900 "syntax_analyzer.tab.c"
    break;

  case 90: /* RelExp: RelExp GTE AddExp  */
#line 213 "syntax_analyzer.y"
                    {(yyval.node) = node("RelExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1906 "syntax_analyzer.tab.c"
    break;

  case 91: /* EqExp: RelExp  */
#line 216 "syntax_analyzer.y"
          {(yyval.node) = node("EqExp", 1, (yyvsp[0].node));}
#line 1912 "syntax_analyzer.tab.c"
    break;

  case 92: /* EqExp: EqExp EQ RelExp  */
#line 217 "syntax_analyzer.y"
                   {(yyval.node) = node("EqExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1918 "syntax_analyzer.tab.c"
    break;

  case 93: /* EqExp: EqExp NEQ RelExp  */
#line 218 "syntax_analyzer.y"
                    {(yyval.node) = node("EqExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1924 "syntax_analyzer.tab.c"
    break;

  case 94: /* LAndExp: EqExp  */
#line 221 "syntax_analyzer.y"
        {(yyval.node) = node("LAndExp", 1, (yyvsp[0].node));}
#line 1930 "syntax_analyzer.tab.c"
    break;

  case 95: /* LAndExp: LAndExp AND EqExp  */
#line 222 "syntax_analyzer.y"
                     {(yyval.node) = node("LAndExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1936 "syntax_analyzer.tab.c"
    break;

  case 96: /* LOrExp: LAndExp  */
#line 225 "syntax_analyzer.y"
          {(yyval.node) = node("LOrExp", 1, (yyvsp[0].node));}
#line 1942 "syntax_analyzer.tab.c"
    break;

  case 97: /* LOrExp: LOrExp OR LAndExp  */
#line 226 "syntax_analyzer.y"
                     {(yyval.node) = node("LOrExp", 3, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node));}
#line 1948 "syntax_analyzer.tab.c"
    break;

  case 98: /* ConstExp: AddExp  */
#line 229 "syntax_analyzer.y"
         {(yyval.node) = node("ConstExp", 1, (yyvsp[0].node));}
#line 1954 "syntax_analyzer.tab.c"
    break;


#line 1958 "syntax_analyzer.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 232 "syntax_analyzer.y"


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
