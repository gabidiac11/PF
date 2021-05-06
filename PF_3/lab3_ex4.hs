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