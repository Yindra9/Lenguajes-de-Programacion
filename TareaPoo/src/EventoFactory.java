class EventoFactory extends AbstractFactory {
    public Contacto crearContacto(String nombre, String apellido, String telefono, String email) {
        return null; // No aplica
    }

    public Evento crearEvento(String descripcion, String fecha) {
        return new Evento(descripcion, fecha);
    }
}
