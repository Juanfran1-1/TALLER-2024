
package practica4;

public class SA extends Sistema {
    double matriz [][];
    private final int mes=12;
    
    public SA(String n, double la , double lo , int a , int c ){
        super(n,la,lo,a,c);
        matriz = new double [c][mes];
        int x,y,dl= this.getCant();
        for (x=0;x<dl;x++){
            for(y=0;y<12;y++){
                matriz[x][y] = 1000;
            }
        }
    }
    
    @Override
    public void registrarTemp(double temperatura, int a , int mes){
        matriz[a][mes]= temperatura;
    }
    
    @Override
    public String calcularPromedio(){
        int x,y,dl=this.getCant();
        double total;
        String aux=" ";
        for (x=this.getAnio();x<dl;x++){
            total=0;
            for (y=0;y<mes;y++){
                total += matriz[x][y];
            }
            aux= "La temperatura del anio " + x + " promedió " + String.format("%.2f",(double)total/12)+"\n";
        }
        return aux;
    }
    
    @Override
    public String mayorTemp(){
        String aux="";
        int x,y,dl=this.getCant();
        double max=-1;
        for (x=this.getAnio();x<dl;x++){
            for (y=0;y<mes;y++){
                if (matriz[x][y] > max){
                    aux="anio " + x + " mes " + y;
                    max=matriz[x][y];
                }
                    
            }
        }
        return aux;
    }
    
    @Override
    public  double obtenerTemp(int a,int m){
        return matriz[a][m];
    }
    
    @Override
    public String toString(){
        return "nombre:"+this.getNombre()+" latitud: "+this.getLatitud()+" Longitud: "+this.getLongitud()+ " promedio " + calcularPromedio();
    }
    
}
