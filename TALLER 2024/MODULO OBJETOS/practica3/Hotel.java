
package practica3;

public class Hotel {
    
    private int numHabit=10;
    private Habitacion [] habitaciones;
    
    public Hotel(int n){
         numHabit = n;
         habitaciones=new Habitacion[n];
         for (int i=0;i<n;i++){
             habitaciones[i]= new Habitacion();
         }
    }
    public Hotel(){
        habitaciones = new Habitacion[10];
    }
    
    public int getnumHabitaciones(){
        return numHabit;
    }
    
    public Habitacion[] getHabitaciones() {
        return habitaciones;
    } 
    
    public void aumentarPrecios(double p){
        for (int i=0;i<numHabit;i++){
            habitaciones[i].aumentoPrecio(p);
        }
    }
    
    public void agregarCliente(Cliente cliente , int n){
            this.habitaciones[n-1].setCliente(cliente);
            this.habitaciones[n-1].setOcupada(true);
        }
    public boolean agregarClienteEsp(Cliente cliente , int n){
        boolean devolver;
        if (this.habitaciones[n-1].getocupada() != true){
            this.habitaciones[n-1].setCliente(cliente);
            this.habitaciones[n-1].setOcupada(true);
            return devolver=true;
        }
        else {
            System.out.println("HABITACION OCUPADA");
            System.out.println("INGRESE NUEVO NUMERO:");
            return devolver=false;    
        }
    }
    
    @Override
    public String toString() {
        String aux = "";
        for (int n = 0; n <numHabit; n++) {
            aux += "Habitacion" + (n+1) + ":" + this.habitaciones[n].toString() + "\n" ;
        }
        return aux;
    }
}
