{-
    Mai departedefinim o functie care calculeaza maximul dintre doua numere:
-}
    myMax :: Int -> Int -> Int
    myMax x y = if x <= y then y else x
{-
    Exercitiul 3.9. Ce tip are functia myMax? Testati functia ın ghci.
-}
{-
    tipul returnat este Int asa cum este definit: myMax :: Int -> Int -> Int (cu 2 parametrii Int)
-}
{-
    interactiune:

    *Main> :l pf1_exercitiul3_9
    [1 of 1] Compiling Main             ( pf1_exercitiul3_9.hs, interpreted )
    Ok, one module loaded.
    *Main> :t myMax
    myMax :: Int -> Int -> Int
    *Main> myMax 9 8 3

    <interactive>:43:1: error:
        * Couldn't match expected type `t0 -> t' with actual type `Int'
        * The function `myMax' is applied to three arguments,
        but its type `Int -> Int -> Int' has only two
        In the expression: myMax 9 8 3
        In an equation for `it': it = myMax 9 8 3
        * Relevant bindings include it :: t (bound at <interactive>:43:1)
    *Main> myMax 9 8
    9
-}