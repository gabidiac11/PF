{-
    id x = x

    Exercitiul 3.2. Scrieti functia de mai sus ın ghci si apelati functia.
-}

{-
Interactiune:

    Prelude> id x = x
    Prelude> x

    <interactive>:32:1: error: Variable not in scope: x
    Prelude> id

    <interactive>:33:1: error:
        * No instance for (Show (p0 -> p0)) arising from a use of `print'
            (maybe you haven't applied a function to enough arguments?)
        * In a stmt of an interactive GHCi command: print it
    Prelude> id "a"
    "a"
-}


{-
    Functia care calculeaza suma a trei numere se poate defini astfel:
-}
    sumThree x y z = x + y + z
{-
    Exercitiul 3.3. Scrieti functia de mai sus ın ghcisi apelati functia
-}

{- 
    interactiune (int timpul laboratorului):
    
    pf1_exercitiul3_2_si_3_3.hs:6:1: error:
        Parse error: module header, import declaration
        or top-level declaration expected.
    |
    6 | sumThree 6 2 3 -- 11
    | ^^^^^^^^^^^^^^
    Failed, no modules loaded.
    Prelude> :load pf1_exercitiul3_2_si_3_3   
    [1 of 1] Compiling Main             ( pf1_exercitiul3_2_si_3_3.hs, interpreted )

    pf1_exercitiul3_2_si_3_3.hs:6:1: error:
        Parse error: module header, import declaration
        or top-level declaration expected.
    |
    6 | sumThree 6 2 3 -- 11
    | ^^^^^^^^^^^^^^
    Failed, no modules loaded.
    Prelude> :load pf1_exercitiul3_2_si_3_3
    [1 of 1] Compiling Main             ( pf1_exercitiul3_2_si_3_3.hs, interpreted )
    Ok, one module loaded.
    *Main> sumThree 6 2 3
    11
    *Main>

-}

{- 
    interactiune (retestare):
    
    Prelude> :load pf1_exercitiul3_2_si_3_3
    [1 of 1] Compiling Main             ( pf1_exercitiul3_2_si_3_3.hs, interpreted )
    Ok, one module loaded.
    *Main> sumThree 7 8 9
    24
-}