-- Testati funct, ia mySum ˆın ghci.

mySum :: Int -> Int
mySum x = if x <= 0 then 0 else x + mySum (x - 1)

-- interactiune:
{- 
    :load pf1_exercitiul3_11
    mySum 40
    820
-}

-- calculeaza (n + (n-1)+(n-2)...(n-n))