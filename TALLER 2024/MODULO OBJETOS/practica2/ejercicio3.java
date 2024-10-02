/*3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals. */
package practica2;
import PaqueteLectura.*;
public class ejercicio3 {
    public static void main(String [] args){
        int dfdias=5;
        int dft=8;
        int maxcupo=40;
        int dniact,edadact;
        int cupo=0;
        int t=0;
        Persona [][] tabla = new Persona [dfdias][dft];
        
        GeneradorAleatorio.iniciar();
        String nom= GeneradorAleatorio.generarString(3);
        int d=0;
        while (!(nom.equals("ZZZ")) && (cupo < maxcupo) && (d<dfdias)){
            t=0;
            while ((t < dft) && (cupo < maxcupo) && !(nom.equals("ZZZ"))){
                Persona p = new Persona(nom,dniact=GeneradorAleatorio.generarInt(4040404),edadact=GeneradorAleatorio.generarInt(100));
                tabla [d][t]= p;
                t++;
                cupo++;
                nom= GeneradorAleatorio.generarString(3);
            }
            d++;  
        }
        for (d=0;d<dfdias;d++){
            System.out.println("Dia: "+( d+1));
            System.out.println();
            for (t=0;t<dft;t++){
                System.out.print(" Entrevista numero "+ (t+1) + " : " + " ");
                System.out.println(tabla[d][t].toString());
            }
            System.out.println();
        }
    }
}
