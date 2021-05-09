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
    5 Tipul Maybe
    Mai departe vom utiliza urmatorul tip de date:
    data ErrorNat = Error
    | Val Nat
    deriving (Show)

    Exercitiul 5.1. Scrieti o functie care face scaderea a doua numere naturale. Functia va returna
    Error atunci cand rezultatul scaderii nu este numar natural sau Val result unde result este
    rezultatul operatiei de scadere.

    Exercitiul 5.2. Scrieti o functie care face ımpartirea a doua numere naturale. Functia va
    returna Error atunci cand ımpartirea nu este definita din punct de vedere matematic sau Val
    result unde result este rezultatul operatiei de ımpartire.
-}

data ErrorNat = Error
               | Val Nat 
               deriving (Show)
 






























 {--

Prelude> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )
Ok, one module loaded.
*Main> impartire (Succ (Succ (Succ Zero))) (Succ (Succ Zero))
Succ Zero
*Main> impartire (Succ (Succ (Succ (Succ Zero)))) (Succ (Succ Zero))
Succ (Succ Zero)
*Main> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )

lab3_ex4.hs:42:12: error:
    * Variable not in scope: diff :: Nat -> Nat -> Nat
    * Perhaps you meant `dif' (line 27)
   |
42 | rest n m = diff n (impartire n m)
   |            ^^^^
Failed, no modules loaded.
Prelude> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )
Ok, one module loaded.
*Main> rest (Succ (Succ (Succ Zero))) (Succ (Succ Zero))
Succ (Succ Zero)
*Main> impartire (Succ (Succ (Succ Zero))) (Succ (Succ Zero))
Succ Zero
*Main> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )
Ok, one module loaded.
*Main> rest (Succ (Succ (Succ Zero))) (Succ (Succ Zero))
Succ Zero
*Main> rest (|(Succ (Succ (Succ Zero))) (Succ (Succ Zero))

<interactive>:18:52: error:
    parse error (possibly incorrect indentation or mismatched brackets)
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero))))) (Succ (Succ Zero))

<interactive>:19:70: error:
    parse error (possibly incorrect indentation or mismatched brackets)
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (Succ (Succ Zero))
Zero
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) ((Succ Zero))
Zero
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (Succ(Succ(Succ (Succ Zero))))
Succ (Succ Zero)
*Main> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )
Ok, one module loaded.
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) convert(4)

<interactive>:24:1: error:
    * Couldn't match expected type `t0 -> t' with actual type `Nat'
    * The function `rest' is applied to three arguments,
      but its type `Nat -> Nat -> Nat' has only two
      In the expression:
        rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) convert (4)
      In an equation for `it':
          it
            = rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) convert (4)
    * Relevant bindings include it :: t (bound at <interactive>:24:1)

<interactive>:24:53: error:
    * Couldn't match expected type `Nat' with actual type `Nat -> Int'
    * Probable cause: `convert' is applied to too few arguments
      In the second argument of `rest', namely `convert'
      In the expression:
        rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) convert (4)
      In an equation for `it':
          it
            = rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) convert (4)
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)

<interactive>:25:54: error:
    * Couldn't match expected type `Nat' with actual type `Int'
    * In the second argument of `rest', namely `(convert 4)'
      In the expression:
        rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)
      In an equation for `it':
          it
            = rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)

<interactive>:26:54: error:
    * Couldn't match expected type `Nat' with actual type `Int'
    * In the second argument of `rest', namely `(convert 4)'
      In the expression:
        rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)
      In an equation for `it':
          it
            = rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert 4)
*Main> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )

lab3_ex4.hs:50:20: error:
    * No instance for (Num Nat) arising from a use of `-'
    * In the first argument of `Succ', namely `(convert' n - 1)'
      In the expression: Succ (convert' n - 1)
      In an equation for convert': convert' n = Succ (convert' n - 1)
   |
50 | convert' n = Succ (convert' n - 1)
   |                    ^^^^^^^^^^^^^^
Failed, no modules loaded.
Prelude> :l lab3_ex4
[1 of 1] Compiling Main             ( lab3_ex4.hs, interpreted )
Ok, one module loaded.
*Main> rest (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))) (convert' 4)
Succ (Succ Zero)
*Main> rest (convert' 66) (convert' 4)
Succ (Succ Zero)
*Main> rest (convert' 48) (convert' 4)
Zero
*Main> convert (rest (convert' 48) (convert' 4))
0
*Main> convert (rest (convert' 51) (convert' 4))
3
--}