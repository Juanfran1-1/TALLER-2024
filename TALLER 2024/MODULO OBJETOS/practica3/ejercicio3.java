/*
 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante? 
 */
package practica3;
import PaqueteLectura.*;
public class ejercicio3 {
    public static void main ( String [] args){
        estanteria estante1= new estanteria();
        GeneradorAleatorio.iniciar();
        int i;
        String n,o,b,t,e,isbn;
        int a;
        double p;
        int random=0;
        for (i=0;i<20;i++){
            if (random<19){
            Autor unautor= new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
            Libro l= new Libro(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(405332),GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarDouble(13462),unautor);
            estante1.agregarLibro(l);
            System.out.println("AGREGADO" + (i+1));
            random++;
            }
            else {
                System.out.println("---ARMAR LIBRO---" + (i+1));
                System.out.print("Ingrese TITULO: ");t=(Lector.leerString());
                System.out.print("Ingrese EDITORIAL: ");e=(Lector.leerString());
                System.out.print("Ingrese NOMBRE DEL AUTOR: ");n=(Lector.leerString());
                System.out.print("Ingrese ORIGEN DEL AUTOR: ");o=(Lector.leerString());
                System.out.print("Ingrese ISBN DEL LIBRO : ");isbn=(Lector.leerString());
                System.out.print("Ingrese PRECIO DEL LIBRO: ");p=(Lector.leerDouble());
                System.out.print("Ingrese BIOGRAFIA DEL AUTOR: ");b=(Lector.leerString());
                System.out.print("Ingrese AÑO DE EDICION: ");a=(Lector.leerInt());
                Autor unautor= new Autor(n,o,b);
                Libro l= new Libro(t,e,a,isbn,p,unautor);
                estante1.agregarLibro(l);
                System.out.println("AGREGADO" + (i+1));
            }
        }
            estante1.devolverTitulos();
            System.out.println();
            
            /*INCISO B*/
            System.out.println(estante1.devolverLibro("Mujercitas"));
            
            
            //INCISO C
            
            /*System.out.println();
            System.out.println();
            System.out.println("INGRESE NUMERO PARA ESTABLECER MAXIMO CUPO EN EL ESTANTE NUEVO");
            int maximo=Lector.leerInt();
            i=0;
            estanteria estante2= new estanteria(maximo);
            System.out.println();
            System.out.println();
            for (i=0;i<maximo;i++){
                Autor unautor= new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
                Libro l= new Libro(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(405332),GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarDouble(13462),unautor);
                estante2.agregarLibro(l);
                System.out.println("AGREGADO" + (i+1));
                random++;
            }
            System.out.println();
            System.out.println();
            estante2.devolverTitulos();*/ 
        }
    }   
