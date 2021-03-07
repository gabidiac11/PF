{-
    Exercitiul 2.5. Scrieti functii care calculeaza maximul/minimul dintr-un ABC (arbore?) (alegeti un
comportament rezonabil pentru cazul ın care ABC-ul nu are elemente).
-}


data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

minim :: Arb -> Integer
minim NodGol = 0
minim (Nod valoare NodGol NodGol) = valoare
minim (Nod valoare NodGol right) = valoare
minim (Nod valoare left _) = minim left 

maxim :: Arb -> Integer
maxim NodGol = 0
maxim (Nod valoare NodGol NodGol) = valoare
maxim (Nod valoare left NodGol) = valoare
maxim (Nod valoare _ right) = maxim right 

