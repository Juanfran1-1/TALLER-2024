
package practica4;
public class Entrenador extends Empleado {
    int cant;
    
    public Entrenador(int camp,String n,double s,int a){
        super(n,s,a);
        this.setCampeonatos(camp);
    }
    
    public void setCampeonatos(int camp){
        this.cant=camp;
    }
    public int getCantidad(){
        return cant;
    }
    
    @Override
    public double calcularEfectividad(){
        double aux = (double) this.getCantidad() / this.getAntiguedad();
        return aux;
    }
    
    @Override
    public double calcularSueldo(){
        double aux = (double) this.sueldoBase();
        if (this.getCantidad() == 0){
            return aux;
        }
        else {
            if ((this.getCantidad() >= 1) && (this.getCantidad() <= 4)){
                aux = aux + 5000;
            }
            else if ((this.getCantidad() >= 5) && (this.getCantidad() <= 10)){
                aux = aux + 30000;
            }
            else if ((this.getCantidad() > 10)){
                aux = aux + 50000;
            }
        }
        return aux;
    }
    
}
