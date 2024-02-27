;Ejemplo 8
(define (sub-conjunto? lista1 lista2)
  (cond ((null? lista1) #t)                 ; Si la lista1 está vacía, es un subconjunto
        ((memq (car lista1) lista2)         ; Si el primer elemento de lista1 está en lista2
         (sub-conjunto? (cdr lista1) lista2))  ; Verificar el resto de elementos
        (else #f)))                         ; Si no se cumple ninguna condición, no es un subconjunto

(displayln (sub-conjunto? '(a b c) '(a b c d e f)))  ; Devuelve #t
(displayln (sub-conjunto? '(a b c) '(d e f g)))      ; Devuelve #f