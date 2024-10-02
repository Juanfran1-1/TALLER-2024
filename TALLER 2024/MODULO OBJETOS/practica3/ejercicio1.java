
package practica3;
import PaqueteLectura.*;
public class ejercicio1 {
    public static void main(String [] args){
        double l1,l2,l3;
        String relleno,color;
        System.out.println("---ARMAR TRIANGULO---");
        System.out.print("Ingrese medida de lado 1: ");l1=Lector.leerDouble();
        System.out.print("Ingrese medida de lado 2: ");l2=Lector.leerDouble();
        System.out.print("Ingrese medida de lado 3: ");l3=Lector.leerDouble();
        System.out.print("Ingrese color del relleno: ");relleno=Lector.leerString();
        System.out.print("Ingrese color de las lineas: ");color=Lector.leerString();
        Triangulo t= new Triangulo(l1,l2,l3,relleno,color);
        System.out.println(t.toString());
        System.out.println("EL PERIMETRO DEL TRIANGULO ES: ");
        System.out.println(t.calcularPerimetro());
        System.out.println("EL AREA DEL TRIANGULO ES: ");
        System.out.println(t.calcularArea());
    }
}
