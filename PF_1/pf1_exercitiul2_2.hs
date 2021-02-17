2
2 + 3
2 + 3 * 5
(2 + 3) * 5
3 / 5
45345345346536 * 54425523454534333
3 / 0
True
False
True && False
True || False
not True
2 <= 3
not (2 <= 3)
(2 <= 3) || True
"aaa" == "aba"
"aba" == "aba"
"aaa" ++ "aba"

-- Evaluati, toate expresiile de mai sus ın forma prefixata. Atent, ie la prioritatile
-- operatorilor!

2
(+) 2 3
(+) 2 ((*) 3 5)
(*) ((+) 2 3) 5
(/) 3 5
(*) 45345345346536 54425523454534333
(/) 3 0
True
False
(&&) True False
(||) True False
not True
(<=) 2 3
not ((<=) 2 3)
(||) ((<=) 2 3) True
(==) "aaa" "aba"
(==) "aba" "aba"
(++) "aaa" "aba"