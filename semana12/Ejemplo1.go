package main

//Ejercicio semana #12
import (
	"fmt"
)

type producto struct {
	nombre   string
	cantidad int
	precio   int
}

type listaProductos []producto

var lProductos listaProductos

const existenciaMinima int = 10

func (l *listaProductos) agregarProducto(nombre string, cantidad int, precio int) {
	// Al agregar un producto, se verifica si ya existe en la lista
	// Si existe, se incrementa la cantidad y se actualiza el precio si es diferente
	for i := range *l {
		if (*l)[i].nombre == nombre {
			(*l)[i].cantidad += cantidad
			if (*l)[i].precio != precio {
				(*l)[i].precio = precio
			}
			return
		}
	}
	*l = append(*l, producto{nombre: nombre, cantidad: cantidad, precio: precio})
}

// Función para agregar múltiples productos a la lista
func (l *listaProductos) agregarProductos(productos ...producto) {
	for _, p := range productos {
		l.agregarProducto(p.nombre, p.cantidad, p.precio)
	}
}

// La función buscarProducto ahora retorna el producto encontrado y un error
func (l *listaProductos) buscarProducto(nombre string) (producto, error) {
	for _, p := range *l {
		if p.nombre == nombre {
			return p, nil
		}
	}
	return producto{}, fmt.Errorf("producto %s no encontrado", nombre)
}

func (l *listaProductos) venderProducto(nombre string, cantidad int) error {
	// Buscar el producto
	prod, err := l.buscarProducto(nombre)
	if err != nil {
		return err
	}

	// Verificar si hay suficiente cantidad para vender
	if prod.cantidad < cantidad {
		return fmt.Errorf("no hay suficiente cantidad de %s para vender", nombre)
	}

	// Actualizar la cantidad
	prod.cantidad -= cantidad

	// Si la cantidad es cero, eliminar el producto de la lista
	if prod.cantidad == 0 {
		l.eliminarProducto(nombre)
	}

	return nil
}

// Función para eliminar un producto de la lista
func (l *listaProductos) eliminarProducto(nombre string) {
	for i, p := range *l {
		if p.nombre == nombre {
			*l = append((*l)[:i], (*l)[i+1:]...)
			return
		}
	}
}

// Función para modificar el precio de un producto usando la función buscarProducto modificada
func (l *listaProductos) modificarPrecioProducto(nombre string, nuevoPrecio int) error {
	// Buscar el producto
	prod, err := l.buscarProducto(nombre)
	if err != nil {
		return err
	}

	// Actualizar el precio
	prod.precio = nuevoPrecio

	return nil
}

func llenarDatos() {
	lProductos.agregarProductos(
		producto{nombre: "arroz", cantidad: 15, precio: 2500},
		producto{nombre: "frijoles", cantidad: 4, precio: 2000},
		producto{nombre: "leche", cantidad: 8, precio: 1200},
		producto{nombre: "café", cantidad: 12, precio: 4500},
	)
}

func main() {
	llenarDatos()
	fmt.Println("Lista de Productos:")
	fmt.Println(lProductos)

	// Ejemplo de vender un producto
	err := lProductos.venderProducto("arroz", 5)
	if err != nil {
		fmt.Println("Error al vender producto:", err)
	} else {
		fmt.Println("Venta exitosa de arroz")
	}

	// Modificar el precio del producto "leche"
	err = lProductos.modificarPrecioProducto("leche", 1300)
	if err != nil {
		fmt.Println("Error al modificar precio:", err)
	} else {
		fmt.Println("Precio de leche modificado")
	}

	fmt.Println("Lista de Productos Actualizada:")
	fmt.Println(lProductos)
}
