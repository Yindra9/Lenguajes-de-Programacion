abstract class AbstractFactory {
    abstract Contacto crearContacto(String nombre, String apellido, String telefono, String email);
    abstract Evento crearEvento(String descripcion, String fecha);
}

