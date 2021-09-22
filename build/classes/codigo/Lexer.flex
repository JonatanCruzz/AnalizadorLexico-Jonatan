package codigo; //donde esta incluido el paquete

import static codigo.Tokens.*; //la clase de enumeracion que permite crear los tokens de nuestro analizador lexico

%% //esto incluye todas las declaracionesque vamos a ocupar
%class Lexer
%type Tokens //la enumeracion
L=[a-zA-Z_]+ //contiene letras de A-Z
D=[0-9]+ //esto es para los numeros
espacio=[ ,\t,\r,\n]+ //esto es para evitar los espacios en blancos
%{
    public String lexema; //esta es una clase publica
%}
%%
//a continuacion, estara el espacio donde estaran todas las palabras que querramos usar en nuestro codigo.
int |
if |
else |
while {lexema=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;} //una regla que nos permite analizar los identificadores
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;} //nos regresara error en dado caso de que haya un error
