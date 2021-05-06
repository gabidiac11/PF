{-
    2.8. parcurgeri
-}

data Arb = Nod Integer Arb Arb 
         | NodGol deriving (Show, Eq)

preOrderAux::[Integer] -> Arb -> [Integer]
preOrderAux acc (Nod val left right) = acc ++ [val] ++ (preOrderAux[] left) ++ (preOrderAux[] right)
preOrderAux acc (NodGol) = acc

preOrder::Arb -> [Integer]
preOrder nod = preOrderAux [] nod

postOrderAux::[Integer] -> Arb -> [Integer]
postOrderAux acc (Nod val left right) = acc ++ (postOrderAux[] left) ++ (postOrderAux[] right) ++ [val]
postOrderAux acc (NodGol) = acc

postOrder::Arb -> [Integer]
postOrder nod = postOrderAux [] nod



inOrderAux::[Integer] -> Arb -> [Integer]
inOrderAux acc (Nod val left right) = acc ++ (inOrderAux[] left) ++ [val] ++ (inOrderAux[] right) 
inOrderAux acc (NodGol) = acc

inOrder::Arb -> [Integer]
inOrder nod = inOrderAux [] nod