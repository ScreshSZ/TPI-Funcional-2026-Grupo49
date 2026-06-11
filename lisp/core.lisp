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
;requerimiento 5
 (defun ciclos-por-tiempo-aux (minutos contador)
  (let ((duracion-ciclo 3.6))
    (if (< minutos duracion-ciclo)
        contador
        (ciclos-por-tiempo-aux (- minutos duracion-ciclo) (+ contador 1)))))

(defun ciclos-por-tiempo (minutos)
  (ciclos-por-tiempo-aux minutos 0))
