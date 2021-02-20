{- 
    Exercitiul 3.4. Scrieti o functie care calculeaza produsul a trei numere si testati functia ın ghci.
    Deoarece este mai dificil sa editam functii ın linia de comandapreferam sa scriem codul ın
    fisiere. Un fisier Haskell are de obicei extensia .hs
-}

mulThree x y z = x * y * z

{-
    interactiune:

    pf1_exercitiul3_4.hs:7:1: error:
    Not in scope: data constructor `Num'
    Perhaps you meant variable `sum' (imported from Prelude)
    |
    7 | Num mulThree x y z = x * y * z
    | ^^^
    Failed, no modules loaded.
    Prelude> :l pf1_exercitiul3_4
    [1 of 1] Compiling Main             ( pf1_exercitiul3_4.hs, interpreted )
    Ok, one module loaded.
    *Main> mulThree 3 3 3
    27
-}