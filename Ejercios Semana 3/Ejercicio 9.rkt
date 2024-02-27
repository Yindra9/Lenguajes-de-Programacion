;Ejemplo 9
(define (eliminar-elemento elemento lista)
  ;; La función eliminar-elemento toma un elemento y una lista y devuelve una nueva lista sin el elemento especificado.
  (filter (lambda (x)
            (not (null? x)))  ; Filtra elementos vacíos después de aplicar la función lambda
          (map (lambda (x)
                 (if (equal? x elemento) ; Verifica si el elemento actual es igual al elemento a eliminar
                     '()                  ; Si es igual, se reemplaza con un conjunto vacío
                     x))                  ; De lo contrario, el elemento se mantiene sin cambios
               lista)))

(displayln (eliminar-elemento '3 '(1 2 3 4 5))) ; Ejemplo de uso: eliminar 'b' de la lista '(a b c d)'
