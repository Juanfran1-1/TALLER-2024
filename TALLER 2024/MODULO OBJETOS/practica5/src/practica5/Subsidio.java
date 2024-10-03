package practica5;
public  class Subsidio {
    private double monto;
    private String motivo;
    private boolean estado;
    
    public Subsidio(double monto,String motivo){
        setMonto(monto);
        setMotivo(motivo);
        estado=(false);
        
    }
    
    public void setMonto(double monto){
        this.monto=monto;
    }
    
    public void setMotivo(String motivo){
        this.motivo=motivo;
    }
    public void setEstado(){
        estado=true;
    }
    
    public double getMonto(){
        return monto;
    }
     public String getMotivo(){
         return motivo;
    }    
     public boolean getEstado(){
         return estado;
     }
     
     
}
