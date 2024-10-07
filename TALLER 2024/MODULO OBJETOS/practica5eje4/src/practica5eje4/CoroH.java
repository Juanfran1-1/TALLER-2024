
package practica5eje4;

public class CoroH extends Coro{
    private Corista [][] CoroH;
    private int [] vecdl;
    private int cantfilas;
    private int cantcol;
    private int dlcol=0;
    private int dlfila=0;
    
    public CoroH(String nombre,Director director,int cantcor ,int cantfilas ,  int cantcol){
        super(nombre,director,cantcor);
        this.cantfilas=cantfilas;
        this.cantcol=cantcol;
        CoroH= new Corista [cantfilas][cantcol];
    }
    
    
    @Override
    public boolean estaLleno() {
        return this.getCantcor() == (cantcol * cantfilas);
    }
    
    public void agregarCorista(Corista c){
        if (!estaLleno()){
            if (cantfilas > this.dlfila) {
                if (cantcol > this.dlcol) {
                     CoroH[dlfila][dlcol]=c;
                     dlcol++;       
                }
                else {
                    dlcol=0;
                    dlfila++;
                    CoroH[dlfila][dlcol]=c;
                } 
            }
        }
    } 
    
    @Override
    public boolean bienOrdenado(){
        int max=-999;
        int tonoact;
        int i=0,j=0;
        boolean ordenado=true;
        while ((i<this.cantfilas)&&(ordenado)){
            j=0;
            tonoact=this.CoroH[j][i].getTono();
            while ((j<cantcol)&&(ordenado=true)&&(tonoact==this.CoroH[j][i].getTono())){
                j++;
            } 
            if(i > this.cantfilas) {
                ordenado = false;
            }
            else if (j == this.cantcol) {
                if(tonoact < max) {
                    max = tonoact;
                    i++;
                } 
                } else { ordenado = false; } 
        }
        return ordenado;
    }
    
    @Override
    public String toString() {
        String dataCoristas = " ";
        int y =0;
        while(y < this.cantfilas) {
            for(int i = 0; i < cantcol ; i++) {
                dataCoristas += CoroH[y][i].toString() + "\n";
            }
            y++;
        }
        return super.toString() + dataCoristas;
    }
    
    
    
    
}
