{-
    8. implementati recursiv (chiar daca sunt ineficiente) urmatoarele functii: 
    • adunarea a doua numere naturale folosind succ; 
-}
import Prelude hiding (succ) -- rezolva conflicte cu functia "and" predefinit de sistem (https://stackoverflow.com/questions/16430025/ambiguous-occurrence) 

succ :: Integer -> Integer
succ x = (+) x 1

myAdd :: Integer -> Integer -> Integer
myAdd 0 y = y
myAdd x y | (x - 1) (succ y)

{-
    • ınmultirea a doua numere naturale folosind adunarea;
-}

myMullAux :: Integer -> Integer -> Integer -> Integer
myMullAux 0 y _ = y
myMullAux x y a = myMullAux (x - 1) (myAdd y a) a

myMull :: Integer -> Integer -> Integer
myMull 0 y = 0
myMull x 0 = 0
myMull 1 y = y
myMull x 1 = x
myMull x y = myMullAux x y y

{-
    • ridicarea la putere folosind ınmultirea
-}

myRaiseAux :: Integer -> Integer -> Integer -> Integer
myRaiseAux 0 y _ = y
myRaiseAux x y a = myRaiseAux (x - 1) (myMull y a) 

myRaise :: Integer -> Integer -> Integer
myRaise 0 y = 0
myRaise x 0 = 1
myRaise 1 y = 1
myRaise x 1 = x
myRaise x y = myRaiseAux x y y