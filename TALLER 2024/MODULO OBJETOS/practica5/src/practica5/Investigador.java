
package practica5;
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int cantsub;
    private Subsidio [] sub;
    
    public Investigador(String nombre,int categoria,String especialidad){
        this.categoria=categoria;
        this.nombre=nombre;
        this.especialidad=especialidad;
        this.sub= new Subsidio [5];
        this.inicializarsubs(sub);
    }
    
    public void inicializarsubs(Subsidio [] s){
        for (int i=0;i<5;i++){
            s[i]= new Subsidio(0,null);
        }
    }
    
    public boolean verificar(){
        return cantsub < 5;
    }
    
    public void agregarSub(Subsidio sub){
        if (this.verificar()){
            this.getSub()[cantsub]=sub;
            this.getSub()[cantsub++].setEstado();
        }
    }
    
    //GETTERS
    public String getNombre(){
        return nombre;
    }
    public int getCategoria(){
        return categoria;
    }
    public String getEspecialidad(){
        return especialidad;
    }
    public int getCantSub(){
        return cantsub;
    }
    public Subsidio [] getSub(){
        return this.sub;
    }
    
    //SETTERS
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setCategoria(int categoria){
        this.categoria=categoria;
    }
    public void setEspecialidad(String especialidad){
        this.especialidad=especialidad;
    }
    
    public double dineroTotalOtorgado(){
        double monto=0;
        for (int i=0;i<this.cantsub;i++){
            monto+= this.getSub()[i].getMonto();
            
        }
        return monto;
    }
    
    @Override
    public String toString(){
        String aux;
        aux=" Nombre del investigador " + this.getNombre() + " | " + " especialidad " + this.getEspecialidad() + " | " + " categoria " + this.getCategoria() + " | " + " monto total " + this.dineroTotalOtorgado();
        return aux;
    }
    
}
