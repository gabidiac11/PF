-- euclid cu scaderi
euSc :: Int -> Int -> Int
euSc a b | a > b = euSc (a - b) b
euSc a b | a < b = euSc a (b - a)
euSc a b = a

-- euclid cu impartiri
euI :: Int -> Int -> Int
euI a b | b == 0 = a
euI a b = euI b (a `mod` b)