{-
    Exercitiul 2.7. Scrieti o functie care sterge (o instanta) a unei valori de tip ıntreg dintr-un
arbore binar de cautare. Veti folosi probabil maxim si removeMax ca functii ajutatoare.
-}

data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

remove :: Arb -> Integer -> Arb
remove NodGol searchValue = NodGol
remove (Nod value NodGol NodGol) searchValue | value == searchValue = NodGol

remove (Nod value (Nod value1 left1 right1) (Nod value2 left2 right2)) searchValue | value == searchValue = Nod value1 left1  
remove (Nod value left right) = (Nod value left (remove right)) 
