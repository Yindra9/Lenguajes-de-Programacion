public class ContactoEmpresarial extends Contacto {
    private String empresa;
    private String cargo;

    public ContactoEmpresarial(String nombre, String apellido, String telefono, String email, String empresa, String cargo) {
        super(nombre, apellido, telefono, email);
        this.empresa = empresa;
        this.cargo = cargo;
    }

    @Override
    public String toString() {
        return "ContactoEmpresarial: " + super.toString() + ", Empresa: " + empresa + ", Cargo: " + cargo;
    }
}

