//requerimiento 1

(defun transicion (color-actual cambiar-a)
 (if (equal color-actual 'en-rojo)
   (list color-actual "cambiar-a-verde")))
