{-
    Exercitiul 3.5. Creati un fisier pe care ıl vom numi functii.hs si care va contine definitiile
    functiilor id si sumThree (definite mai sus).

    Exercitiul 3.6. Apelati din nou functiile id si sumThree care sunt acum definite ın fisierul
    functii.hs.
-}

{-
    interactiune:

    **functia id nu am reusit sa o redefinesc folosind fisierul "functii.hs", 
    banuiesc ca asta se datoreaza faptului ca era deja definita direct in terminal si are loc o eroare de ambiguitate.
    Cred ca pentru celalte functii din fisier functioneaza pentru ca operatorii restrictioneaza tipul returnat si parametrii la tipul number ceea ajuta interpretorul sa suprascrie functii existente, 
    in timp ce 'id x = x' poate fi compilat cu orice tip de parametrii?

    *Main> :t id
    id :: p -> p

    :t sumThree
    sumThree :: Num a => a -> a -> a -> a

    Prelude> :l functii
    [1 of 1] Compiling Main             ( functii.hs, interpreted )
    Ok, one module loaded.
    *Main> id "777"

    <interactive>:2:1: error:
        Ambiguous occurrence `id'
        It could refer to
        either `Prelude.id',
                imported from `Prelude' at functii.hs:1:1
                (and originally defined in `GHC.Base')
            or `Main.id', defined at functii.hs:1:1
    *Main> :load functii
    [1 of 1] Compiling Main             ( functii.hs, interpreted )
    Ok, one module loaded.
    *Main> id "a"

    <interactive>:4:1: error:
        Ambiguous occurrence `id'
        It could refer to
        either `Prelude.id',
                imported from `Prelude' at functii.hs:1:1
                (and originally defined in `GHC.Base')
            or `Main.id', defined at functii.hs:1:1
    *Main> id "a"

    <interactive>:5:1: error:
        Ambiguous occurrence `id'
        It could refer to
        either `Prelude.id',
                imported from `Prelude' at functii.hs:1:1
                (and originally defined in `GHC.Base')
            or `Main.id', defined at functii.hs:1:1
    *Main> id x = x
    *Main> id "a"
    "a"
    *Main> sumThree 1 2 3
    6
    *Main> :load functii
    [1 of 1] Compiling Main             ( functii.hs, interpreted )
    Ok, one module loaded.
    *Main> id "a"

    <interactive>:10:1: error:
        Ambiguous occurrence `id'
        It could refer to
        either `Prelude.id',
                imported from `Prelude' at functii.hs:1:1
                (and originally defined in `GHC.Base')
            or `Main.id', defined at functii.hs:1:1
    *Main> id 2

    <interactive>:11:1: error:
        Ambiguous occurrence `id'
        It could refer to
        either `Prelude.id',
                imported from `Prelude' at functii.hs:1:1
                (and originally defined in `GHC.Base')
            or `Main.id', defined at functii.hs:1:1
    *Main> id x = x
    *Main> id 3
    3
    *Main> mulThree 5 5 5
    125

    ** redeschide terminal

        GHCi, version 8.10.4: https://www.haskell.org/ghc/  :? for help
        Prelude> id "a"
        "a"
        Prelude> :l functii
        [1 of 1] Compiling Main             ( functii.hs, interpreted )
        Ok, one module loaded.
        *Main> id "b"

        <interactive>:3:1: error:
            Ambiguous occurrence `id'
            It could refer to
            either `Prelude.id',
                    imported from `Prelude' at functii.hs:1:1
                    (and originally defined in `GHC.Base')
                or `Main.id', defined at functii.hs:1:1
        *Main> :l functii
        [1 of 1] Compiling Main             ( functii.hs, interpreted )
        Ok, one module loaded.
        *Main> id "a"
        "a"
        *Main> id 4
        4
        *Main> id "a"
        "a"
        *Main> id 666
        666
        *Main> :load functii
        [1 of 1] Compiling Main             ( functii.hs, interpreted )
        Ok, one module loaded.
        *Main> id 26
        26
        *Main> id 1000
        1000
        *Main> id 'a'
        'a'
        *Main> char id x = x
        *Main> id 4
        4
        *Main> id 4000
        4000
        *Main> :t "a"
        "a" :: [Char]
        *Main> :t "ad"
        "ad" :: [Char]
        *Main> :t 'ad'

        <interactive>:1:1: error:
            * Syntax error on 'ad'
            Perhaps you intended to use TemplateHaskell or TemplateHaskellQuotes
            * In the Template Haskell quotation 'ad'
        *Main> :l functii
        [1 of 1] Compiling Main             ( functii.hs, interpreted )
        Ok, one module loaded.
        *Main> id 3

        <interactive>:20:1: error:
            Ambiguous occurrence `id'
            It could refer to
            either `Prelude.id',
                    imported from `Prelude' at functii.hs:1:1
                    (and originally defined in `GHC.Base')
                or `Main.id', defined at functii.hs:2:1
        *Main> id "4"

        <interactive>:21:1: error:
            Ambiguous occurrence `id'
            It could refer to
            either `Prelude.id',
                    imported from `Prelude' at functii.hs:1:1
                    (and originally defined in `GHC.Base')
                or `Main.id', defined at functii.hs:2:1

        *Main> :load functii
        [1 of 1] Compiling Main             ( functii.hs, interpreted )
        Ok, one module loaded.
        *Main> myMulThree 3 4 6

        <interactive>:58:1: error:
            * Variable not in scope: myMulThree :: t0 -> t1 -> t2 -> t
            * Perhaps you meant `mulThree' (line 4)
        *Main> mulThree 3 4 6
        72
        *Main>
-}