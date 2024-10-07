package practica5eje4;

public class Corista extends Persona {
    private int tono;
    
    public Corista(String nombre,int edad,int dni,int tono){
        super(nombre,edad,dni);
        setTono(tono);
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    
    @Override
    public String toString(){
        return super.toString() +  " tono del corista " + this.getTono();
    }
}
