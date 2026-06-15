;;; =========================================================================
;;; REQUERIMIENTO 1: Estados de Transición
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Validación y construcción funcional de resultados.
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun transicion (color-actual cambiar-a)
 (if (member cambiar-a '(rojo amarillo verde))
     (list color-actual
           (concatenate 'string
                        "cambiar-a-"
                        (symbol-name cambiar-a)))
     (list color-actual 'accion-por-defecto)))


;;; =========================================================================
;;; REQUERIMIENTO 2: Temporizador Automático
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Cálculo modular sobre un ciclo semafórico completo.
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun timer (tiempo)
 (let ((instante (mod tiempo 216)))
  (cond
   ((< instante 90) 'rojo)
   ((< instante 96) 'amarillo)
   (T 'verde))))

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
  (truncate (/ (* minutos 60) 
               (duracion-ciclo duracion-rojo duracion-amarillo duracion-verde)))
  )

;;; =========================================================================
;;; REQUERIMIENTO 6: Informe de Distribución Temporal
;;; NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
;;; ESTRATEGIA: Composición funcional (utiliza duracion-ciclo).
;;; IMPACTO: No destructiva (No modifica el estado global).
;;; =========================================================================

(defun distribucion-porcentual (t-rojo t-amarillo t-verde)
    (let ((total (duracion-ciclo t-rojo t-amarillo t-verde)))
        (list 
            (list 'ROJO (* (/ t-rojo total) 100))
            (list 'VERDE (* (/ t-verde total) 100))
            (list 'AMARILLO (* (/ t-amarillo total) 100))
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

-- =========================================================================
-- REQUERIMIENTO 1 haskell: Estados de Transición
-- NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
-- ESTRATEGIA: Validación y construcción funcional de resultados.
-- IMPACTO: No destructiva (No modifica el estado global).
-- =========================================================================

data Color = Rojo | Amarillo | Verde
    deriving (Show, Eq)

data Estado = EnRojo | EnAmarillo | EnVerde
    deriving (Show, Eq)

transicion :: Estado -> Color -> (Estado, String)
transicion colorActual cambiarA =
    (colorActual, "cambiar-a-" ++ show cambiarA)

    -- =========================================================================
-- REQUERIMIENTO 2 haskell: Temporizador Automático
-- NATURALEZA: Pura (Su salida depende exclusivamente de los argumentos).
-- ESTRATEGIA: Cálculo modular sobre un ciclo semafórico completo.
-- IMPACTO: No destructiva (No modifica el estado global).
-- =========================================================================

timer :: Int -> Color
timer tiempo
    | instante < 90 = Rojo
    | instante < 96 = Amarillo
    | otherwise     = Verde
  where
    instante = tiempo `mod` 216