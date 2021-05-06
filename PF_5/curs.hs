-- Clase de tipuri (typeclasses).
-- Eq, Show, ...

-- Clasa de tipuri = multime de tipuri

-- Clasa Eq este clasa tuturor tipurilor de date
-- ale caror valori pot fi comparate.

-- Un tip "a" face parte dintr-o clasa de tipuri "b"
-- Un tip "a" este o instanta a clasei de tipuri "b"

data Nat = Zero | Succ Nat deriving Ord
--         ^^^^   ^^^^
--       constructori (de valori)

-- 3 va fi reprezentat ca Succ (Succ (Succ Zero))

three = Succ (Succ (Succ Zero))

two = Succ (Succ Zero)


-- my-notes -> aici e nevoie doar == sau doar de /= (diferit) pentru ca asta sa functioneze
{-
{-# MINIMAL (==) | (/=) #-}

-}
instance Eq Nat where
  (==) Zero Zero = True
  (==) Zero (Succ _) = False
  (==) (Succ _) Zero = False
  (==) (Succ x) (Succ y) = (==) x y
  (/=) Zero Zero = False
  (/=) (Succ _) Zero = True
  (/=) Zero (Succ _) = True
  (/=) (Succ x) (Succ y) = (/=) x y

-- my-notes -> aici incerc sa mi definesc propriul meu egal
class MyEq a where
  equals :: a -> a -> Bool
  notEquals :: a -> a -> Bool
  equals x y = not (notEquals x y)
  notEquals x y = not (equals x y)


instance MyEq Nat where
  equals Zero Zero = True
  equals Zero (Succ _) = False
  equals (Succ _) Zero = False
  equals (Succ x) (Succ y) = equals x y
  -- notEquals Zero Zero = False
  -- notEquals (Succ _) Zero = True
  -- notEquals Zero (Succ _) = True
  -- notEquals (Succ x) (Succ y) = notEquals x y

data Z = Pos Nat | Neg Nat

zero1 = Pos Zero
zero2 = Neg Zero

instance Eq Z where
  (==) (Pos x) (Pos y) = (==) x y
  (==) (Neg x) (Neg y) = (==) x y
  (==) (Pos x) (Neg y) = (x == Zero) && (y == Zero)
  (==) (Neg x) (Pos y) = (x == Zero) && (y == Zero)

data Punct2D = Punct Float Float deriving Show

p1 = Punct 0.1 0.1
p2 = Punct 0.09999999 0.1

{-
    AS PREFERA SA LE APROXIMEZ ATUNCI CAND folosesc egalitate -> deci definesc o egalitate custom
-}
instance Eq Punct2D where
  (==) (Punct x1 y1) (Punct x2 y2) = (abs (x1 - x2) <= 0.01) && (abs (y1 - y2) <= 0.01)

data Dow = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Eq, Show, Read, Ord, Bounded)


{-

  ma ajuta sa printez tipurile de date cum vreau eu
-}

-- instance Show Dow where
--   show Mon = "Luni"
--   show Tue = "Marti"
--   show Wed = "Miercuri"
--   show Thu = "Joi"
--   show Fri = "Vineri"
--   show Sat = "Sambata"
--   show Sun = "Duminica"


-- Show = clasa tipurilor ale caror valori pot fi transformate in String
{-
    numai astea 3 sunt de ajuns ca sa functioneze show la nivel minimal
        showsPrec :: Int -> a -> ShowS
        show :: a -> String
        showList :: [a] -> ShowS
        {-# MINIMAL showsPrec | show #-}
-}
-- Read = clasa tipurilor ale caror valori pot fi "citite" din String
{-

Eroare:
  Prelude> read "test"
*** Exception: Prelude.read: no parse

CASTARE:
  Prelude> read "1" :: Int
  1

  Prelude> read "1" :: Bool
  *** Exception: Prelude.read: no parse
  
  Prelude> read "True" :: Bool
  True


-}

instance Ord Z where
  (<=) (Neg _) (Pos _) = True
  (<=) (Neg x) (Neg y) = y <= x
  (<=) (Pos x) (Pos y) = x <= y
  (<=) (Pos x) (Neg y) = (x == Zero) && (y == Zero)

-- Ord = clasa tipurilor ale caror valori pot fi ordonate

-- Bounded = clasa tipurilor cu numar finit de valori

-- Paranteza Deschisa
-- tipul "()" (citit: tipul unit / tipul unitate)
-- are o singura valoare: "()"

-- seamana cu tipul "void" in C

asdf :: () -> Int
asdf () = 123

asdf' :: () -> Int
asdf' () = asdf' ()

asdf1 :: Int -> ()
asdf1 x = ()
-- Paranteza Inchisa



-- Paranteza Deschisa

-- Tipul Either

data Poate a = Nimic | Ceva a deriving (Show, Eq, Ord)

impartire :: Int -> Int -> Poate Int
impartire _ 0 = Nimic
impartire x y = Ceva (x `div` y)

cmmdc :: Int -> Int -> Poate Int
cmmdc 0 0 = Nimic
cmmdc 0 x = Ceva x
cmmdc x 0 = Ceva x
cmmdc x y = if x == y then Ceva x
            else if x > y then cmmdc y (x - y)
            else cmmdc x (y - x)
-- cmmdc 10 5 = cmmdc 5 5 = cmmdc 5 0 == Ceva 5

data CauzaEroare = ImpartireLaZero | CmmdcNedefinit deriving Show

impartire' :: Int -> Int -> Either Int CauzaEroare
impartire' _ 0 = Right ImpartireLaZero
impartire' x y = Left (x `div` y)

cmmdc' :: Int -> Int -> Either Int CauzaEroare
cmmdc' 0 0 = Right CmmdcNedefinit
cmmdc' 0 x = Left x
cmmdc' x 0 = Left x
cmmdc' x y = if x == y then Left x
            else if x > y then cmmdc' y (x - y)
            else cmmdc' x (y - x)

-- Paranteza Inchisa

-- Analogie:

-- o clasa de tipuri in Haskell != clasa in C++
-- o clasa de tipuri in Haskell seamana cu o interfata in Java

-- Clasa Functor

-- Kind
-- Type = Tip
-- Value = Valoare

-- Un "kind" este pentru tipuri
-- ce este un tip pentru o valoare

-- Maybe :: * -> *
-- constructor de tip

-- Paranteza Deschisa

type Intreg = Integer

-- sinonim de tip

-- Paranteza Inchisa

-- Paranteza Deschisa

data Persoana = P String String deriving Show
-- primul argument = prenume
-- al doilea argument = nume

data Persoana' = Secret | P' { prenume :: String, nume :: String } deriving Show

-- "record syntax"

-- Paranteza Inchisa