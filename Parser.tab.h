/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
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
    PROGRAMAPRINCIPAL = 258,       /* PROGRAMAPRINCIPAL  */
    PORFAVOR = 259,                /* PORFAVOR  */
    IDENTIFICADOR = 260,           /* IDENTIFICADOR  */
    CONSTANTE = 261,               /* CONSTANTE  */
    LITERALCADENA = 262,           /* LITERALCADENA  */
    OP_RELACIONAL = 263,           /* OP_RELACIONAL  */
    OP_ADITIVO = 264,              /* OP_ADITIVO  */
    OP_MULTI = 265,                /* OP_MULTI  */
    OP_UNARIO = 266,               /* OP_UNARIO  */
    AND = 267,                     /* AND  */
    OR = 268,                      /* OR  */
    EQ = 269,                      /* EQ  */
    NEQ = 270,                     /* NEQ  */
    GT = 271,                      /* GT  */
    LT = 272,                      /* LT  */
    GE = 273,                      /* GE  */
    LE = 274,                      /* LE  */
    ASIGNACION = 275,              /* ASIGNACION  */
    PLUS = 276,                    /* PLUS  */
    MINUS = 277,                   /* MINUS  */
    NOT = 278,                     /* NOT  */
    INCREMENT = 279,               /* INCREMENT  */
    DECREMENT = 280,               /* DECREMENT  */
    LPAREN = 281,                  /* LPAREN  */
    RPAREN = 282,                  /* RPAREN  */
    LBRACKET = 283,                /* LBRACKET  */
    RBRACKET = 284,                /* RBRACKET  */
    LCORCH = 285,                  /* LCORCH  */
    RCORCH = 286,                  /* RCORCH  */
    COMA = 287,                    /* COMA  */
    UNINT = 288,                   /* UNINT  */
    UNCHAR = 289,                  /* UNCHAR  */
    SI = 290,                      /* SI  */
    FINFLUJONORMAL = 291,          /* FINFLUJONORMAL  */
    FLUJONORMAL = 292,             /* FLUJONORMAL  */
    FINFLUJOALTERNATIVO = 293,     /* FINFLUJOALTERNATIVO  */
    FLUJOALTERNATIVO = 294,        /* FLUJOALTERNATIVO  */
    MIENTRASQUE = 295,             /* MIENTRASQUE  */
    BUCLE = 296,                   /* BUCLE  */
    FINBUCLE = 297,                /* FINBUCLE  */
    LEER = 298,                    /* LEER  */
    ESCRIBIR = 299,                /* ESCRIBIR  */
    OK = 300,                      /* OK  */
    GRACIAS = 301,                 /* GRACIAS  */
    HACEESTO = 302                 /* HACEESTO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
