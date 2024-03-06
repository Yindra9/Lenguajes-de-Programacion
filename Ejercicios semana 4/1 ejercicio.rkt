(define ListaProductos
  '(("Arroz" 8 18000)
    ("frijoles" 5 1200)
    ("azucar" 6 1100)
    ("cafe" 2 2800)
    ("leche" 9 1200)))
(define Factura1
  '(("Arroz" 2 18000)   ; 2 unidades a 18000 cada una
    ("cafe" 1 2800)))   ; 1 unidad a 2800

(define Factura2
  '(("frijoles" 3 1200) ; 3 unidades a 1200 cada una
    ("azucar" 2 1100)   ; 2 unidades a 1100 cada una
    ("leche" 4 1200)))  ; 4 unidades a 1200 cada una


(define (agregarProducto Lista nombre cantidad precio)
  (cond ((null? Lista)
         (list (list nombre cantidad precio)))
        ((equal? (car (car Lista)) nombre)
         (cons (list nombre (+ (cadr (car Lista)) cantidad) precio) (cdr Lista)))
        (else
         (cons (car Lista) (agregarProducto (cdr Lista) nombre cantidad precio)))))

(define (vender Lista nombre cantidad)
  (cond ((null? Lista)
         (display "No existen productos para vender.\n")
         '())
        ((equal? (car (car Lista)) nombre)
         (if (>= (cadr (car Lista)) cantidad)
             (cons (list (car (car Lista))
                         (- (cadr (car Lista)) cantidad)
                         (caddr (car Lista)))
                   (cdr Lista))
             (begin
               (display "No hay suficiente cantidad del producto para vender.\n")
               Lista)))
        (else
         (cons (car Lista) (vender (cdr Lista) nombre cantidad)))))

(define (existenciasMinimas Lista cantidad)
  (filter (lambda (x) (<= (cadr x) cantidad)) Lista))
(define (montoTotalSinImpuesto factura)
  (if (null? factura)
      0
      (+ (* (cadr (car factura)) (caddr (car factura))) ; cantidad * precio
         (montoTotalSinImpuesto (cdr factura)))))
(define (impuestoTotal factura umbral)
  (if (null? factura)
      0
      (let ((montoProducto (* (cadr (car factura)) (caddr (car factura)))))
        (+ (if (> montoProducto umbral) (* montoProducto 0.13) 0)
           (impuestoTotal (cdr factura) umbral)))))

(display(montoTotalSinImpuesto Factura2))
