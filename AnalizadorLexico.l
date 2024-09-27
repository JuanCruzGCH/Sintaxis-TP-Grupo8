%{
#include <stdio.h>
#include <stdlib.h>

//Es lo que usa flex para leer archivos 
extern FILE *yyin;

void reporteDeErrorLexico(const char *s);
%}

%%
"programaPrincipal"     printf("PALABRA RESERVADA: programaPrincipal\n");
"unInt"                 printf("PALABRA RESERVADA: unInt\n");
"unChar"                printf("PALABRA RESERVADA: unChar\n");
"haceEsto"              printf("PALABRA RESERVADA: haceEsto\n");
"gracias"               printf("PALABRA RESERVADA: gracias\n");
"si"                    printf("PALABRA RESERVADA: si\n");
"flujoNormal"           printf("PALABRA RESERVADA: flujoNormal\n");
"finFlujoPrincipal"     printf("PALABRA RESERVADA: finFlujoPrincipal\n");
"flujoAlternativo"      printf("PALABRA RESERVADA: flujoAlternativo\n");
"finFlujoAlternativo"   printf("PALABRA RESERVADA: finFlujoAlternativo\n");
"mientrasQue"           printf("PALABRA RESERVADA: mientrasQue\n");
"bucle"                 printf("PALABRA RESERVADA: bucle\n");
"finBucle"              printf("PALABRA RESERVADA: finBucle\n");
"Porfavor"              printf("PALABRA RESERVADA: Porfavor\n");
"Gracias"               printf("PALABRA RESERVADA: Gracias\n");
"ok"                    printf("PALABRA RESERVADA: ok\n");
"escribir"              printf("PALABRA RESERVADA: escribir\n");

[0-9]                   printf("DIGITO: %s\n", yytext);

[0-9]+                  printf("CONSTANTE DECIMAL: %s\n", yytext);
O[0-7]+                 printf("CONSTANTE OCTAL: %s\n", yytext);
0[xX][0-9a-fA-F]+       printf("CONSTANTE HEXADECIMAL: %s\n", yytext);

[ \n]+                  // Espacios y saltos de línea (los ignoramos)

[a-zA-Z]               printf("CARACTER: %s\n", yytext);
[.,:;_{}[\]"'()¿?¡!\\] printf("CARACTER DE PUNTUACION: %s\n", yytext); // Para el caracter ']' tengo que escribirlo \] o anda mal, esto se repite en el resto del código pero no vale la pena comentarlo otra vez

[a-zA-Z][a-zA-Z0-9_]{0,13}!! printf("IDENTIFICADOR: %s\n", yytext); // Empieza con un caracter, luego pueden seguir de 0 a 13 simbolos (16 - 3), luego !!

==                     printf("OPERADOR: ==\n");
\+=                    printf("OPERADOR: +=\n");
-=                     printf("OPERADOR: -=\n");
\*=                    printf("OPERADOR: *=\n");
\++                    printf("OPERADOR: ++\n");
and                    printf("OPERADOR: and\n");
or                     printf("OPERADOR: or\n");
[+\-*\/^=<>]           printf("OPERADOR: %s\n", yytext);

[@#$%&\|¬°]            printf("OTROS: %s\n", yytext);

\"([a-zA-Z0-9_.:;{}[\]"'()¿?¡!\\[+\-*\/^=<>@#$%&\|¬° ]*)\"  printf("LITERAL CADENA: %s\n", yytext);

.                      reporteDeErrorLexico("TOKEN NO RECONOCIDO"); //El punto es el comodin
%%

void reporteDeErrorLexico(const char* msg)
{
    //Envia un mensaje de error en la pantalla
    fprintf(stderr, "Error léxico: %s\n", msg);
}

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