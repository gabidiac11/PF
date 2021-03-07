{- 
    Exercitiul 2.2. Scrieti o functie care verifica daca un arbore binar este arbore binar de cautare.
-}

-- am renuntat la "Frunza Integer", pentru ca (Nod value NodGol NodGol) e interpretat ca frunza
data Arb = Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

isBST :: Arb -> Bool
isBST NodGol = True
--verificare partea stanga
isBST (Nod value (Nod leftValue next1 next2) _ ) | value < leftValue = False
--verificare partea dreapta (nod sau funza)
isBST (Nod value _ (Nod rightValue next1 next2)) | value > rightValue = False
isBST (Nod value leftNode rightNode) = (isBST leftNode) && (isBST rightNode)