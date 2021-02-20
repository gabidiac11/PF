{-
    Exercitiul 2.2. Evaluati toate expresiile de mai sus ın forma prefixata. 
    Atentie la prioritatile operatorilor!
-}

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


--rezolvare
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
