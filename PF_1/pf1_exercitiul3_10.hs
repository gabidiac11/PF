-- Exercit, iul 3.10. Definit, i o funct, ie care calculeaz˘a maximul dintre 3 numere ˆıntregi s, i testat, i
-- funct, ia ˆın ghci.

-- am extins list de parametrii si structura de control
myMaxThree :: Int -> Int -> Int -> Int
myMaxThree x y z =  if x <= y then 
                        if y >= z then y 
                        else z
                    else if x >= z then x 
                        else z