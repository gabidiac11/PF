{-
    2. test de primalitate: isPrime :: Integer -> Bool;
    Folositi o functie auxiliara
    hasDivisors 
    astfel ıncat hasDivisors n a b testeaza daca numarul natural n are divizori intre numerele natural a si b.
-}

hasDivisors :: Integer -> Integer -> Integer -> Bool
hasDivisors n a b | a > b = False
hasDivisors n a b | n `mod` a == 0 = True
hasDivisors n a b = hasDivisors n (a + 1) b

isPrime :: Integer -> Bool
isPrime n | n == 1 = False
isPrime n | n == 2 = True
isPrime n = not (hasDivisors n  2 ( floor (sqrt (fromInteger n) ) ))