;requerimiento 1

(defun transicion (color-actual cambiar-a)
 (cond
  ((equal cambiar-a 'rojo) (list color-actual "cambiar-a-rojo"))
  ((equal cambiar-a 'amarillo) (list color-actual "cambiar-a-amarillo"))
  ((equal cambiar-a 'verde) (list color-actual "cambiar-a-verde"))
  (T (list color-actual 'accion-por-defecto))))

requerimiento 2
(defun timer (tiempo)
 (setq x (mod tiempo 216))
 (cond
  ((and (>= x 0) (< x 90)) 'rojo)
  ((and (>= x 90) (< x 96)) 'amarillo)
  ((and (>= x 96) (< x 216)) 'verde)))


;requerimiento 4

;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (Dado la operacion, siempre retorna un numero)
;; ESTRATEGIA: Simple/Directa
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo (duracion-rojo duracion-amarillo duracion-verde)

    (+ duracion-rojo duracion-amarillo duracion-verde)

)

;; ========================================================
;; FUNCIÓN: recomendacion
;; NATURALEZA: Pura (Dado la operacion, siempre retorna uno de 3 valores)
;; ESTRATEGIA: Función predicado + decisión
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion (duracion)

    (cond
        ((< duracion 35) "demasiado-corto")
        ((> duracion 150) "demasiado-largo")
        (t "optimo")
    )
    
)
;requerimiento 5
; =====================================================================
; FUNCION: ciclos-por-tiempo
; NATURALEZA: Pura
; ESTRATEGIA DE CONTROL: Orden Superior (truncate)
; IMPACTO: No destructiva
; =====================================================================
(defun ciclos-por-tiempo (minutos duracion-rojo duracion-amarillo duracion-verde)
  (truncate (/ (* minutos 60) 
               (duracion-ciclo duracion-rojo duracion-amarillo duracion-verde)))
  )
