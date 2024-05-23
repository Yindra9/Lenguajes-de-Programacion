import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import java.util.stream.Collectors;

public class Main extends JFrame {
    private Agenda agenda;

    private DefaultListModel<String> modeloContactos;
    private DefaultListModel<String> modeloEventos;

    public Main() {
        agenda = Agenda.getInstancia();

        // Datos ficticios para la prueba
        ContactoFactory contactoFactory = new ContactoFactory();
        EventoFactory eventoFactory = new EventoFactory();

        Contacto contacto1 = contactoFactory.crearContacto("Juan", "Perez", "123456789", "juan@example.com");
        ContactoFamiliar contactoFamiliar1 = new ContactoFamiliar("Ana", "Perez", "987654321", "ana@example.com", "Hermana");
        ContactoEmpresarial contactoEmpresarial1 = new ContactoEmpresarial("Carlos", "Lopez", "111222333", "carlos@example.com", "TechCorp", "Gerente");

        Evento evento1 = eventoFactory.crearEvento("Reunión", "2024-05-20");
        EventoEspecifico eventoEspecifico1 = new EventoEspecifico("Conferencia", "2024-06-15", "Centro de Convenciones");

        agenda.agregarElemento(contacto1);
        agenda.agregarElemento(contactoFamiliar1);
        agenda.agregarElemento(contactoEmpresarial1);
        agenda.agregarElemento(evento1);
        agenda.agregarElemento(eventoEspecifico1);

        initUI();
        updateLists();
    }

