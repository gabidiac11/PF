{-
    Exercitiul 3.8. Ce tip afiseazaa ghci pentru functia sumThree acum? Apelati functia peste
    argumentele 3.2, 2 si 4. Ce s-a ıntamplat?
-}

{-
    interactiune:

    *Main> sumThree 3.2 2 4
    9.2
    *Main> : :t sumThree

    <interactive>:1:1: error: parse error on input `:'
    *Main> :t sumThree
    sumThree :: Num a => a -> a -> a -> a
    *Main> sumThree 3.2 2 4
    9.2
    *Main> :t sumThree
    sumThree :: Num a => a -> a -> a -> a


    *Main> :t (sumThree 3.2 2 4)
    (sumThree 3.2 2 4) :: Fractional a => a
-}