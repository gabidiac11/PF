{-
    Exercitiul 3.7. Ce tip are functia sumThree? Discutati cu profesorul de laborator cum a fost
    inferat tipul functiei. Apelati functia peste argumentele 3.2, 2 si 4.
-}

:load functii
:t sumThree -- sumThree :: Num a => a -> a -> a -> a 

{-
    interactiune:

    *Main> :load functii
    [1 of 1] Compiling Main             ( functii.hs, interpreted )
    Ok, one module loaded.
    *Main> :t sumThree
    sumThree :: Num a => a -> a -> a -> a
    *Main> sumThree 3.2 2 4
    9.2
-}