{-
      Exercitiul 3.12. Definiti o functie recursiva care returneaza elementul de pe pozitia data ca
      argument din sirul lui Fibonacci.
-}

myFib :: Int -> Int
myFib x  = if x <= 0 then  0 
          else if x == 1 then 1
                else (+) (myFib (x - 2)) (myFib (x - 1))

{- 
      interactiune:

      *Main> :l pf1_exercitiul3_12
      [1 of 1] Compiling Main             ( pf1_exercitiul3_12.hs, interpreted )
      Ok, one module loaded.
      *Main> myFib 7
      13
      *Main> myFib 9
      34
      *Main> myFib (-0)
      0
      *Main> myFib (-099)
      0
      *Main> myFib (-99)
      0
      *Main> myFib (99)
      Interrupted.
      *Main>
-}