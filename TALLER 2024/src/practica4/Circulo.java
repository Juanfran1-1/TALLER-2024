
package practica4;
public class Circulo extends Figura{
    private double radio;
    private String relleno,color;
    public Circulo(double radio,String relleno,String color){
        super(relleno,color);
        setRadio(radio);
        
    }
    public double getRadio(){
        return radio;
    }
    public void setRadio(double radio){
        this.radio=radio;
    }
    @Override
    public double calcularPerimetro(){
        double perimetro=(2*radio*Math.PI);
        return(perimetro);
    }
    @Override
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