{-
    Exercitiul 2.5. Utilizati :t pentru a afla tipurile expresiilor: 22 + 3(+). Cereti profesorului
    de laborator sa va explice tipurile afisate.
-} 

:t 2
:t 2 + 3
:t (+)

Prelude> :t 2
2 :: Num p => p

Prelude> :t 2 + 3
2 + 3 :: Num a => a

Prelude> :t (+)
(+) :: Num a => a -> a -> a