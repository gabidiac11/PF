{- 
    Exercitiul 2.3. Scrieti o functie care cauta o valoare de tip ıntreg ıntr-un arbore binar de
cautare.
-}

data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

search :: Arb -> Integer -> Bool
search NodGol searchValue = False
search (Nod value NodGol NodGol) searchValue = (==) value searchValue
search (Nod value left right) searchValue | (==) value searchValue = True
search (Nod value left right) searchValue | (>) searchValue value = search right searchValue
search (Nod value left right) searchValue = search left searchValue
