/*
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla. 
*/

package practica5;
import PaqueteLectura.*;
public class Practica5 {
    public static void main(String[] args) {
        Investigador i,i2,i3;
        Proyecto p;
        Subsidio s,s2;
        GeneradorAleatorio.iniciar();
        
        i= new Investigador("juanfran",GeneradorAleatorio.generarInt(5)+1, "gamer ");
        i2 = new Investigador("weber",GeneradorAleatorio.generarInt(5)+1,"jugador rocket ");
        i3 = new Investigador("jere",GeneradorAleatorio.generarInt(5)+1, "rugbier ");
        p = new Proyecto("APOBAR TALLER ",GeneradorAleatorio.generarInt(100)+1,GeneradorAleatorio.generarString(8));
        s= new Subsidio(GeneradorAleatorio.generarInt(2000), GeneradorAleatorio.generarString(8));
        s2= new Subsidio(GeneradorAleatorio.generarInt(2000), GeneradorAleatorio.generarString(8));
        
        p.agregarInv(i);
        p.agregarInv(i2);
        p.agregarInv(i3);
        
        for (int x=0;x<3;x++){
            p.getInv()[x].agregarSub(s);
            p.getInv()[x].agregarSub(s2);
        }
        
        System.out.println(p.getInv()[0].getCantSub());
        p.otorgarTodos("juanfran");
        System.out.println(p.getInv()[0].getCantSub());
        System.out.println(p.toString());
    }
    
}
