public class EventoEspecifico extends Evento {
    private String lugar;

    public EventoEspecifico(String descripcion, String fecha, String lugar) {
        super(descripcion, fecha);
        this.lugar = lugar;
    }

    @Override
    public String toString() {
        return "EventoEspecifico: " + super.toString() + ", Lugar: " + lugar;
    }
}
