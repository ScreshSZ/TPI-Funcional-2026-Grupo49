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