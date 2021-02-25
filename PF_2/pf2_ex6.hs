{-
    6. implementati algoritmul extins al lui Euclid.
-}

cmmdcEuclidExtins :: Integer -> Integer -> Integer
cmmdcEuclidExtins x y | y <= 0 = x
cmmdcEuclidExtins x y = cmmdcEuclidExtins y (x `mod` y) 