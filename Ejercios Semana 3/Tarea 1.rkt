;Ejercico 1
(define (Operacion Cap I N)
  (cond ((= N 0)
         Cap)
        (else
         (* Cap
            (expt (+ 1 I) N)))))

(displayln (Operacion 2000 1/10 3))
;Ejercio 2
;Suma los numeros de un lista 
(define (Suma lista)
  (cond ((null? lista)
         0)  ; Si la lista está vacía, devolvemos 0
        (else
         (+ (car lista) (Suma (cdr lista))))));Sumamos el primer elemento de la lista con la suma del resto de la lista
;Ejemplo 3
(displayln (Suma '(1 2 4)))
(define (duplica lista letra)
  (if (null? lista)
      '()   ; Si la lista es vacía, retornamos una lista vacía
      (cons letra                       ; Agregamos la letra al principio de la lista
                  (duplica (cdr lista) letra))))  ; Llamamos recursivamente a 'duplica' con el resto de la lista y 'letra'

(displayln (duplica '(1 2 3) 'a))
;Ejemplo 4
(define (duplicar_si_igual a lista)
  (if (null? lista)
      '()   ; Si la lista es vacía, retornamos una lista vacía
      (if (equal? a (car lista))  ; Si el primer elemento de la lista es igual al número
          (cons (car lista)       ; Agregamos el elemento actual a la lista duplicada
                (cons (car lista)  ; Agregamos el elemento actual nuevamente a la lista duplicada
                      (duplicar_si_igual a (cdr lista))))  ; Llamamos recursivamente a la función con el resto de la lista
          (cons (car lista)  ; Si el primer elemento de la lista no es igual al número, simplemente agregamos el elemento a la lista duplicada
                (duplicar_si_igual a (cdr lista))))))  ; Llamamos recursivamente a la función con el resto de la lista

(displayln (duplicar_si_igual 'es '(hoy es lunes)))
;Ejemplo 5 sin map

(define (primero lista)
  (if (null? lista)
      0
      (car lista) ));; Toma una lista y devuelve el primer elemento de la lista.

(define (Primero lista-de-listas)
  (if (null? lista-de-listas)
      '()
      (cons (primero (car lista-de-listas)) ; Agrega el primer elemento de la primera sublista
            (Primero (cdr lista-de-listas)))))  ; Llama recursivamente a la función con el resto de la lista


(displayln (Primero '((1 2 3) (1 2 3))))
;Ejemplo 5 con map
(define (Primero lista-de-listas)
  (map car lista-de-listas))  ; Aplica la función car a cada sublista en lista-de-listas para obtener el primer elemento de cada una

(displayln (Primero '((1 2 3) (1 2 3))))

; Ejemplo 6
(define (merge lista1 lista2)
  (if (null? lista1)
      lista2
      (if (null? lista2)
          lista1
          (let ((elem1 (car lista1))
                (elem2 (car lista2)))
            (if (< elem1 elem2)
                (cons elem1 (merge (cdr lista1) lista2))
                (cons elem2 (merge lista1 (cdr lista2))))))))

(displayln (merge '(1 2 3 4) '( 4 6 7 B)))
;Ejemplo 7
(define (permutaciones lista)
  (if (null? lista)
      '(())  
      (apply append                   
             (map (lambda (x)
                    (map (lambda (p) (cons x p)) 
                         (permutaciones (remove-item x lista))))
                  lista))))

(define (remove-item item lst)
  (filter (lambda (x) (not (= item x))) lst))

(displayln (permutaciones '(1 2 3)))
;Ejemplo 8
(define (sub-conjunto? lista1 lista2)
  (cond ((null? lista1) #t)                 ; Si la lista1 está vacía, es un subconjunto
        ((memq (car lista1) lista2)         ; Si el primer elemento de lista1 está en lista2
         (sub-conjunto? (cdr lista1) lista2))  ; Verificar el resto de elementos
        (else #f)))                         ; Si no se cumple ninguna condición, no es un subconjunto

(displayln (sub-conjunto? '(a b c) '(a b c d e f)))  ; Devuelve #t
(displayln (sub-conjunto? '(a b c) '(d e f g)))      ; Devuelve #f
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


