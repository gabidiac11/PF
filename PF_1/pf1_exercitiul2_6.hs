{-
  Exercitiul 2.6. Evaluati ın ghci expresia not 2. Ce obtineti?
-} 

not 2

-- intervine o eroare deorece operatorul not trebuie sa primeasca intodeauna un argument de tip Bool

:t not
not :: Bool -> Bool

*Main> :t not 2
<interactive>:57:5: error:
    * No instance for (Num Bool) arising from the literal `2'
    * In the first argument of `not', namely `2'
      In the expression: not 2
      In an equation for `it': it = not 2