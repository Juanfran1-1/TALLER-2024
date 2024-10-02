
package practica4;
public class Jugador extends Empleado{
    private int goles;
    private int partidos;     
    
    public Jugador(int g,int p , String n,double s ,int a){
        super(n,s,a);
        this.setGoles(g);
        this.setPartidos(p);
    }
    
    public void setGoles(int g){
        this.goles=g;
    }
    public void setPartidos(int p){
        this.partidos=p;
    }
    
    public int getGoles(){
        return goles;
    }
    public int getPartidos(){
        return partidos;
    }
    
    @Override
    public double calcularEfectividad(){
        double aux = (double) this.getGoles() / this.getPartidos();
        return aux;
    }
    
    @Override
    public double calcularSueldo(){
        double aux = this.sueldoBase();
        if (this.calcularEfectividad() > 0.5){
            aux = aux * 2;
        }
        return aux;
    }
    
}
