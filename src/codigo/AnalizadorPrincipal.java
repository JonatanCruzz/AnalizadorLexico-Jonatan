/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author jonat
 */
public class AnalizadorPrincipal {
    public static void main(String[] args) {
        String direccion = "C:/Users/jonat/OneDrive/Documentos/NetBeansProjects/AnalizadorLexico-Jonatan/src/codigo/Lexer.flex";
        generadorLexico(direccion);
    }
    public static void generadorLexico(String direccion){
        File ar = new File(direccion); 
        JFlex.Main.generate(ar);
    }
}
