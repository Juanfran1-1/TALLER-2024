
package practica1;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio4 {
    public static void main ( String [] args){
        GeneradorAleatorio.iniciar();
        int [][] matriz =  new int [9][5];
        int piso= GeneradorAleatorio.generarInt(9)+1;
        int of = GeneradorAleatorio.generarInt(4)+1;
        while ((piso < 9)) {
            matriz[piso][of]=  matriz[piso][of] + 1;
            piso= GeneradorAleatorio.generarInt(9)+1;
            of = GeneradorAleatorio.generarInt(4)+1;
        }
        int i,j;
        for (i=1;i<=8;i++){
            for (j=1;j<=4;j++){
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }    
}
}
