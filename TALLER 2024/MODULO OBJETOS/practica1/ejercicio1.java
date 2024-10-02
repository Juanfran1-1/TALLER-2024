
package practica1;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio1 {
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        GeneradorAleatorio.iniciar();
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "8" + "="+ tabla2[8]);
        System.out.println("----");
        int multiplo = GeneradorAleatorio.generarInt(12);
        while (multiplo < 11) {
            i=multiplo;
            System.out.println("2x" + multiplo + "="+ tabla2[i]);
            System.out.println("----");
            multiplo = GeneradorAleatorio.generarInt(12);
        }
        System.out.println("SE HA LLEGADO AL NUMERO " + multiplo);
    } 
    
}
