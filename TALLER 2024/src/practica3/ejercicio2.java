
package practica3;
import PaqueteLectura.Lector;
public class ejercicio2 {
    public static void main(String [] args){
        String nomau,oriau,bioau;
        Libro l = new Libro();
        System.out.println("---ARMAR LIBRO---");
        System.out.print("Ingrese TITULO: ");l.setTitulo(Lector.leerString());
        System.out.print("Ingrese EDITORIAL: ");l.setEditorial(Lector.leerString());
        System.out.print("Ingrese NOMBRE DEL AUTOR: ");nomau=(Lector.leerString());
        System.out.print("Ingrese ORIGEN DEL AUTOR: ");oriau=(Lector.leerString());
        System.out.print("Ingrese ISBN DEL LIBRO : ");l.setISBN(Lector.leerString());
        System.out.print("Ingrese PRECIO DEL LIBRO: ");l.setPrecio(Lector.leerDouble());
        System.out.print("Ingrese BIOGRAFIA DEL AUTOR: ");bioau=(Lector.leerString());
        System.out.print("Ingrese AÑO DE EDICION: ");l.setAñoEdicion(Lector.leerInt());
        l.setPrimerAutor(new Autor(nomau,oriau,bioau));
        System.out.println(l.toString());
    }
}
