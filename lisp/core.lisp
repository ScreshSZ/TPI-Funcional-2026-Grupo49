;;; =========================================================================
;;; REQUERIMIENTO 1: Estados de Transición
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Validación y construcción funcional de resultados.
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun transicion (color-actual cambiar-a)
  (cond
    ((not (member color-actual '(rojo amarillo verde)))
     "Error: Color actual invalido.")
    ((not (member cambiar-a '(rojo amarillo verde)))
     (list color-actual 'accion-por-defecto))
    (t
     (list color-actual
           (concatenate 'string
                        "cambiar-a-"
                        (symbol-name cambiar-a))))))


;;; =========================================================================
;;; REQUERIMIENTO 2: Temporizador Automático
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Validación de entrada y cálculo modular sobre un ciclo semafórico completo.
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun timer (tiempo)
  (cond
    ((not (numberp tiempo))
     "Error: El tiempo debe ser un valor numerico.")
    ((< tiempo 0)
     "Error: El tiempo no puede ser negativo.")
    ((< (mod tiempo 216) 90)
     'rojo)
    ((< (mod tiempo 216) 96)
     'amarillo)
    (t
     'verde)))

;requerimiento 3
;(ql:quickload "local-time") correr el local time
;; ========================================================
;; FUNCIÓN: registrar-cambio
;; NATURALEZA: Impura (imprime información en la terminal)
;; ESTRATEGIA: Función Simple
;; IMPACTO: No destructiva
;; ========================================================
(defun registrarCambio (epoch color-anterior color-nuevo)
   (concatenate 'string
                "["
                (local-time:format-timestring
                 nil
                 (local-time:unix-to-timestamp epoch)
                 :format '((:year 4) "-"
                           (:month 2) "-"
                           (:day 2) " "
                           (:hour 2) ":"
                           (:min 2) ":"
                           (:sec 2)))
                "]: la luz ha cambiado de "
                (symbol-name color-anterior)
                " a "
                (symbol-name color-nuevo)
   )
)


;requerimiento 4

;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura 
;; ESTRATEGIA: Simple/Directa
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo (duracion-rojo duracion-amarillo duracion-verde)

    (+ duracion-rojo duracion-amarillo duracion-verde)

)

;; ========================================================
;; FUNCIÓN: recomendacion
;; NATURALEZA: Pura
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
  (if (and (numberp minutos) (not (< minutos 0))
           (integerp duracion-rojo) (> duracion-rojo 0)
           (integerp duracion-amarillo) (> duracion-amarillo 0)
           (integerp duracion-verde) (> duracion-verde 0))
      (truncate (/ (* minutos 60) 
                   (duracion-ciclo duracion-rojo duracion-amarillo duracion-verde)))
       "ERROR: parametros invalidos"))

;;; =========================================================================
;;; REQUERIMIENTO 6: Informe de Distribución Temporal
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Composición funcional directa (utiliza duracion-ciclo).
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun distribucion-porcentual (t-rojo t-amarillo t-verde)
    (cond
        ((not (and (numberp t-rojo) (numberp t-amarillo) (numberp t-verde)))
            "Error: Debe ingresar valores numericos en segundos.")
        ((or (<= t-rojo 0) (<= t-amarillo 0) (<= t-verde 0))
            "Error: Los tiempos ingresados deben ser mayores a cero.")
        (T
            (list 
                (list 'ROJO (float (* (/ t-rojo (duracion-ciclo t-rojo t-amarillo t-verde)) 100)))
                (list 'VERDE (float (* (/ t-verde (duracion-ciclo t-rojo t-amarillo t-verde)) 100)))
                (list 'AMARILLO (float (* (/ t-amarillo (duracion-ciclo t-rojo t-amarillo t-verde)) 100)))
            )
        )
    )
)


;;; =========================================================================
;;; REQUERIMIENTO 7: Aseguramiento de la Calidad (QA Global)
;;; FUNCIÓN: ejecutar-qa-completo
;;; NATURALEZA: Impura (Imprime por consola utilizando format y print).
;;; =========================================================================

(defun ejecutar-qa-completo ()
    (progn
        (format t "~%--- PRUEBAS REQ 6: DISTRIBUCION TEMPORAL ---~%")
        (format t "Caso Normal (90s Rojo, 6s Amarillo, 120s Verde):~%")
        (print (distribucion-porcentual 90 6 120))
        
        (format t "~%Caso Error (Letras en vez de numeros):~%")
        (print (distribucion-porcentual 'A 6 120))
        
        'PRUEBAS-FINALIZADAS
    )
)

