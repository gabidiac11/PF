{-
    Exercitiul 2.1. Definiti un tip de date pentru arbori binari unde nodurile contin numere
ıntregi.
-}

data Arb = Frunza Integer | Nod Integer Arb Arb deriving (Show, Eq)