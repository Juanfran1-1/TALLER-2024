/*Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.*/
package practica2;
import PaqueteLectura.*;
public class ejercicio5 {
    public static void main(String [] args){
        int df=20;
        Partido [] vector = new Partido [df];
        String nomlocal,nomvis;
        int gollocal,golvis,dl,i;
        
        Partido p= new Partido ();
        //inicializar vector 
        for (i=0;i<df;i++)
            vector[i]= p;
        //cargarvector;
        dl=0;
        int random=0;
        nomvis = GeneradorAleatorio.generarString(5);
        nomlocal = GeneradorAleatorio.generarString(5);
        gollocal = GeneradorAleatorio.generarInt(7);
        golvis = GeneradorAleatorio.generarInt(7);
        while (!(nomvis.equals("ZZZ")) && (dl<df)){
            vector[dl]= new Partido(nomlocal,nomvis,gollocal,golvis);
            if (random < 10){
            nomvis = GeneradorAleatorio.generarString(5);
            nomlocal = GeneradorAleatorio.generarString(5);
            gollocal = GeneradorAleatorio.generarInt(7);
            golvis = GeneradorAleatorio.generarInt(7);}
            else {
                System.out.println("NOMBRE DEL EQUIPO VISITANTE: ");
                nomvis = Lector.leerString();
                System.out.println("NOMBRE DEL EQUIPO LOCAL: ");
                nomlocal = Lector.leerString();
                System.out.println("GOLES DEL LOCAL: ");
                gollocal = Lector.leerInt();
                System.out.println("GOLES DEL VISITANTE: ");
                golvis = Lector.leerInt();   
            }
            random++;
            dl++;
            
        }
        int gboca=0;
        int griver=0;
        for (i=0;i<df;i++){
            System.out.println("Partido " + (i+1));
            System.out.println(vector[i].getLocal() + " " + vector[i].getGolesLocal() + " - " + vector[i].getGolesVisitante() + " " + vector[i].getVisitante());
            if (vector[i].getLocal().equals("boca"))
                gboca += vector[i].getGolesLocal();
            if(vector[i].getGanador().equals("river"))
                griver++;
        }
       System.out.println("CANTIDAD DE PARTIDOS GANADOS POR RIVER: " + griver);
       System.out.println("CANTIDAD DE GOLES HECHOS POR BOCA DE LOCAL: " + gboca);
    }
}
