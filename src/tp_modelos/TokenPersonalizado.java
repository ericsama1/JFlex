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
    "integer","Float","if","else","do","for"};
 
  public String getLexema(){
    return this._lexema;
  }
 
  public String getToken(){
    return this._token;
  }
  
  TokenPersonalizado (String lexema, String token){
    this._lexema = lexema;
    //pregunto si el string q leo es una palabra clave
    if (token == "ID" && Arrays.asList(palabras_claves).contains(lexema)){
        this._token = "Palabra_Clave";
    }
    else{
        this._token = token;
    }
  }
 
  public String toString(){
    return "Lexema: " + this._lexema + " Token: " + this._token + ";";
  }
}
