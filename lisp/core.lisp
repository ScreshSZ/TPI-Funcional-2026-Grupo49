//requerimiento 1

(defun transicion (color-actual cambiar-a)
 (if (equal color-actual 'en-rojo)
   (list color-actual "cambiar-a-verde")))
;requerimiento 5
 (defun ciclos-por-tiempo-v2 (minutos)
  (let ((duracion-ciclo 3.6))
    (if (< minutos duracion-ciclo)
        0
        (+ 1 (ciclos-por-tiempo-v2 (- minutos duracion-ciclo))))))