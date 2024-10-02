/*- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.*/
package practica2;
import PaqueteLectura.*;
public class ejercicio4 {
    public static void main(String [] args){
        int dfdias=5;
        int dft=8;
        int maxcupo=40;
        int dniact,edadact,i;
        int cupo=0;
        int t=0;
        int d=0;
        int [] vector= new int [5];
        Persona [][] tabla = new Persona [dfdias][dft];
        
        for (i=0;i<dfdias;i++)
            vector[i]=0;
        
        
        GeneradorAleatorio.iniciar();
        String nom= GeneradorAleatorio.generarString(8);
        System.out.println("INGRESE DIA PEDIDO: (ENTRE 1 Y 5) ");
        int diap =Lector.leerInt();
        diap=diap-1;
        while (!nom.equals("ZZZ") && (cupo < maxcupo)){
            if (vector[diap] == 8){
               System.out.println(" DIA COMPLETO ");
            }
            else {
                tabla [diap][vector[diap]] = new Persona(nom,dniact=GeneradorAleatorio.generarInt(4040404),edadact=GeneradorAleatorio.generarInt(100));
                vector[diap]++;
                cupo++;
                System.out.println("INGRESADO");
                
                }
            nom= GeneradorAleatorio.generarString(8);
            diap=GeneradorAleatorio.generarInt(5);
        }
             
            
        for (d=0;d<dfdias;d++){
            System.out.println("Dia: "+(d+1));
            System.out.println();
            for (t=0;t<dft;t++){
                System.out.print(" Entrevista numero "+ (t+1) + " : " + " ");
                System.out.println(tabla[d][t].toString());
            }
            System.out.println();
        }
    }
}

