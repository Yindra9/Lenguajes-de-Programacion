import java.util.ArrayList;
import java.util.List;

public class Agenda {
    private static Agenda instancia;
    private List<Object> elementos;

    private Agenda() {
        elementos = new ArrayList<>();
    }

    public static Agenda getInstancia() {
        if (instancia == null) {
            instancia = new Agenda();
        }
        return instancia;
    }

    public void agregarElemento(Object elemento) {
        elementos.add(elemento);
    }

    public void eliminarElemento(Object elemento) {
        elementos.remove(elemento);
    }

    public void modificarElemento(int index, Object nuevoElemento) {
        elementos.set(index, nuevoElemento);
    }

    public List<Object> getElementos() {
        return elementos;
    }

    @Override
    public String toString() {
        return "Agenda: " + elementos.toString();
    }
}
