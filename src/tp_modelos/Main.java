/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp_modelos;

import java.io.File;

/**
 *
 * @author Eric
 */
public class Main {
    public static void main(String[] args) {
        // TODO code application logic here
        String path = System.getProperty("user.dir")+"/src/tp_modelos/AnalizadorLexico.flex";
        generarLexer(path);    
    }
    public static void generarLexer(String path){
        File file= new File(path);
        jflex.Main.generate(file);
    }
}
