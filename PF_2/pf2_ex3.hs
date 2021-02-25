{-
    3. implementati diferiti algoritmi pentru calculul cmmdc (algoritmul lui Euclid prin scaderi/ımpartiri
    repetate, algoritmul binar)
-}

cmmdcEuclid :: Integer -> Integer -> Integer
cmmdcEuclid x y | x == y = x
cmmdcEuclid x > y = cmmdcEuclid (x - y) y 
cmmdcEuclid _ _ = cmmdcEuclid x (y - x) 