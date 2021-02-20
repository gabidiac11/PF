{-
    Exercitiul 2.7. Utilizat, comanda :t pentru a afla tipul lui not si apoi tipul argumentului 2.
    Ce observati?
-} 

    *Main> :t not
    not :: Bool -> Bool --functie de aritate unara care primeste ca parametru Bool si returneaza Bool 

    *Main> :t 2
    2 :: Num p => p --este interpretata drept o functie constanta