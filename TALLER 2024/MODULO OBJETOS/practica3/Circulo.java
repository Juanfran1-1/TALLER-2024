
package practica3;
public class Circulo {
    private double radio;
    private String relleno,color;
    public Circulo(double radio,String relleno,String color){
        this.radio=radio;
        this.relleno=relleno;
        this.color=color;
    }
    public double getRadio(){
        return radio;
    }
    public void setRadio(double radio){
        this.radio=radio;
    }
    
    public String getRelleno(){
        return relleno;
    }
    public void setRelleno(String relleno){
        this.relleno=relleno;
    }
    
    public String getColor(){
        return color;
    }
    public void setColor(String color){
        this.color=color;
    }
    
    public double calcularPerimetro(){
        double perimetro=(2*radio*Math.PI);
        return(perimetro);
    }
    public double calcularArea(){
        double area=((radio*radio)*Math.PI);
        return(area);
    }
    
    @Override
    public String toString(){
        String aux= "radio del circulo: " + radio + " | " + " relleno del circulo: " + relleno + " | " + " color de la linea del circulo: " + color;
        return aux;
    }
}