{-
    Exercitiul 1.1. Scrieti varianta curried pentru functia:
-}

addThree :: (Int, Int, Int) -> Int
addThree (x,y,z) = x + y + z

addThreeC :: Int -> Int -> Int -> Int
addThreeC x y z = x + y + z