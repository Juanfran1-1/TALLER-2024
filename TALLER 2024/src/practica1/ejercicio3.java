
package practica1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class ejercicio3 {
    public static void main(String [] args) {
        GeneradorAleatorio.iniciar();
        int x=5;
        int y=5;
        int [][] matriz = new int [x][y];
        int i,j;
        for (i=0;i<x;i++)
            for(j=0;j<y;j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
        System.out.print(" ---MOSTRANDO CONTENIDO DE LA MATRIZ--- "); 
        System.out.println();
        for (i=0;i<x;i++){
            for(j=0;j<y;j++){
                System.out.print(matriz[i][j] + " ");
            
        }
           System.out.println();
    }
        //INCISO 3
        System.out.println();
        System.out.println();
        System.out.println("INCISO 3");
        int suma=0;
        for (i=0;i<1;i++)
            for (j=0;j<y;j++)
                suma= matriz[i][j] + suma;
        System.out.print(suma + " <--- total fila 1 ");
        
        //INCISO 4
        System.out.println();
        System.out.println();
        System.out.println("INCISO 4");
        int [] vector = new int [5];
        for (j=0;j<y;j++)
            for(i=0;i<x;i++)
                vector[j]=matriz[i][j] + vector[j];
        for (i=0;i<x;i++)
            System.out.println(vector[i] + " <--- total columna  " + (i+1));
        //INCISO 5
        System.out.println();System.out.println();System.out.println("INCISO 5");
        System.out.println();System.out.print("INGRESE NUMERO A BUSCAR EN LA MATRIZ: ");
        int buscado= Lector.leerInt();
        boolean encontrado = false;
        i =0;
        int filanumero= 0;
        int columnanumero=0;
        while ((encontrado == false) && (i < x)) { 
            j=0;
            while ((encontrado == false) && (j < x)) { 
                if (matriz[i][j] == buscado){
                    encontrado=true;
                    filanumero=i;
                    columnanumero=j;    
                }
                j++;
            }    
            i++;    
        }   
        if (encontrado == true) {
            System.out.print("EL NUMERO HA SIDO ENCONTRADO EN LA POSICION: " + (filanumero + 1) + " , " + (columnanumero + 1));
        }
        else    
            System.out.print("EL NUMERO NO HA SIDO ENCONTRADO EN LA MATRIZ: ");
            
            
    }
         
            
}
     
