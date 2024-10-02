
package practica3;
public class Cliente {
    private String nombre;
    private int dni;
    private int edad;
    
    public Cliente(String unNombre,int unDni,int unaEdad){
        nombre=unNombre;
        dni=unDni;
        edad=unaEdad;
    }
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    public int getEdad(){
        return edad;
    }
    public void setEdad(int unaEdad){
        edad=unaEdad;
    }
    public int getDni() {
        return dni;
    }

    public void setDni(int unDni) {
        dni=unDni;
    }
    
   @Override
    public String toString(){
        String aux;
        aux= "nombre del cliente" + nombre + " / " + " dni " + dni + " / " + " edad " + edad + " / " ;
       return ( aux);
    }
}
