{- 
    Exercitiul 2.2. Scrieti o functie care verifica daca un arbore binar este arbore binar de cautare.
-}

data Arb = Frunza Integer 
         | Nod Integer Arb Arb 
         | NodGol 
         deriving (Show, Eq)

isBST :: Arb -> Bool
isBST (Frunza value) = True
isBST NodGol = True
--verificare partea stanga (nod sau funza)
isBST (Nod value (Nod leftValue next1 next2) _) | value < leftValue = False
isBST (Nod value (Frunza leftValue) _) | value < leftValue = False  
--verificare partea dreapta (nod sau funza)
isBST (Nod value _ (Nod rightValue next1 next2)) | value > rightValue = False
isBST (Nod value _ (Frunza rightValue)) | value > rightValue = False  
isBST (Nod value leftNode rightNode) = (isBST leftNode) && (isBST rightNode)