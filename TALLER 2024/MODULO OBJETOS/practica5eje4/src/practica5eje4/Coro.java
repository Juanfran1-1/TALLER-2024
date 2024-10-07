
package practica5eje4;

public abstract class Coro {
    private String nombre;
    private Director director;
    private int dl;
    private int cantcor;
    
    public Coro(String nombre,Director director,int cantcor){
        this.nombre=nombre;
        this.director=director;
        this.cantcor=cantcor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getDl() {
        return dl;
    }

    public int getCantcor() {
        return cantcor;
    }

    public void setCantcor(int cantcor) {
        this.cantcor = cantcor;
    }
    
    
    public void incrementarDL(){
        this.dl++;
    }
    
    public boolean Lleno(){
        return cantcor == this.dl;
    }
    public boolean nollegoallimite(){
        return cantcor > this.dl;
    }
    public abstract boolean bienOrdenado();
    public abstract boolean estaLleno();
    
    @Override
    public String toString(){
        return "Nombre del coro " + this.nombre + " Director " + this.director.toString() + "\n Coristas: ";
    }
}
