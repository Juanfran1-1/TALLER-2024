
package practica4;
public abstract class Sistema extends Estacion{
    private int anio,cant;
    
    public Sistema(String nombre,double latitud , double longitud , int anio , int cant){
        super(nombre,latitud,longitud);
        this.setAnio(anio);
        this.setCant(cant);
        int aux,auxY;
    } 
    
    public void setAnio(int anio){
        this.anio=anio;
    }
    public void setCant(int cant){
        this.cant=cant;
    }
    
    public int getAnio(){
        return anio;
    }
    public int getCant(){
        return cant;
    }
    
    public abstract String mayorTemp();
    
    public abstract void registrarTemp(double temperatura,int anio,int mes);
    
    public abstract double obtenerTemp(int anio,int mes);
    
    public abstract String calcularPromedio();
    
}
