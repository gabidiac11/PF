{-
        Exercitiul 2.3. Scrieti o functie care primeste ca parametru o lista de functii si returneaza
    compunerea lor.
-}

test :: Int -> Int
test x = x * 2

compunere f g = \x -> f (g x)

compunereMultipla [] = 
compunereMultipla (x:xs) = compunere f g
compunereMultipla [f, g]
