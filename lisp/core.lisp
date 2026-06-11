//requerimiento 1

(defun transicion (color-actual cambiar-a)
 (if (equal color-actual 'en-rojo)
   (list color-actual "cambiar-a-verde")))
;requerimiento 5
 (defun ciclos-por-tiempo-aux (minutos contador)
  (let ((duracion-ciclo 3.6))
    (if (< minutos duracion-ciclo)
        contador
        (ciclos-por-tiempo-aux (- minutos duracion-ciclo) (+ contador 1)))))

(defun ciclos-por-tiempo (minutos)
  (ciclos-por-tiempo-aux minutos 0))