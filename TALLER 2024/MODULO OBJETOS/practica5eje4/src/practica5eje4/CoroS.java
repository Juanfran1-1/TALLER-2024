
package practica5eje4;

public class CoroS extends Coro{
    public Corista [] corosemi;
    
    public CoroS(String nombre, Director direc , int cantcor ){
        super(nombre,direc,cantcor);
        corosemi = new Corista[cantcor];
    }
    
    public void agregarCorista(Corista c){
        if (this.nollegoallimite() == true){
            this.corosemi[this.getDl()]=c;
            this.incrementarDL();
        } 
    }
    
    @Override
    public boolean estaLleno(){
        return this.Lleno();
    }

    @Override
    public boolean bienOrdenado() {
        boolean confirmar=true;
        int min = 9999;
        int i=0;
        while (( confirmar == true ) && (i < this.getDl())){
            if (this.corosemi[i].getTono() < min ){
                min = this.corosemi[i].getTono();
            }
            else 
                confirmar=false;
            i++;
        }
        return confirmar;
    }
    
    @Override
    public String toString(){
        String dataCoristas = " ";
        for(int i=0; i < this.getDl(); i++) {
            dataCoristas += corosemi[i].toString() + " | ";
        }
        return super.toString() + dataCoristas;
    }
}
