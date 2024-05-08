package main

import (
	"fmt"
	"sort"
	"strings"
)

// Definición de la estructura infoCliente
type infoCliente struct {
	nombre string
	correo string
	edad   int32
}

// Definición de la estructura listaClientes como un slice de infoCliente
type listaClientes []infoCliente

// Función para agregar un cliente a la listaClientes
func (lc *listaClientes) agregarCliente(nombre, correo string, edad int32) {
	*lc = append(*lc, infoCliente{nombre, correo, edad})
}

// Función filter genérica para listaClientes
func (lc *listaClientes) filter(condicion func(infoCliente) bool) *listaClientes {
	resultado := make(listaClientes, 0)
	for _, cliente := range *lc {
		if condicion(cliente) {
			resultado = append(resultado, cliente)
		}
	}
	return &resultado
}

// Función listaClientes_ApellidoEnCorreo devuelve la lista de clientes cuyos correos contienen el apellido de la persona
func (lc *listaClientes) listaClientes_ApellidoEnCorreo() *listaClientes {
	return lc.filter(func(cliente infoCliente) bool {
		apellidos := strings.Fields(cliente.nombre) // Dividir el nombre en apellidos
		for _, apellido := range apellidos {
			if strings.Contains(strings.ToLower(cliente.correo), strings.ToLower(apellido)) {
				return true
			}
		}
		return false
	})
}

// Función cantidadCorreosCostaRica devuelve la cantidad de clientes cuyos correos pertenecen a dominios de Costa Rica
func (lc *listaClientes) cantidadCorreosCostaRica() int {
	condicion := func(cliente infoCliente) bool {
		return strings.HasSuffix(cliente.correo, ".cr")
	}
	clientesCR := lc.filter(condicion)
	return len(*clientesCR)
}

// Función map genérica para listaClientes
func (lc *listaClientes) mapFunc(fn func(infoCliente) infoCliente) *listaClientes {
	resultado := make(listaClientes, len(*lc))
	for i, cliente := range *lc {
		resultado[i] = fn(cliente)
	}
	return &resultado
}

// Función clientesSugerenciasCorreos devuelve una nueva lista con correos sugeridos para los clientes
func (lc *listaClientes) clientesSugerenciasCorreos() *listaClientes {
	sugerirCorreo := func(cliente infoCliente) infoCliente {
		if !strings.Contains(cliente.correo, cliente.nombre) {
			// Cambiar el correo por uno sugerido
			nombreSinEspacios := strings.ReplaceAll(cliente.nombre, " ", "_")
			nuevoCorreo := nombreSinEspacios + "@sugerido.com"
			cliente.correo = nuevoCorreo
		}
		return cliente
	}
	return lc.mapFunc(sugerirCorreo)
}

// Función correosOrdenadosAlfabeticos devuelve una lista nueva con todos los correos de clientes ordenados alfabéticamente
func (lc *listaClientes) correosOrdenadosAlfabeticos() []string {
	correos := make([]string, len(*lc))
	for i, cliente := range *lc {
		correos[i] = cliente.correo
	}
	sort.Strings(correos)
	return correos
}

func main() {
	// Crear la lista de clientes
	var listaClientes listaClientes
	listaClientes.agregarCliente("Oscar Viquez", "oviquez@tec.ac.cr", 44)
	listaClientes.agregarCliente("Pedro Perez", "elsegundo@gmail.com", 30)
	listaClientes.agregarCliente("Maria Lopez", "mlopez@hotmail.com", 18)
	listaClientes.agregarCliente("Juan Rodriguez", "jrodriguez@gmail.com", 25)
	listaClientes.agregarCliente("Luisa Gonzalez", "muyseguro@tec.ac.cr", 67)
	listaClientes.agregarCliente("Marco Rojas", "loquesea@hotmail.com", 47)
	listaClientes.agregarCliente("Marta Saborio", "msaborio@gmail.com", 33)
	listaClientes.agregarCliente("Camila Segura", "csegura@ice.co.cr", 19)
	listaClientes.agregarCliente("Fernando Rojas", "frojas@estado.gov", 27)
	listaClientes.agregarCliente("Rosa Ramirez", "risuenna@gmail.com", 50)

	// 2) Probar listaClientes_ApellidoEnCorreo
	// Probar listaClientes_ApellidoEnCorreo
	clientesConApellido := listaClientes.listaClientes_ApellidoEnCorreo()
	fmt.Println("Clientes con apellido en el correo:")
	for _, cliente := range *clientesConApellido {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}

	// 3) Probar cantidadCorreosCostaRica
	cantidad := listaClientes.cantidadCorreosCostaRica()
	fmt.Printf("\nCantidad de clientes con correos de Costa Rica: %d\n", cantidad)

	// 4) Probar clientesSugerenciasCorreos
	clientesSugeridos := listaClientes.clientesSugerenciasCorreos()
	fmt.Println("\nClientes con correos sugeridos:")
	for _, cliente := range *clientesSugeridos {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}

	// 5) Probar correosOrdenadosAlfabeticos
	correosOrdenados := listaClientes.correosOrdenadosAlfabeticos()
	fmt.Println("\nCorreos ordenados alfabéticamente:")
	for _, correo := range correosOrdenados {
		fmt.Println(correo)
	}
}
