{-
    Asa cum era de asteptat ın Haskell putem defini functii recursive. 
    Functia de mai jos calculeaza pentru un numar dat suma numerelor naturale pana la acel numar. 
    In cazul ın care argumentul este un numar negativ, functia va returna valoarea 0.
-}
    mySum :: Int -> Int
    mySum x = if x <= 0 then 0 else x + mySum (x - 1)
{-
    Exercitiul 3.11. Testati functia mySum ın ghci.
-}

-- interactiune:
{- 
    *Main> :l pf1_exercitiul3_11
    [1 of 1] Compiling Main             ( pf1_exercitiul3_11.hs, interpreted )
    Ok, one module loaded.
    *Main> mySum -3

    <interactive>:49:1: error:
        * No instance for (Num (Int -> Int)) arising from a use of `-'
            (maybe you haven't applied a function to enough arguments?)
        * In the expression: mySum - 3
        In an equation for `it': it = mySum - 3
    *Main>
    *Main> mySum (-3)
    0
    *Main> mySum 30
    465
    *Main> mySum 300
    45150
    *Main> mySum 300000000
    *** Exception: stack overflow
    *Main>
-}