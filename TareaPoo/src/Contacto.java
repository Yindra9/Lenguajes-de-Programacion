public class Contacto extends Persona {
    public Contacto(String nombre, String apellido, String telefono, String email) {
        super(nombre, apellido, telefono, email);
    }

    @Override
    public String toString() {
        return "Contacto: " + super.toString();
    }
}
