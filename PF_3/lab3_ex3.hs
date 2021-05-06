{-
    3.Arbori AVL

    Scrieti o functie care calculeaza ınaltimea unui arbore:
    height :: Arb -> Int

    Scrieti o functie care testeaza daca un ABC este AVL:
    isAVL :: Arb -> Bool

    Scrieti functii care realizeaza rotatii simple la stanga/dreapta:
    rotateLeft :: Arb -> Arb
    rotateRight :: Arb -> Arb

    Scrieti functii care realizeaza rotatii duble la stanga/dreapta:
    doubleRotateLeft :: Arb -> Arb
    doubleRotateRight :: Arb -> Arb

    Scrieti o functie care reechilibreaza un nod:
    echilibrare :: Arb -> Arb

    Scrieti o functie care insereaza un element ıntr-un AVL (atentie la reechilibrare dupa inserarea propriu-zisa).
    insertAVL :: Arb -> Integer -> Arb

    Scrieti o functie care sterge un element dintr-un AVL (atentie la reechilibrare dupa stergerea
    propriu-zisa).
    removeAVL :: Arb -> Integer -> Arb
    
-}

data Arb = Nod Integer Arb Arb 
         | NodGol deriving (Show, Eq)



heightArb :: Arb -> Integer
heightArb NodGol = 0
heightArb (Nod val NodGol NodGol) = 0
heightArb (Nod val left right) = (+) 1 (max (heightArb left) (heightArb right))

minHeightArb :: Arb -> Integer
minHeightArb NodGol = 0
minHeightArb (Nod val NodGol NodGol) = 0
minHeightArb (Nod val left right) = (+) 1 (min (heightArb left) (heightArb right))

isAvl :: Arb -> Bool
isAVL NodGol = True
isAvl (Nod val left right) = (abs ((heightArb left) - (heightArb right))) <= 1
