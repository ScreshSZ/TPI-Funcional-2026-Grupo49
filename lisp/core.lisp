;requerimiento 1

(defun transicion (color-actual cambiar-a)
 (if (equal color-actual 'en-rojo)
   (list color-actual "cambiar-a-verde")))

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
; =====================================================================
; REQUERIMIENTO 5: Planificación Temporal
; =====================================================================

; =====================================================================
; FUNCION: ciclos-por-tiempo
; NATURALEZA: Pura
; ESTRATEGIA DE CONTROL: Orden Superior (truncate)
; IMPACTO: No destructiva
; =====================================================================
(defun ciclos-por-tiempo (minutos)
  (if (< minutos 0)
      0
      (truncate (/ minutos 3.6))))
