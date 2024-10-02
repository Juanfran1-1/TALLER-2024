
package practica4;
public class Trabajador extends Persona{
    private String tarea;
    public Trabajador (String n,int d,int e,String tarea){
        super(n,d,e);
        this.setTarea(tarea);
    }
    public void setTarea(String tarea){
        this.tarea=tarea;
    }
    public String getTarea(){
        return tarea;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + " trabajo de " + this.getTarea();
        return aux;
    }
}
