
package practica5;
import PaqueteLectura.*;
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private int cantinv;
    private Investigador [] inv;
    
    public Proyecto(String nombre,int codigo,String director){
        this.nombre=nombre;
        this.codigo=codigo;
        this.director=director;
        this.inv = new Investigador [50];
    }
    
    //SETTERS
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setCodigo(int codigo){
        this.codigo=codigo;
    }
    public void setDirector(String director){
        this.director=director;
    }
    
    //GETTERS
    public String getNombre(){
        return nombre;
    }
    public int getCodigo(){
        return codigo;
    }
    public String getDirector(){
        return director;
    }
    public int getCantInv(){
        return cantinv;
    }
    public Investigador [] getInv(){
        return this.inv;
    }
    
    public boolean verificar(){
        return cantinv == 50;
    }
    
    public void agregarInv(Investigador invnuevo){
        if (!this.verificar()){
            inv[cantinv++]=invnuevo;
        }
        else 
            System.out.println(" --PROYECTO COMPLETADO-- ");
    }
    
    public double getMontoTotal(){
        double aux= 0;
        for (int i=0;i<this.getCantInv();i++){
            aux = aux + inv[i].dineroTotalOtorgado();
            
        }
        return aux;
    }
    
    public String equipo(Investigador [] inv , int dl){
        String aux=" ";
        for (int i=0;i<dl;i++){
            aux= aux + " | " + inv[i].toString();
        }
        return aux;
    }
    
    public int buscarInv(String nombreInv){
        int aux=0;
        while ((aux < this.getCantInv()) && (!this.getInv()[aux].getNombre().equals(nombreInv)))
            aux++;
        if (aux < this.getCantInv())
            return aux;
        
        else 
            return -1;
    }
    
    public void otorgarTodos(String nombreInv){
        int aux=this.buscarInv(nombreInv);
        if (aux == -1){
            System.out.println("NO EXISTE TAL INVESTIGADOR ");
        }
        else {
            while((this.getInv()[aux].verificar())&&(aux != -1)){
                Subsidio s=new Subsidio (GeneradorAleatorio.generarDouble(1000), GeneradorAleatorio.generarString(10));
                this.getInv()[aux].agregarSub(s);
            }
        }
    }
    
    @Override
    public String toString(){
        String aux; 
        aux= "Nombre del proyecto " + this.getNombre() + " | codigo del proyecto " + this.getCodigo() + " | nombre del director " + this.getDirector() + "\n" + " | dinero total otorgado " + this.getMontoTotal() + "\n" + " | INFO INVESTIGADORES " + "\n" + this.equipo(this.getInv(),this.getCantInv());
        return aux;
    }    
             
}
