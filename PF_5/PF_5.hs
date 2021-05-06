{-- 1. Definiti un tip de date Nat pentru numere naturale reprezentate in baza 2. 

Variante:
V1:
--}

data Nat = Cons [Bool]

toDecimalAux ::Nat -> Int -> Int
toDecimalAux [] _ = 0
toDecimalAux (x:cx) n = (2**n) + (toDecimalAux cx n+1)

toDecimal :: Nat -> Int
toDecimal [] = 0
toDecimal arr = toDecimalAux arr 0
{-

    [False, True, True] = 011 = 6
    [False, True, True, False] = 0110 = 6

    [False] = 0

    [True] = 1

    V2:
    [False, True, True] = 011 = 3

    V3: 
    

    FARA CONVERSII la Int/Integer etc.

--}

--data Nat = Zero | Double Nat | DoubleAddOne Nat

-- 3 = DoubleAddOne (DoubleAddOne Zero)

-- 0 = Zero = Double Zero

-- 7 = DoubleAddOne 3 = DoubleAddOne (DoubleAddOne 1) = DoubleAddOne (DoubleAddOne (DoubleAddOne Zero))
-- 8 = Double (Double (Double (DoubleAddOne Zero)))

-- 2. Definiti       instance Eq Nat
-- 3.                instance Ord Nat
-- 4.                instance Integral Nat
-- 5.                instance Num Nat

-- 6. Complex a = numere complexe ale caror componente sunt de tip a (e.g. Complex Int, Complex Float)

-- 7. Definiti propria clasa MyOrd, similara cu Ord si:
-- - sa faceti Int instanta a clasei MyOrd
-- - sa faceti [a] instanta a MyOrd daca a este instanta a MyOrd
-- - sa faceti un algoritm de sortare sort :: MyOrd a => [a] -> [a]