
package practica1;
import PaqueteLectura.Lector;
public class ejercicio5 {
    public static void main (String [] args) {
        int [][] matriz = new int [5][4];
        int i,j;
        int calificacion;
        for (i=0;i<5;i++){
            System.out.println("INGRESANDO CLIENTE " + (i+1)); 
            for (j=0;j<4;j++){
                System.out.println();
                System.out.println("INGRESE CALIFICACION ( 1 a 10 ) CORRESPONDIENTE A LA CATEGORIA: " + j);
                calificacion = Lector.leerInt();
                matriz [i][j] = calificacion;
            }
          
        }
        int [] promedio = new int [4];
        System.out.println();
        for (i=0;i<5;i++){
            System.out.println("LEYENDO CLIENTE " + (i+1)); 
            for (j=0;j<4;j++){
                System.out.print(matriz[i][j] + " ");
                promedio[j]=promedio[j] + matriz[i][j];
            }
        System.out.println();
        }     
        for (j=0;j<4;j++)   
           System.out.println("PROMEDIO CALIFICACION TIPO " + j + " --> " + (promedio[j]/5)); 
        
    }
    
}
