{-
    7. implementati functia succ :: Integer -> Integer
-}

import Prelude hiding (succ) -- rezolva conflicte cu functiile predefinite de sistem (https://stackoverflow.com/questions/16430025/ambiguous-occurrence) 

succ :: Integer -> Integer
succ x = (+) x 1