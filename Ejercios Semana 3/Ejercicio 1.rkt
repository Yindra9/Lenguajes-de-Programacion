;Ejercico 1
(define (Operacion Cap I N)
  (cond ((= N 0)
         Cap)
        (else
         (* Cap
            (expt (+ 1 I) N)))))

(displayln (Operacion 2000 1/10 3))