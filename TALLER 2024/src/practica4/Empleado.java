
package practica4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado ( String nom, double unSueldo, int unaAntiguedad){
        this.setNombre(nom);
        this.setSueldo(unSueldo);
        this.setAntiguedad(unaAntiguedad);
    }
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String unNombre){
        this.nombre=unNombre;
    }
    
    public double getSueldo(){
        return sueldo;
    }
    public void setSueldo(double unSueldo){
        this.sueldo=unSueldo;
    }
    
    public int getAntiguedad(){
        return antiguedad;
    }
    public void setAntiguedad(int unaAntiguedad){
        this.antiguedad=unaAntiguedad;
    }
    
    public String toString(){
        String aux;
        aux= "Mi nombre es " + nombre + " mi sueldo es de " + this.calcularSueldo() + " mi efectividad es de " + this.calcularEfectividad();
        return aux;
    }
    
    public abstract  double calcularEfectividad();
    
    public abstract double calcularSueldo();
    
    public double sueldoBase() {
        return this.getSueldo() + ((this.getSueldo()* 0.10)*this.getAntiguedad());
    }
    
    
    
}
