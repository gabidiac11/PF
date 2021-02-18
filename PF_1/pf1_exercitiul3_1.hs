-- Exercitiul 3.1. In Haskell exista deja predefinite functiile: succ – care calculeaza succesorul
-- unui numarpred – care calculeaza predecesorul unui numarmax – care calculeaza maximul
-- dintre doua numeremin – care calculeaza minimul dintre doua numere. Utilizati comanda
-- :t pentru a afla tipurile acestor functii. Apelati toate aceste functii ın ghcisi verificati daca
-- obtineti rezultatul corect.

succ $ (-) 2 1 -- 2 - am folosit $ pentru ca sa pare mai interesant
pred $ (-) (2 + 6) 1 -- 6
max ((*) 2 3) ((*) 3 2) --6