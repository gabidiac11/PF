-- Exercit, iul 3.12. Definit, i o funct, ie recursiv˘a care returneaz˘a elementul de pe pozit, ia dat˘a ca
-- argument din s, irul lui Fibonacci.

{-
ia ca argumente n, indexul curent, indexul cautat
-}
myFib :: Int -> Int -> Int -> Int
myFib x cIndex searchIndex = if x <= 0 then  0 
          else if x == 1 then 1
                else (+) (mySum (x - 2) cIndex +  ) (mySum (x - 1))

myFib :: Int -> Int -> Int
myFib x = if x <= 0 then  0 
          else if x == 1 then 1
                else (+) (mySum (x - 2)) (mySum (x - 1))

-- interactiune:
{- 

-}

-- calculeaza (n + (n-1)+(n-2)...(n-n))