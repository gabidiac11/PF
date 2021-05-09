{-
    5 Tipul Maybe
    Mai departe vom utiliza urmatorul tip de date:

    data ErrorNat = Error
    | Val Nat
    deriving (Show)

-}


data Nat = Zero | Succ Nat deriving (Show, Eq)

add :: Nat -> Nat -> Nat
add Zero any = any
add any Zero = any
add (Succ n) (Succ m) = Succ (Succ (add n m))

mult :: Nat -> Nat -> Nat
mult Zero any = Zero
mult any Zero = Zero
mult any (Succ Zero) = any
mult any (Succ m) = add any (mult any m) 

exp2 :: Nat -> Nat -> Nat
exp2 Zero any = Zero
exp2 any Zero = (Succ Zero)
exp2 any (Succ Zero) = any
exp2 any (Succ m) = mult any (exp2 any m)

comp :: Nat -> Nat -> Bool -- "x < y"
comp Zero Zero = False
comp (Succ n) Zero = False
comp Zero (Succ n) = True
comp (Succ n) (Succ m) = comp n m

dif :: Nat -> Nat -> Nat
dif Zero Zero = Zero
dif (Succ n) Zero = Succ n
dif Zero (Succ m) = Zero
dif (Succ n) (Succ m) = dif n m

impartire :: Nat -> Nat -> Nat
impartire _ Zero  = Zero
impartire Zero _ = Zero
impartire m (Succ Zero) = m
impartire n m | ((comp n m) == True) = Zero
              | True = Succ (impartire (dif n m) m)

rest :: Nat -> Nat -> Nat
rest _ Zero = Zero
rest Zero _ = Zero
rest n m = dif n (mult (impartire n m) m)

convert :: Nat -> Int
convert Zero = 0
convert (Succ n) = 1 + (convert n)

convert' :: Int -> Nat
convert' 0 = Zero
convert' n = Succ (convert' (n - 1))

{-
    Exercitiul 5.1. Scrieti o functie care face scaderea a doua numere naturale. Functia va returna
    Error atunci cand rezultatul scaderii nu este numar natural sau Val result unde result este
    rezultatul operatiei de scadere.
-}

data ErrorNat = Error
               | Val Nat 
               deriving (Show)

dif2 :: Nat -> Nat -> ErrorNat
dif2 Zero Zero = Val Zero
dif2 (Succ n) Zero = Val (Succ n)
dif2 Zero (Succ m) = Error
dif2 (Succ n) (Succ m) = dif2 n m

{-
    Exercitiul 5.2. Scrieti o functie care face ımpartirea a doua numere naturale. Functia va
    returna Error atunci cand ımpartirea nu este definita din punct de vedere matematic sau Val
    result unde result este rezultatul operatiei de ımpartire.
-}

impartire2 :: Nat -> Nat -> ErrorNat
impartire2 _ Zero  = Error
impartire2 Zero _ = Val Zero
impartire2 m (Succ Zero) = Val m
impartire2 n m | n == m = Val (Succ Zero)
               | ((comp n m) == True) = Error
               | True = case dif2 n m of
                  Error -> Error
                  Val result -> case impartire2 result m of
                      Error -> Error
                      Val res2 -> Val (Succ res2)