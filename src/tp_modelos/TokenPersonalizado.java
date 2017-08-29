/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp_modelos;

import java.util.Arrays;

/**
 *
 * @author Eric
 */
public class TokenPersonalizado {
  String _token;
  String _lexema;
  private String[] palabras_claves = {"DECVAR","ENDDEC",
    "integer","Float","if","else","do","for","while","write","not"};
 
  public String getLexema(){
    return this._lexema;
  }
 
  public String getToken(){
    return this._token;
  }
  
  TokenPersonalizado (String lexema, String token){
    if (token == "SIMBOLO" || token == "ID"){
        switch (token){
            case ("SIMBOLO"):{
                simbolo(lexema);
                break;
            }
            case ("ID"):{
                if (Arrays.asList(palabras_claves).contains(lexema)){
                    this._token = "Palabra_Clave";
                }else this._token = token;
                break;
            }
            
        }
    }else this._token = token;
    this._lexema = lexema;
  }
 
  public String toString(){
    return "Lexema: " + this._lexema + " Token: " + this._token + ";";
  }
  
  public void simbolo(String lexema){
        switch (lexema) {
            case "+": {this._token= "PLUS"; break;}
            case "-": {this._token = "MINUS"; break;}
            case "*": {this._token = "MULTI"; break;}
            case "/": {this._token = "DIV"; break;}
            case "#": {this._token = "COMMENT"; break;}
            case ">": {this._token= "MAYOR"; break;}
            case ">=": {this._token= "MAYORIGUAL"; break;}
            case "<": {this._token= "MENOR"; break;}
            case "<=": {this._token= "MENORIGUAL"; break;}
            case "\"": {this._token= "COMILLAS"; break;}
            case "!=": {this._token= "DISTINTO"; break;}
            case "=": {this._token= "IGUAL"; break;}
            case "&&": {this._token= "AND"; break;}
            case "||": {this._token= "OR"; break;}
            
        }
  }
  
}