    private void initUI() {
        setTitle("Agenda de Contactos y Eventos");
        setSize(800, 600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel panel = new JPanel(new BorderLayout());

        modeloContactos = new DefaultListModel<>();
        modeloEventos = new DefaultListModel<>();

        JList<String> listaContactos = new JList<>(modeloContactos);
        JList<String> listaEventos = new JList<>(modeloEventos);

        JPanel listaPanel = new JPanel(new GridLayout(1, 2));
        listaPanel.add(new JScrollPane(listaContactos));
        listaPanel.add(new JScrollPane(listaEventos));

        JPanel tituloPanel = new JPanel(new GridLayout(1, 2));
        tituloPanel.add(new JLabel("Contactos", SwingConstants.CENTER));
        tituloPanel.add(new JLabel("Eventos", SwingConstants.CENTER));

        panel.add(tituloPanel, BorderLayout.NORTH);
        panel.add(listaPanel, BorderLayout.CENTER);

        getContentPane().add(panel, BorderLayout.CENTER);

        JPanel botonPanel = new JPanel();
        JButton botonAgregar = new JButton("Agregar");
        JButton botonEliminar = new JButton("Eliminar");

        botonAgregar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                agregarElemento();
            }
        });

        botonEliminar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                eliminarElemento(listaContactos, listaEventos);
            }
        });

        botonPanel.add(botonAgregar);
        botonPanel.add(botonEliminar);
        getContentPane().add(botonPanel, BorderLayout.SOUTH);
    }

    private void agregarElemento() {
        String[] opciones = {"Contacto", "Contacto Familiar", "Contacto Empresarial", "Evento", "Evento Específico"};
        String tipo = (String) JOptionPane.showInputDialog(this, "Seleccione el tipo de elemento a agregar", "Agregar",
                JOptionPane.QUESTION_MESSAGE, null, opciones, opciones[0]);

        if (tipo == null) return;

        JTextField nombreField = new JTextField(5);
        JTextField apellidoField = new JTextField(5);
        JTextField telefonoField = new JTextField(5);
        JTextField emailField = new JTextField(5);

        JPanel myPanel = new JPanel();
        myPanel.setLayout(new GridLayout(0, 1));

        if (tipo.contains("Contacto")) {
            myPanel.add(new JLabel("Nombre:"));
            myPanel.add(nombreField);
            myPanel.add(new JLabel("Apellido:"));
            myPanel.add(apellidoField);
            myPanel.add(new JLabel("Teléfono:"));
            myPanel.add(telefonoField);
            myPanel.add(new JLabel("Email:"));
            myPanel.add(emailField);
        }

        if (tipo.equals("Contacto Familiar")) {
            JTextField parentescoField = new JTextField(5);
            myPanel.add(new JLabel("Parentesco:"));
            myPanel.add(parentescoField);

            int result = JOptionPane.showConfirmDialog(this, myPanel, "Agregar Contacto Familiar", JOptionPane.OK_CANCEL_OPTION);
            if (result == JOptionPane.OK_OPTION) {
                ContactoFamiliar contactoFamiliar = new ContactoFamiliar(nombreField.getText(), apellidoField.getText(),
                        telefonoField.getText(), emailField.getText(), parentescoField.getText());
                agenda.agregarElemento(contactoFamiliar);
                updateLists();
            }
        } else if (tipo.equals("Contacto Empresarial")) {
            JTextField empresaField = new JTextField(5);
            JTextField cargoField = new JTextField(5);

            myPanel.add(new JLabel("Empresa:"));
            myPanel.add(empresaField);
            myPanel.add(new JLabel("Cargo:"));
            myPanel.add(cargoField);

            int result = JOptionPane.showConfirmDialog(this, myPanel, "Agregar Contacto Empresarial", JOptionPane.OK_CANCEL_OPTION);
            if (result == JOptionPane.OK_OPTION) {
                ContactoEmpresarial contactoEmpresarial = new ContactoEmpresarial(nombreField.getText(), apellidoField.getText(),
                        telefonoField.getText(), emailField.getText(), empresaField.getText(), cargoField.getText());
                agenda.agregarElemento(contactoEmpresarial);
                updateLists();
            }
        } else if (tipo.equals("Contacto")) {
            int result = JOptionPane.showConfirmDialog(this, myPanel, "Agregar Contacto", JOptionPane.OK_CANCEL_OPTION);
            if (result == JOptionPane.OK_OPTION) {
                Contacto contacto = new Contacto(nombreField.getText(), apellidoField.getText(), telefonoField.getText(),
                        emailField.getText());
                agenda.agregarElemento(contacto);
                updateLists();
            }
        } else if (tipo.equals("Evento") || tipo.equals("Evento Específico")) {
            JTextField descripcionField = new JTextField(5);
            JTextField fechaField = new JTextField(5);
            myPanel.add(new JLabel("Descripción:"));
            myPanel.add(descripcionField);
            myPanel.add(new JLabel("Fecha:"));
            myPanel.add(fechaField);

            if (tipo.equals("Evento Específico")) {
                JTextField lugarField = new JTextField(5);
                myPanel.add(new JLabel("Lugar:"));
                myPanel.add(lugarField);

                int result = JOptionPane.showConfirmDialog(this, myPanel, "Agregar Evento Específico", JOptionPane.OK_CANCEL_OPTION);
                if (result == JOptionPane.OK_OPTION) {
                    EventoEspecifico eventoEspecifico = new EventoEspecifico(descripcionField.getText(), fechaField.getText(),
                            lugarField.getText());
                    agenda.agregarElemento(eventoEspecifico);
                    updateLists();
                }
            } else {
                int result = JOptionPane.showConfirmDialog(this, myPanel, "Agregar Evento", JOptionPane.OK_CANCEL_OPTION);
                if (result == JOptionPane.OK_OPTION) {
                    Evento evento = new Evento(descripcionField.getText(), fechaField.getText());
                    agenda.agregarElemento(evento);
                    updateLists();
                }
            }
        }
    }

    private void eliminarElemento(JList<String> listaContactos, JList<String> listaEventos) {
        int selectedIndex = listaContactos.getSelectedIndex();
        if (selectedIndex != -1) {
            Object elemento = agenda.getElementos().stream()
                    .filter(e -> e instanceof Contacto)
                    .collect(Collectors.toList()).get(selectedIndex);
            agenda.eliminarElemento(elemento);
            updateLists();
            return;
        }

        selectedIndex = listaEventos.getSelectedIndex();
        if (selectedIndex != -1) {
            Object elemento = agenda.getElementos().stream()
                    .filter(e -> e instanceof Evento)
                    .collect(Collectors.toList()).get(selectedIndex);
            agenda.eliminarElemento(elemento);
            updateLists();
        }
    }

    private void updateLists() {
        modeloContactos.clear();
        modeloEventos.clear();

        List<Object> contactos = agenda.getElementos().stream()
                .filter(elemento -> elemento instanceof Contacto)
                .collect(Collectors.toList());

        List<Object> eventos = agenda.getElementos().stream()
                .filter(elemento -> elemento instanceof Evento)
                .collect(Collectors.toList());

        for (Object contacto : contactos) {
            modeloContactos.addElement(contacto.toString());
        }

        for (Object evento : eventos) {
            modeloEventos.addElement(evento.toString());
        }
    }

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                Main ex = new Main();
                ex.setVisible(true);
            }
        });
    }
}
