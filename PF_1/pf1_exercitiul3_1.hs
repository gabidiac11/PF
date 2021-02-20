{-
    Exercitiul 3.1. In Haskell exista deja predefinite functiile: 
        succ – care calculeaza succesorul unui numar
        pred – care calculeaza predecesorul unui numar
        max – care calculeaza maximul dintre doua numere
        min – care calculeaza minimul dintre doua numere. 
    Utilizati comanda :t pentru a afla tipurile acestor functii. 
    Apelati toate aceste functii ın ghcisi verificati daca obtineti rezultatul corect.
-} 

--- am folosit $ ca sa fiu mai familiar cu el (actioneaza ca o "()", luand ca punct de start caracterul "$" si punctul de sfarsit este sfarsitul intregii expresii)
Prelude> succ $ (-) 2 1
2
Prelude> pred $ (-) (2 + 6) 1
6
Prelude> max ((*) 2 3) ((*) 3 2)
6