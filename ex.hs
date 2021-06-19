-- sir' :: [Char] -> [Char] -> [Char]
-- sir' (hd:tl) acc | (==) hd ' ' = acc
--                  | True = sir' tl (acc ++ [hd])
-- sir' _ acc = acc

-- sir :: [Char] -> [Char]
-- sir (hd:tl) | (==) hd ' ' = sir tl
--             | True = sir' tl [hd]
-- sir [] = []


sir' :: [Char] -> [Char] -> [Char]
sir' (hd:tl) acc = if ((==) hd ' ') then acc else sir' tl (acc ++ [hd])
sir' _ acc = acc

sir :: [Char] -> [Char]
sir (hd:tl) = if( (==) hd ' ') then sir tl else sir' tl [hd]
sir [] = []

trimleft :: [Char] -> [Char]
trimleft (hd:tl) = if (hd == ' ') 
    then trimleft tl
    else [hd] ++ tl
trimleft _ = []

