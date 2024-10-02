
package practica4;
public abstract class Estacion {
    
    private String nombre;
    private double latitud;
    private double longitud;
    
    
    public Estacion(String nombre,double latitud,double longitud){
        this.setNombre(nombre);
        this.setLatitud(latitud);
        this.setLongitud(longitud);
    }
    
    
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setLatitud(double latitud){
        this.latitud=latitud;
    }    
    public void setLongitud(double longitud){
        this.longitud=longitud;
    }    
    
    
    public String getNombre(){
        return nombre;
    }
    public double getLatitud(){
        return latitud;
    }
    public double getLongitud(){
        return longitud;
    }    

}
