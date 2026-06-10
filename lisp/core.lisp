(defun duracion-ciclo (duracion-rojo duracion-amarillo duracion-verde)

    (+ duracion-rojo duracion-amarillo duracion-verde)

)

(defun recomendacion (duracion)

    (cond
        ((< duracion 35) "demasiado-corto")
        ((> duracion 150) "demasiado-largo")
        (y "optimo")
    )
    
)
