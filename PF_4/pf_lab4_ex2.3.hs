{-
    Exercitiul 2.2. Scrieti o functie care returneaza compunerea a doua functii.
-}

test :: Int -> Int
test x = x * 2

compunere f g = \x -> f (g x)