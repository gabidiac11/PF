-- Exercit, iul 2.6. Evaluat, i ˆın ghci expresia not 2. Ce obt, inet, i?

not 2

-- respuns: intervine o eroare deorece haskell, prin comanda ":t not 2", nu se determina valoare expresiei,
--          pentru ca rezultatul expresie este determinat la compilare, nu la evaluare (dupa cum relateaza notele de curs)

<interactive>:57:5: error:
    * No instance for (Num Bool) arising from the literal `2'
    * In the first argument of `not', namely `2'
      In the expression: not 2
      In an equation for `it': it = not 2