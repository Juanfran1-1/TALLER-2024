
package practica3;
public class Autor {
    private String nombre,origen,biografia;
    
    public Autor(String unNombre,String unOrigen, String unaBiografia){
        this.nombre=unNombre;
        this.origen=unOrigen;
        this.biografia=unaBiografia;
    }
    public Autor(){
        
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setNombre(String unNombre){
        this.nombre=unNombre;
    }
    
    public String getOrigen(){
        return origen;
    }
    
    public void setOrigen(String unOrigen){
        this.origen=unOrigen;
    }
    public String getBiografia(){
        return biografia;
    }
    
    public void setBiografia(String unaBiografia){
        this.biografia=unaBiografia;
    }
    
    @Override
    public String toString(){
        String aux;
        aux="Nombre del autor " + nombre + " origen " + origen + " biografia: " + biografia;
        return(aux);
    }
}
