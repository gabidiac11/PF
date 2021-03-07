{- 
    Exercitiul 2.4. Scrieti o functie care insereaza o valoare de tip ıntreg ıntr-un arbore binar de
cautare.

-}

data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

insert :: Arb -> Integer -> Arb
insert NodGol valueToInsert = (Nod valueToInsert NodGol NodGol)
--frunza se transforma in nod iar valoarea inserata devine frunza (stanga sau dreapta dupa caz)
insert (Nod value NodGol NodGol) valueToInsert | valueToInsert > value = (Nod value NodGol (Nod valueToInsert NodGol NodGol))
insert (Nod value NodGol NodGol) valueToInsert | valueToInsert <= value = (Nod value (Nod valueToInsert NodGol NodGol) NodGol)
--
insert (Nod value left right) valueToInsert | (>) valueToInsert value  = Nod value left (insert right valueToInsert)
insert (Nod value left right) valueToInsert | (<=) valueToInsert value  = Nod value (insert left valueToInsert) right
