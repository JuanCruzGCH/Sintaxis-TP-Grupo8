# Sintaxis-TP-Grupo8
COMANDOS PARA LA EJECUCION:<br>
bison -d Parser.y<br>
flex Scanner.l <br>
gcc Parser.tab.c lex.yy.c -o parser -lfl<br>
./parser < programaComando.txt
