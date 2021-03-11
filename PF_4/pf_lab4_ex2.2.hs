{-
    Exercitiul 2.1. Scrieti o functie care are tipul (Int -> Int) -> Int -> Int -> Int si aplica
functia de tipul Int -> Int tuturor valorilor cuprinse ıntre doua numere ıntregi date ca argument. Functia va returna suma valorilor obtinute.
-}


applyToRange :: (Int -> Int) -> Int -> Int -> Int
applyToRange f min max | min >= max = (f min)
applyToRange f min max = (f min) + (f max) + (applyToRange f (min + 1) (max - 1));