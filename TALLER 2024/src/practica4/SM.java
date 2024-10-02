
package practica4;
public class SM extends Sistema {
    double matriz [][];
    private final int mes=12;
    
    public SM(String n,double lo,double la,int a , int c){
        super(n,lo,la,a,c);
        matriz = new double [c][mes];
        int dl=this.getCant();
        for (int x=0;x<dl;x++){
            for(int y=0;y<mes;y++){
                matriz[x][y]=9999;
            }
        }
        
    }
    
    @Override
    public String mayorTemp(){
        String aux="";
        int x,y,dl=getCant();
        double max=-1;
        for (x=this.getAnio();x<dl;x++){
            for (y=0;y<mes;y++){
                if (matriz[x][y] > max){
                    aux="Anio " + x + " mes " + y;
                    max=matriz[x][y];
                }
            }
        }
        return aux;
    }
    
    @Override
    public void registrarTemp(double t,int a , int m){
        matriz[a][m]=t;
    }
    
    @Override
    public double obtenerTemp(int a,int m){
        return matriz[a][m];
    }
    
    @Override
    public String calcularPromedio(){
        int x,y,dl=this.getCant();
        String aux=" ";
        double total;
        for(y=0;y<mes;y++){
            total=0;
            for (x=this.getAnio();x<dl;x++){
                total += matriz[x][y];   
            }
            aux=" el anio " + x + " promedió " + ((double)(total/mes)) + "\n";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        return "nombre:"+this.getNombre()+" latitud: "+this.getLatitud()+" Longitud: " + this.getLongitud() + calcularPromedio();
    }
    
}
