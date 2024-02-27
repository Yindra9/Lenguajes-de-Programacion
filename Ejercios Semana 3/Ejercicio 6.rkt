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