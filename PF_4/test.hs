
length' :: String -> Int 
length' (hd:tl) = (1 + (length' tl))
length' _ = 0


lengthAdd :: String -> Int -> Int 
lengthAdd (hd:tl) n = (n + (lengthAdd tl n))
lengthAdd _ _ = 0

example :: Int -> Int -> Int -> Int
example a b = (+ (a + b))

test3Args :: Int -> Int -> Int -> Int
test3Args a b c = a + b + c

process' :: (Int -> Int -> Int) -> Int -> Int -> Int
process' f g g2 = f g g2

process'' :: (String -> Int -> Int) -> String -> Int -> Int
process'' f g g2 = f g g2

map' :: ([String] -> [a]) -> [String] -> [a]
map' f str = f str

lengthArr :: [String] -> [Int]
lengthArr (hd:tl) = [(length' hd)] ++ (lengthArr tl)
lengthArr _ = []


-- reduce function
reduce' :: (a -> b -> b) -> [a] -> b -> b
reduce' f (hd:tl) init = reduce' f tl (f hd init) 
reduce' _ _ init = init

myReduceCallback :: String -> Int -> Int
myReduceCallback str n = n + (length' str)

filter' :: (a -> Bool) -> [a] -> [a]
filter' f (hd:tl) = if f hd 
                        then [hd] ++ (filter' f tl)
                        else (filter f tl)
filter' f _ = []


foldl' :: (a -> b -> b) -> b -> [a] -> b
foldl' f n (hd:tl) = (foldl' f (f hd n) tl)
foldl' _ n _ = n