{-
      Exercitiul 3.13. Definiti o functie recursiva care returneaza cel mai mare divizor comun a doua numere
-}

myMmmdc :: Int -> Int -> Int
myMmmdc x y = if not ((x `mod` y) == 0) then myMmmdc y (x `mod` y)
          else y

-- interactiune:
{- 
      
      ***am avut probleme cu modulo (am cautat solutia pe internet ca fiind `mod`) si cu operatorul !=, 
      despre care mi-am dat seama ca-l pot inlocui cu not

      :load pf1_exercitiul3_13

      *Main> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )
      Ok, one module loaded.
      *Main> myMmmdc 10 5

      <interactive>:19:1: error:
      Variable not in scope: myMmmdc :: t0 -> t1 -> t
      *Main> myMmmdc 10 5

      <interactive>:20:1: error:
      Variable not in scope: myMmmdc :: t0 -> t1 -> t
      *Main> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )
      Ok, one module loaded.
      *Main> myMmmdc 10 5

      <interactive>:22:1: error:
      Variable not in scope: myMmmdc :: t0 -> t1 -> t
      *Main> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:20: error:
      Variable not in scope: (%) :: Int -> Int -> t0
      |
      8 | myMmmdc x y = if x % y != 0 then (myMmmdc y (x % y) )
      |                    ^

      pf1_exercitiul3_13.hs:8:24: error:
      * Variable not in scope: (!=) :: t0 -> t1 -> Bool
      * Perhaps you meant one of these:
            `>=' (imported from Prelude), `==' (imported from Prelude),
            `/=' (imported from Prelude)
      |
      8 | myMmmdc x y = if x % y != 0 then (myMmmdc y (x % y) )
      |                        ^^

      pf1_exercitiul3_13.hs:8:48: error:
      Variable not in scope: (%) :: Int -> Int -> Int
      |
      8 | myMmmdc x y = if x % y != 0 then (myMmmdc y (x % y) )
      |                                                ^
      Failed, no modules loaded.
      Prelude> 
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:20: error:
      Variable not in scope: (%) :: Int -> Int -> t0
      |
      8 | myMmmdc x y = if x % y != 0 then myMmmdc y (x % y)
      |                    ^

      pf1_exercitiul3_13.hs:8:24: error:
      * Variable not in scope: (!=) :: t0 -> t1 -> Bool
      * Perhaps you meant one of these:
            `>=' (imported from Prelude), `==' (imported from Prelude),
            `/=' (imported from Prelude)
      |
      8 | myMmmdc x y = if x % y != 0 then myMmmdc y (x % y)
      |                        ^^

      pf1_exercitiul3_13.hs:8:47: error:
      Variable not in scope: (%) :: Int -> Int -> Int
      |
      8 | myMmmdc x y = if x % y != 0 then myMmmdc y (x % y)
      |                                               ^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:28: error:
      * Variable not in scope: (!=) :: Int -> t0 -> Bool
      * Perhaps you meant one of these:
            `>=' (imported from Prelude), `==' (imported from Prelude),
            `/=' (imported from Prelude)
      |
      8 | myMmmdc x y = if x `mod` y != 0 then myMmmdc y (x `mod` y)
      |                            ^^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:18: error:
      * Couldn't match expected type `Bool' with actual type `Int'
      * In the expression: x `mod` y <> 0
            In the expression:
            if x `mod` y <> 0 then myMmmdc y (x `mod` y) else y
            In an equation for `myMmmdc':
            myMmmdc x y = if x `mod` y <> 0 then myMmmdc y (x `mod` y) else y
      |
      8 | myMmmdc x y = if x `mod` y <> 0 then myMmmdc y (x `mod` y)
      |                  ^^^^^^^^^^^^^^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:29: error: parse error on input `<>'
      |
      8 | myMmmdc x y = if x `mod` y `<>` 0 then myMmmdc y (x `mod` y)
      |                             ^^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:21: error:
      Variable not in scope: (%) :: Int -> Int -> t0
      |
      8 | myMmmdc x y = if (x % y) != 0 then myMmmdc y (x % y)
      |                     ^

      pf1_exercitiul3_13.hs:8:26: error:
      * Variable not in scope: (!=) :: t0 -> t1 -> Bool
      * Perhaps you meant one of these:
            `>=' (imported from Prelude), `==' (imported from Prelude),
            `/=' (imported from Prelude)
      |
      8 | myMmmdc x y = if (x % y) != 0 then myMmmdc y (x % y)
      |                          ^^

      pf1_exercitiul3_13.hs:8:49: error:
      Variable not in scope: (%) :: Int -> Int -> Int
      |
      8 | myMmmdc x y = if (x % y) != 0 then myMmmdc y (x % y)
      |                                                 ^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )

      pf1_exercitiul3_13.hs:8:30: error:
      * Variable not in scope: (!=) :: Int -> t0 -> Bool
      * Perhaps you meant one of these:
            `>=' (imported from Prelude), `==' (imported from Prelude),
            `/=' (imported from Prelude)
      |
      8 | myMmmdc x y = if (x `mod` y) != 0 then myMmmdc y (x `mod` y)
      |                              ^^
      Failed, no modules loaded.
      Prelude> :load pf1_exercitiul3_13
      [1 of 1] Compiling Main             ( pf1_exercitiul3_13.hs, interpreted )
      Ok, one module loaded.



      *Main> myMmmdc 10 5
      5
      *Main> 20 5

      <interactive>:33:1: error:
      * Non type-variable argument in the constraint: Num (t1 -> t2)
            (Use FlexibleContexts to permit this)
      * When checking the inferred type
            it :: forall t1 t2. (Num t1, Num (t1 -> t2)) => t2
      *Main> myMmmdc 20 5
      5
      *Main> myMmmdc 20 30
      10
      *Main>

-}