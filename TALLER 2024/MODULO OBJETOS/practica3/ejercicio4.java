/* 4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación. */

package practica3;
import PaqueteLectura.*;
public class ejercicio4 {
    public static void main ( String [] args){
        int n;
        System.out.println("INGRESE NUMERO DE HABITACIONES DEL HOTEL: ");n=Lector.leerInt();
        Hotel h1= new Hotel(n);
        int numhab = 1;
        for (int i=0;i<10;i++){
            Cliente c = new Cliente(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(999999999),GeneradorAleatorio.generarInt(99));
            h1.agregarCliente(c, numhab);
            numhab++;
        }
        System.out.println(h1.toString());
        System.out.println("INGRESE PRECIO A AUMENTAR EN LAS HABITACIONES DEL HOTEL: ");h1.aumentarPrecios(Lector.leerInt());
        System.out.println("--PRECIOS ACTUALIZADOS--");
        System.out.println(h1.toString());
        System.out.println("INGRESE NUMERO A UBICAR CLIENTE EN LAS HABITACIONES DEL HOTEL: ");n=Lector.leerInt();
        Cliente c = new Cliente("juan",21,44751138);
        while (h1.agregarClienteEsp(c, n)!=true){
           n=Lector.leerInt();
           h1.agregarClienteEsp(c, n);
        }
        System.out.println(h1.toString());
        
    }
}
