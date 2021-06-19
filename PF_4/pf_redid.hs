
{-
    Exercitiul 2.1. Scrieti o functie care are tipul (Int -> Int) -> Int -> Int -> Int si aplica
functia de tipul Int -> Int tuturor valorilor cuprinse ıntre doua numere ıntregi date ca argument. Functia va returna suma valorilor obtinute.
-}

-- receives a function, a start value, a upper limit value
sumOfIntervalAux :: (Int -> Int) -> Int -> Int -> Int
sumOfIntervalAux f start limit = if start <= limit then (f start) + (sumOfIntervalAux f (start + 1) limit) 
                                else 0 

sumOfInterval :: (Int -> Int) -> Int -> Int -> Int
sumOfInterval f n m = sumOfIntervalAux f n m


{-
    Exercitiul 2.2. Scrieti o functie care returneaza compunerea a doua functii.
-}
comp' :: (t1 -> t2) -> (t3 -> t1) -> (t3 -> t2) 
comp' f g = f . g

{-
    Exercitiul 2.3. Scrieti o functie care primeste ca parametru o lista de functii si returneaza
compunerea lor.
-}

compList :: [b -> b] -> (b -> b)
compList (hd:tl) = if (length tl) == 0 
                    then hd
                    else hd . (compList tl)

{-
    Exercitiul 2.4. Scrieti o functie care calculeaza suma elementelor dintr-o lista. Utilizati tipul
de date pentru liste predefinit ın libraria standard.
-}

reduce' :: (a -> b -> b) -> [a] -> b -> b 
reduce' f (hd:tl) init = reduce' f tl (f hd init)
reduce' _ _ init = init

sumList :: [Int] -> Int
sumList list = reduce' (\x y -> x + y) list 0


{-
    Exercitiul 2.5. Scrieti o functie care aplica o functie fiecarui element al unei liste si returneaza
lista obtinuta.
-}

applyFunToListItems :: (a -> b) -> [a] -> [b]
applyFunToListItems f (hd:tl) = [(f hd)] ++ (applyFunToListItems f tl)
applyFunToListItems _ _ = []

{-
    Exercitiul 2.6. Scrieti o functie care va returna lista elementelor pentru care o functie de tipul
a -> Bool returneaza True.
-}

filter' :: (a -> Bool) -> [a] -> [a]
filter' f (hd:tl) = if f hd
                        then [hd] ++ (filter' f tl)
                        else (filter' f tl)
filter' _ _ = []

{-
    *Main Debug.Trace> filter' (\x -> x > 100) [3]
    []
    *Main Debug.Trace> filter' (\x -> x > 100) [3, (3*1000)]
    [3000]
-}

{-
    Exercitiul 2.7. Scrieti o functie care implementeaza comportamentul fold (foldrfoldl)
pe lista definita ın laboratorul anterior.
-}

foldl' :: (a -> b -> b) -> b -> [a] -> b
foldl' f b (hd:tl) = foldl' f (f hd b) tl 
foldl' f b _ = b

{-
    Exercitiul 2.8. Scrieti trei functii care primesc ca parametri de intrare 
    radacina unui arbore binar de cautare si o functie (f) care va fi aplicata fiecarui nod ın maniera preordine,
postordine, inordine. 
    Functiile vor returna o lista cu rezultatele aplicarii functiei f. 
    Utilizati structura de arbore binar de cautare definita ın laboratorul anterior.
-}

data Arb = Nod Int Arb Arb 
        | NodGol 
        deriving (Show, Eq)
    
inordine :: (Arb -> b) -> Arb -> [b]
inordine f (Nod num left right) = (inordine f left) ++ [f (Nod num left right)] ++ (inordine f right)
inordine f NodGol = []

addToArbElem :: Int -> Arb -> Int
addToArbElem addVal (Nod num left right) = num + addVal
addToArbElem addVal NodGol = addVal

exampleTree = (Nod 6 
        (Nod 4 
            (Nod 3 
                NodGol
                NodGol
            )
            (Nod 5 NodGol NodGol)
        ) 
    
        (Nod 9 
            (Nod 8 NodGol NodGol)
            (Nod 10 NodGol NodGol)
        )
    )

{-
    Exercitiul 2.9. Pornind de la exercitiul anterior scrieti o singura functie de parcurgere pentru
un arbore binar de cautare care sa primeasca strategia de parcurgere (inordine, postordine,
preordine, orice-ordine) sub forma unei functii.

-}

passArb :: ((Arb -> b) -> Arb -> [b]) -> (Arb -> b) -> Arb -> [b]
passArb visitator f arb = (visitator f arb)
{-

*Main> passArb inordine (addToArbElem 0) exampleTree
[3,4,5,6,8,9,10]
-}
{-
    3 Sortare prin comparare
    Exercitiul 3.1. Implementati un algoritm de sortare prin comparare care primeste ca argumente:
1. o lista :: [a] de elemente de ordonat;
2. o functie :: a -> a -> Bool de comparare a doua elemente.
Puteti alege ce algoritm de sortare doriti. Nu va concentrati pe eficientta. Alegeti semnificatia
functiei de comparare ıntr-un mod rezonabil.
-}

qs :: Ord a => [a] -> [a]
qs (hd:tl) = (qs (filter' (<= hd) tl)) ++ [hd] ++ (qs (filter' (> hd) tl))
qs [] = []

{-
    Exercitiul 3.2. Implementati http://hackage.haskell.org/package/base-4.12.0.0/docs/Data-Either.html.
-}

data Either' a b = Right' a 
            | Left' b
            deriving (Ord, Eq)
            

{-
    Exercitiul 3.3. Implementati arborele de cautare binar discutat la laboratorul anterior astfel
ıncat sa poata contine orice tip de date (care face parte din clasa Ord).
-}

data Arbb a = NodGol' | NodDoi a (Arbb a) (Arbb a) | Franza a | NodSt a (Arbb a) | NodDr a (Arbb a) deriving (Eq, Ord)

{-
    Exercitiul 3.4. Scrieti cate o functie care rezolva problema cautarii (secventiala binara) ın
mod clasic si utilizand foldr/foldl.
-}

-- fl b -> a -> b 
searchFl :: [Int] -> Int -> Bool
searchFl list searchVal = foldl (sf searchVal) False list

sf :: Int -> Bool -> Int -> Bool
sf x soFarBool y = soFarBool || x == y

searchFr :: [Int] -> Int -> Bool
searchFr list searchValue = foldr (sfr searchValue) False list

-- fr invers a -> b -> b
sfr :: Int -> Int -> Bool -> Bool
sfr x y soFarBool = soFarBool || x == y
