(define (contieneSubcadena? cadena subcadena)
  (let ((longitudCadena (string-length cadena))
        (longitudSubcadena (string-length subcadena))
        (i 0))
    (let loop ()
      (cond ((>= (+ i longitudSubcadena) longitudCadena) #f)
            ((string=? (substring cadena i (+ i longitudSubcadena)) subcadena) #t)
            (else
             (set! i (+ i 1))
             (loop))))))

(define (filtrarPorSubcadena listaCadenas subcadena)
  (let ((resultado '()))
    (let loop ((lst listaCadenas))
      (cond ((null? lst) resultado)
            ((contieneSubcadena? (car lst) subcadena)
             (set! resultado (cons (car lst) resultado))
             (loop (cdr lst)))
            (else (loop (cdr lst)))))))

; Ejemplo de uso
(display (filtrarPorSubcadena '("la casa" "el perro" "pintando la cerca") "la"))

