{-
    Exercitiul 3.10. Definiti o functie care calculeaza maximul dintre 3 numere ıntregi si 
    testati functia ın ghci.
-}


-- am extins lista de parametrii si structura de control a functiei myMax
myMaxThree :: Int -> Int -> Int -> Int
myMaxThree x y z =  if x <= y then 
                        if y >= z then y 
                        else z
                    else if x >= z then x 
                        else z

{-
    interactiune:

    *Main> :l pf1_exercitiul3_10
    [1 of 1] Compiling Main             ( pf1_exercitiul3_10.hs, interpreted )
    Ok, one module loaded.
    *Main> myMaxThree 5 9 3
    9
    *Main> :t myMaxThree
    myMaxThree :: Int -> Int -> Int -> Int
    *Main>
-}