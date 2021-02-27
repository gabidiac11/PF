{-
    9. implementati functiile mod si div pentru numere naturale.
-}
import Prelude hiding (div, mod) -- rezolva conflicte cu functiiile predefinit de sistem (https://stackoverflow.com/questions/16430025/ambiguous-occurrence) 

-- a - de cate ori a fost scazu
-- r - rest din care se scade
-- s - valoare de scazut
divAux :: Integer -> Integer -> Integer -> Integer
divAux a r s | r <= 0 = a
divAux a r s | r < s = a
divAux a r s = divAux (a + 1) (r - s) s

div :: Integer -> Integer -> Integer
div n m | n >= m = divAux 0 n m 
div _ _ = 0


mod :: Integer -> Integer -> Integer
mod n m | n <= m = 0
mod n m = n - (m * (div n m)) 