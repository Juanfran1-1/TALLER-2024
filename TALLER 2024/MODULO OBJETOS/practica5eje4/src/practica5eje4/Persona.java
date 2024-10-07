package practica5eje4;

public abstract class Persona {
    private int edad;
    private String nombre;
    private int dni;
    
    public Persona(String nombre , int edad , int dni){
        setNombre(nombre);
        setEdad(edad);
        setDni(dni);
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    @Override
    public String toString() {
        return " nombre = " + nombre  + "edad = " + edad +  "dni = " + dni ;
    }
    
    
}
