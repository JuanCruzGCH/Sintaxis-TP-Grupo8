%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(const char *s);
%}

%token PROGRAMAPRINCIPAL PORFAVOR IDENTIFICADOR CONSTANTE LITERALCADENA
%token OP_RELACIONAL OP_ADITIVO OP_MULTI OP_UNARIO
%token AND OR EQ NEQ GT LT GE LE ASIGNACION
%token PLUS MINUS NOT INCREMENT DECREMENT
%token LPAREN RPAREN LBRACKET RBRACKET LCORCH RCORCH COMA
%token UNINT UNCHAR
%token SI FINFLUJONORMAL FLUJONORMAL FINFLUJOALTERNATIVO FLUJOALTERNATIVO
%token MIENTRASQUE BUCLE FINBUCLE LEER ESCRIBIR OK GRACIAS HACEESTO

%%

programa:
    principal
    ;

principal:
    encabezamiento cuerpo
    ;

encabezamiento:
    PROGRAMAPRINCIPAL nombrePrograma
    ;

nombrePrograma:
    IDENTIFICADOR
    ;

cuerpo:
    PORFAVOR declaraciones sentencias GRACIAS
    ;

declaraciones:
    declaracion
    | declaraciones declaracion
    ;

sentencias:
    sentencia
    | sentencias sentencia
    ;

expresiones:
    expresion
    | expresion expresiones
    ;

expresion:
    expAsignacion
    ;

expAsignacion:
    expOr
    | IDENTIFICADOR ASIGNACION expOr
    ;

expOr:
    expAnd
    | expOr OR expAnd
    ;

expAnd:
    expIgualdad
    | expAnd AND expIgualdad
    ;

expIgualdad:
    expRelacional
    | expIgualdad EQ expRelacional
    | expIgualdad NEQ expRelacional
    ;

expRelacional:
    expAditiva
    | expRelacional opRelacional expAditiva
    ;

opRelacional:
    GT
    | LT
    | GE
    | LE
    ;

expAditiva:
    expMultiplicativa
    | expAditiva opAditivo expMultiplicativa
    ;

opAditivo:
    PLUS
    | MINUS
    ;

expMultiplicativa:
    expUnaria
    | expMultiplicativa OP_MULTI expUnaria
    ;
/*
expUnaria:
    IDENTIFICADOR INCREMENT
    | IDENTIFICADOR DECREMENT
    | NOT expUnaria
    | LPAREN expresion RPAREN
    | IDENTIFICADOR
    | CONSTANTE
    | LITERALCADENA
    ;
    */

expUnaria:
    expPostFijo
    | expUnaria opUnario
    ;

opUnario:
    INCREMENT
    | DECREMENT
    | NOT
    ;

expPostFijo:
    expPrimaria
    | expPostFijo LCORCH CONSTANTE RCORCH
    ;

expPrimaria:
    LPAREN expresion RPAREN
    | IDENTIFICADOR
    | CONSTANTE
    | LITERALCADENA
    ;

declaracion:
    tipoVariable variasVariables OK
    ;

tipoVariable:
    UNINT
    | UNCHAR
    ;

variasVariables:
    variable
    | variasVariables COMA variable
    ;

variable:
    IDENTIFICADOR valorInicial
    ;

valorInicial:
    ASIGNACION expresion
    | 
    ;

sentencia:
    sentenciaCompuesta
    | sentenciaExpresion
    | sentenciaSeleccion
    | sentenciaIteracion
    | sentenciaEntrada
    | sentenciaSalida
    ;

sentenciaCompuesta:
    HACEESTO sentencias GRACIAS
    ;

sentenciaExpresion:
    OK 
    | expresion OK
    ;

sentenciaSeleccion:
    SI LPAREN expresion RPAREN FLUJONORMAL sentencia FINFLUJONORMAL
    | SI LPAREN expresion RPAREN FLUJONORMAL sentencia FINFLUJONORMAL FLUJOALTERNATIVO sentencia FINFLUJOALTERNATIVO
    ;

sentenciaIteracion:
    MIENTRASQUE LPAREN expresion RPAREN BUCLE sentencias FINBUCLE
    | MIENTRASQUE LPAREN expresion RPAREN BUCLE FINBUCLE
    ;

sentenciaEntrada:
    LEER LPAREN valores RPAREN
    ;

valores:
    IDENTIFICADOR
    | IDENTIFICADOR valores
    ;

sentenciaSalida:
    ESCRIBIR LPAREN expresiones RPAREN
    ;

%%

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}



