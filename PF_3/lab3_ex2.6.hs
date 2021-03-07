{-
    Exercitiul 2.6. Scrieti o functie care sterge (o instanta a) cel mai mare element.
-}

data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

removeMax :: Arb -> Arb
removeMax NodGol = NodGol
removeMax (Nod valoare NodGol NodGol) = NodGol
removeMax (Nod valoare left NodGol) = left
removeMax (Nod valoare left right) = (Nod valoare left (removeMax right)) 