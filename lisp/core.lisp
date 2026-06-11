//requerimiento 1

(defun transicion (color-actual cambiar-a)
 (if (equal color-actual 'en-rojo)
   (list color-actual "cambiar-a-verde")))
;requerimiento 5
(defun ciclos-por-tiempo(minutos)
	(/ minutos 3.6))