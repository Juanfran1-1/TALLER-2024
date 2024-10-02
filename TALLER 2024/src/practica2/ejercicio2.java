
package practica2;
import PaqueteLectura.*;
public class ejercicio2 {
    public static void main ( String [] args){
        GeneradorAleatorio.iniciar();
        Persona [] vector = new Persona[15];
        int dl = 0; 
        int edad = GeneradorAleatorio.generarInt(99);
        while ((edad != 0) && (dl < 15)){
            String nombre = GeneradorAleatorio.generarString(10);
            int DNI = GeneradorAleatorio.generarInt(1000);
            vector[dl] = new Persona(nombre,DNI,edad);
            dl++;
            edad = GeneradorAleatorio.generarInt(99);
        }
        
        Persona personaMinima = new Persona(); //lo declaro afuera porque no lo uso en el FOR
        int cantidad = 0;
        int minimo = 10001;
        
        for(int i = 0; i < dl;i++){
            System.out.println((i+1) + "----" + vector[i].toString());
            if(vector[i].getEdad() > 65)
                cantidad++;
            if (vector[i].getDNI()<minimo) {
                minimo = vector[i].getDNI();
                personaMinima = vector[i];
            }
        }
        
        System.out.println("Hay " + cantidad + " personas mayores a 65 anios.");
        System.out.println(personaMinima.toString());     
    }
}
