/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package practica3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
        
    public static void main(String[] args) {
        
        Autor autor1 = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
        Autor autor2 = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                  "978-0071809252", 21.72,autor1);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        System.out.println(libro1.getBiografia());
        System.out.println(libro1.getNombre());
        System.out.println(libro1.getOrigen());
        System.out.println(libro2.getBiografia());
        System.out.println(libro2.getNombre());
        System.out.println(libro2.getOrigen());
    }
    
}
