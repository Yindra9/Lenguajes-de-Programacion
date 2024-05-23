class ContactoFactory extends AbstractFactory {
    public Contacto crearContacto(String nombre, String apellido, String telefono, String email) {
        return new Contacto(nombre, apellido, telefono, email);
    }

    public Evento crearEvento(String descripcion, String fecha) {
        return null; // No aplica
    }
}
