
package practica4;
import PaqueteLectura.*;
public class ejercicio1 {
    public static void main ( String [] args){
        Circulo circulo1;
        Triangulo triangulo1;
        
        circulo1 = new Circulo(Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        triangulo1 = new Triangulo(Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        
        System.out.println(circulo1.toString());
        System.out.println(triangulo1.toString());
        
        triangulo1.Despintar();
        System.out.println(triangulo1.getColorLinea());
        System.out.println(triangulo1.getColorRelleno());
        System.out.println(triangulo1.toString());
    }
}
