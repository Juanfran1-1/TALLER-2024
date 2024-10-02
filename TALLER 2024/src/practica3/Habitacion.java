
package practica3;
import PaqueteLectura.*;
public class Habitacion {
    private double precio;
    private boolean ocupada;
    Cliente cliente;
    public Habitacion(){
        precio=GeneradorAleatorio.generarDouble(6001)+2000;
        ocupada=false;
        cliente=null;
    }
    public double getPrecio(){
        return precio;
    }
    public void setPrecio(double precio){
        this.precio=precio;
    }
    public boolean getocupada(){
        return ocupada;
    }
    public void setOcupada(boolean ocupada){
        this.ocupada=ocupada;
    }
    public Cliente getCliente(){
        return cliente;
    }
    public void setCliente(Cliente cliente){
        this.cliente=cliente;
    }
    public void aumentoPrecio(double n){
        precio += n;
    }
    
    @Override
    public String toString(){
        String aux= "Costo " + precio + " ocupada? " + ocupada;
        if (ocupada == true){
            aux += " " + " ocupada por" + cliente.toString();
        }
        return(aux);
    }
}