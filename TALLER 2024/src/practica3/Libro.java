/*
Clase Libro a la cual se agregaron constructores. 
 */
package practica3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
  
   
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion, String unISBN, double unPrecio,Autor unPrimerAutor){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         ISBN =  unISBN;
         precio = unPrecio;
         primerAutor= unPrimerAutor;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor unPrimerAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public String getNombre(){
        return primerAutor.getNombre();
    } 
    public String getOrigen(){
        return primerAutor.getOrigen();
    } 
    public String getBiografia(){
        return primerAutor.getBiografia();
    } 
    
    public Autor getPrimerAutor(){
        return primerAutor;
    }
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    public void setPrimerAutor(Autor unPrimerAutor){
        primerAutor=unPrimerAutor;
    }
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.toString() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
