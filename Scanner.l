%{
#include <stdio.h>
#include <stdlib.h>
#include "Parser.tab.h"

//Es lo que usa flex para leer archivos 
extern FILE *yyin;

void reporteDeErrorLexico(const char *s);
%}

%%

"programaPrincipal"     { printf("PALABRA RESERVADA: PROGRAMAPRINCIPAL\n"); return PROGRAMAPRINCIPAL; }
"unInt"                 { printf("PALABRA RESERVADA: UNINT\n"); return UNINT; }
"unChar"                { printf("PALABRA RESERVADA: UNCHAR\n"); return UNCHAR; }
"haceEsto"              { printf("PALABRA RESERVADA: HACEESTO\n"); return HACEESTO; }
"gracias"               {printf("PALABRA RESERVADA: gracias\n"); return GRACIAS;}
"si"                    { printf("PALABRA RESERVADA: SI\n"); return SI; }
"flujoNormal"           { printf("PALABRA RESERVADA: FLUJONORMAL\n"); return FLUJONORMAL; }
"finFlujoNormal"        { printf("PALABRA RESERVADA: FINFLUJONORMAL\n"); return FINFLUJONORMAL; }
"flujoAlternativo"      { printf("PALABRA RESERVADA: FLUJOALTERNATIVO\n"); return FLUJOALTERNATIVO; }
"finFlujoAlternativo"   { printf("PALABRA RESERVADA: FINFLUJOALTERNATIVO\n"); return FINFLUJOALTERNATIVO; }
"mientrasQue"           { printf("PALABRA RESERVADA: MIENTRASQUE\n"); return MIENTRASQUE; }
"bucle"                 { printf("PALABRA RESERVADA: BUCLE\n"); return BUCLE; }
"finBucle"              { printf("PALABRA RESERVADA: FINBUCLE\n"); return FINBUCLE; }
"Porfavor"              { printf("PALABRA RESERVADA: PORFAVOR\n"); return PORFAVOR; }
"Gracias"               { printf("PALABRA RESERVADA: GRACIAS\n"); return GRACIAS; }
"ok"                    { printf("PALABRA RESERVADA: OK\n"); return OK; }
"escribir"              { printf("PALABRA RESERVADA: ESCRIBIR\n"); return ESCRIBIR; }

[0-9]                   { printf("DIGITO: %s\n", yytext); return CONSTANTE; }
[0-9]+                  { printf("CONSTANTE DECIMAL: %s\n", yytext); return CONSTANTE; }
O[0-7]+                 { printf("CONSTANTE OCTAL: %s\n", yytext); return CONSTANTE; }
0[xX][0-9a-fA-F]+       { printf("CONSTANTE HEXADECIMAL: %s\n", yytext); return CONSTANTE; }

[ \n]+                  ; // Espacios y saltos de línea (los ignoramos)

[a-zA-Z]                  { printf("CARACTER: %s\n", yytext); return IDENTIFICADOR; }
[.:;_{}"'¿?¡!\\]         { printf("CARACTER DE PUNTUACION: %s\n", yytext); return yytext[0]; }
"("                       { printf("CARACTER: (\n"); return LPAREN; }
")"                       { printf("CARACTER: )\n"); return RPAREN; }
"["                       { printf("CARACTER: [\n"); return RCORCH; }
"]"                       { printf("CARACTER: ]\n"); return LCORCH; }
","                       {printf("CARACTER: ,\n"); return COMA; }

[a-zA-Z][a-zA-Z0-9_]{0,13}!! { printf("IDENTIFICADOR: %s\n", yytext); return IDENTIFICADOR; }

"=="                    { printf("OPERADOR: ==\n"); return EQ; }
"++"                    { printf("OPERADOR: ++\n"); return INCREMENT; }
"--"                    { printf("OPERADOR: --\n"); return DECREMENT; }
"="                     { printf("OPERADOR: ASIGNACION\n"); return ASIGNACION; }
"<"                     { printf("OPERADOR: <\n"); return LT; }
">"                     { printf("OPERADOR: >\n"); return GT; }
"+"                     { printf("OPERADOR: +\n"); return PLUS; }
"-"                     { printf("OPERADOR: -\n"); return MINUS; }
\*=                     { printf("OPERADOR: *=\n"); return OP_MULTI; }
and                     { printf("OPERADOR: AND\n"); return AND; }
or                      { printf("OPERADOR: OR\n"); return OR; }

[@#$%&\|¬°]            { printf("OTROS: %s\n", yytext); return yytext[0]; }

\"([a-zA-Z0-9_.:;{}[\]"'()¿?¡!\\[+\-*\/^=<>@#$%&\|¬° ]*)\"  { printf("LITERAL CADENA: %s\n", yytext); return LITERALCADENA; }

.                      { printf("TOKEN NO RECONOCIDO: %s\n", yytext); return 0; }

%%

void reporteDeErrorLexico(const char* msg)
{
    //Envia un mensaje de error en la pantalla
    fprintf(stderr, "Error léxico: %s\n", msg);
}
/*
int main(int argc, char *argv[]) 
{
    //Si se paso un archivo como parametro se lo intenta abrir (si argc > 1 es que se le intento pasar el archivo)
    if (argc > 1) 
    {
        //Abrimos el archivo para escritura, el cual seria el segundo parametro de: ./scranner archivo
        FILE *archivo = fopen(argv[1], "r");

        //En caso de que no sea valido, finaliza el programa para volver a intentarlo
        if(!archivo)
        {
            fprintf(stderr, "No se pudo abrir el archivo");
            return 1;
        }
        yyin = archivo;
    }

    //Analisis lexico de flex
    yylex();

    if (argc > 1)
    {
        fclose(yyin);
    }

    return 0;
}
*/