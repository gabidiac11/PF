-- Exercitiul 3.2. Scrieti functia de mai sus ın ghci si apelati functia.
-- Functia care calculeaza suma a trei numere se poate defini astfel:
sumThree x y z = x + y + z

{- interactiune:

****exercitiul a fost rezolvat inainte de laborator, dar m-am gandit sa revin asupra exercitiului si sa-l testez

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