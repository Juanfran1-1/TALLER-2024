
package practica1;
import PaqueteLectura.Lector;
public class ejercicio2 {
    public static void main (String[] args) {
        int df = 15;
        int [] equipo = new int [df];
        int i;
        double suma=0;
        int cant =0;
        for (i=0;i<df;i++){
            System.out.print("INGRESE ALTURA DE JUGADOR " + (i+1) + " : ");
            int altura = Lector.leerInt();
            System.out.println("  ");
            suma = suma + altura;
            equipo[i] = altura;
        }
        for (i=0;i<df;i++) 
            System.out.println("LA ALTURA DE JUGADOR " + (i+1) + " ES DE : " + equipo[i]);
        double promedio=(suma/df);
        System.out.println(" EL PROMEDIO DE ALTURA " + promedio);
        for (i=0;i<df;i++)
            if (equipo[i] > promedio)
                cant = cant + 1;
        System.out.println(" LA CANTIDAD DE JUGADORE QUE SUPERA EL PROMEDIO DE ALTURA SON " + cant );
                
        
}
}