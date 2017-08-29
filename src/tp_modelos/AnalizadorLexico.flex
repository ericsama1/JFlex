package tp_modelos;
import static tp_modelos.TokenPersonalizado.*;
/* Sección de declaraciones de JFlex */
%%
%public
%class AnalizadorLexico
%{
 /* Código personalizado */
 
 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;
 
 public boolean existenTokens(){
 return this._existenTokens;
 }
 
%}
 
 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type TokenPersonalizado
 
%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
 
%eof{
 
 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;
 
%eof}
 
/* Inicio de Expresiones regulares */
 
 Digito = [0-9]
 Numero = {Digito} {Digito}*
 Entero = "-"?{Numero}
 Real = {Entero} "." {Numero}
 Letra = [A-Za-z]
 Asignar = ":"
 Comparar = "=="
 FinLinea = ";"
 Coma = ","
 Simbolo = "*"|"+"|"-"|"/"|"#"|"("|")"|"{"|"}"|"\""|"<"|"<="|">"|">="|"!"|"!="
 /*Parentesis = "(" {Digito}*{ID}* ")"
 Llaves = "{" {LoD|SaltoDeLinea}* "}"*/
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 //aca comento las variables
 LoD = {Letra}|{Digito}
 ID = {Letra}{LoD}* 
/* Finaliza expresiones regulares */
 
%%
/* Finaliza la sección de declaraciones de JFlex */
 
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}
 
{ID} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "ID");
 this._existenTokens = true;
 return t;
} 

{Asignar} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Asignar");
 this._existenTokens = true;
 return t;
}
  
{Comparar} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Comparar");
 this._existenTokens = true;
 return t;
}

{Coma} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Coma");
 this._existenTokens = true;
 return t;
}
 
{FinLinea} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "FinLinea");
 this._existenTokens = true;
 return t;
}
 
{Entero} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Entero");
 this._existenTokens = true;
 return t;
}

{Real} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Real");
 this._existenTokens = true;
 return t;
}
 
{Simbolo} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SIMBOLO");
 this._existenTokens = true;
 return t;
}
 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}
 
{SaltoDeLinea} {
 TokenPersonalizado t = new TokenPersonalizado("Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;
}

/*{Parentesis} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SIMBOLO");
 this._existenTokens = true;
 return t;
}

{Llaves} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SIMBOLO");
 this._existenTokens = true;
 return t;
}*/