{-
    5. implementati algoritmi pentru calculul celui de-al n-lea numar Fibonacci.
-}

fibo :: Integer -> Integer
fibo x | x <= 0 = 0
fibo 1 = 0
fibo 2 = 1
fibo x = (+) (fibo (x - 1)) (fibo (x - 2))

-- Implementati varianta cu acumulatori:

fiboaux :: Integer -> Integer -> Integer -> Integer
fiboaux 0 a _ = a
fiboaux n a b = fiboaux (n - 1) (a + b) (a)

-- a si b sunt doua numere Fibonacci consecutive

fibo' :: Integer -> Integer
fibo' n = fiboaux n 0 1

{-
    Implementati varianta care functioneaza ın timp O(log(n)).
    Folositi un rationament ecuational pentru a arata ca fibo si fibo’ sunt echivalente
    functional.
-}

fiboLognAux :: Integer -> Integer ->  Integer -> Integer -> Integer -> Integer
fiboLognAux i n a b c | i >= n = c
fiboLognAux i n a b c = fiboLognAux (i + 1) n b c (b + c)

fiboLogn :: Integer -> Integer
fiboLogn 0 = 0
fiboLogn 1 = 0
fiboLogn 2 = 1
fiboLogn n = fiboLognAux 3 n 0 1 1