/*
LA GORDA DEL ESTANTE
 */
package practica3;

public class estanteria {
    private Libro [] estante;
    private int maximo=20;
    private int cant=0;
    
    public estanteria(){
        estante = new Libro[maximo];
    }
    public estanteria(int n){
        maximo=n;
        estante = new Libro[maximo];
    }
        
    public boolean estaLleno(){
        return(cant == 20);        
    }
    public int devolverCant(){
        return cant;
    }
    public boolean agregarLibro(Libro l){
        if (!(estaLleno())){
            estante[cant++]=l;
            return true;
        }
        else 
            return false;
    }
    
    public Libro devolverLibro(String titulopedido){
        int indice=0;
        while ((indice<maximo)&&(!titulopedido.equals(this.estante[indice].getTitulo()))){
            indice++;
        }
        if (indice< cant){
            return estante[indice];
        }
        else 
            return null;
    }
    public boolean devolverTitulos(){
        int i=0;
        for (i=0;i<cant;i++){
            System.out.println(estante[i].toString());
        }
        return true;
    }
    
    
}
    

