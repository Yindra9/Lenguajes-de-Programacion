public class ContactoFamiliar extends Contacto {
    private String parentesco;

    public ContactoFamiliar(String nombre, String apellido, String telefono, String email, String parentesco) {
        super(nombre, apellido, telefono, email);
        this.parentesco = parentesco;
    }

    @Override
    public String toString() {
        return "ContactoFamiliar: " + super.toString() + ", Parentesco: " + parentesco;
    }
}
