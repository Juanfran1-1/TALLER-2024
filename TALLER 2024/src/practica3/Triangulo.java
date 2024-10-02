
package practica3;
public class Triangulo {
    private double ladoA = 0;
    private double ladoB;
    private double ladoC;
    private String relleno;
    private String color;
    
    public Triangulo(double primerLado, double segundoLado, double tercerLado, String elRelleno, String elColor){
        ladoA=primerLado;
        ladoB=segundoLado;
        ladoC=tercerLado;
        relleno=elRelleno;
        color=elColor;     
    }
    
    public double getLadoA(){
        return ladoA;
    }
    
    public void setLadoA(double primerLado){
        ladoA = primerLado;
    }
    
    public double getLadoB(){
        return ladoB;
    }
    
    public void setLadoB(double segundoLado){
        ladoB=segundoLado;
    }
    
    public double getLadoC(){
        return ladoC;
    }
    
    public void setLadoc(double tercerLado){
        ladoC=tercerLado;
    }
    
    public String getRelleno(){
        return relleno;
    }
    
    public void setRelleno(String elRelleno){
        relleno = elRelleno;
    }
    
    public String getColor(){
        return color;
    }
    
    public void setColor(String elColor){
        color = elColor;
    }
    
    @Override
    public String toString(){
        String aux;
        aux="El lado 1 mide: " + ladoA + " , el lado 2 mide: " + ladoB + ", el lado 3 mide: " + ladoC + ", el relleno es de color: " + relleno + ", la linea es de color: " + color; 
        return(aux);
    }
    public double calcularPerimetro(){
        double perimetro;
        perimetro= ladoA+ladoB+ladoC;
        return(perimetro);
    }
    
    public double calcularArea(){
        double area,s;
        s= (ladoA+ladoB+ladoC) / 2.0;
        area= Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));
        return(area); 
    }
        
}
