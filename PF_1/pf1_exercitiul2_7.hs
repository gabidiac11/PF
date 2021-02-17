-- Exercit, iul 2.7. Utilizat, i comanda :t pentru a afla tipul lui not si apoi tipul argumentului 2.
-- Ce observat, i?

-- my note: intervine o eroare deorece haskell prin comanda :t not 2 nu se determina valoare expresiei,
--          pentru ca rezultatul expresie este determinat la compilare

<interactive>:1:5: error:
    * No instance for (Num Bool) arising from the literal `2'
    * In the first argument of `not', namely `2'
      In the expression: not 2