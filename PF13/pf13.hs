-- PF_11_START************************************************************************************************************************************************************|
-- ***********************************************************************************************************************************************************************|

import Debug.Trace
{-- definim un sinonim pentru String, numit Id --}
type Id = String

data Term = Var Id -- x, y, z
     | App Term Term -- (t1 t2)
     | Lambda Id Term deriving (Show, Eq) -- (λx.x)


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 1. scriti o valaore de tip Term care reprezinta labda-termenul λx.λy.x
var1 = Lambda "x" (Lambda "y" (Var "x"))


-- In continuare vom scrie o functie subst care implementeaza substitutia (notata in curs ca t[x/t'])
-- Parametrii:
-- 1. variabila id care trb inlocuita
-- 2. termenul care o va inlocui
-- 3. termenul in care se face inlocuire


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 2. Completati functia de mai jos:
subst :: Id -> Term -> Term -> Term
subst id term (Var id') | id == id' = term -- Caz 2
                        | True = (Var id') -- Caz 1 
subst id term (App term1 term2) = App (subst id term term1) (subst id term term2) -- Caz 3
subst id term (Lambda id' term') | id == id' = (Lambda id' term')
                                 | True      = (Lambda id' (subst id term term'))

--Asigurati-va ca functia calculeaza corect rezultatul pe cateva exemple:
-- 1. x[x/y] = y;
test1 = subst "x" (Var "y") (Var "x")

-- 2. x[y/z] = x;
test2 = subst "y" (Var "z") (Var "x")
    
-- 3. (x y)[y/z] = x z;
test3 = subst "y" (Var "z") (App (Var "x") (Var "z"))

-- 4. (y x)[y/z] = z x;
test4 = subst "y" (Var "z") (App (Var "y") (Var "x")) 

-- 5. (λx.(y x))[x/(λz.z)] = λx.(y x);
test5 = subst "x" (Lambda "z" (Var "z")) (Lambda "x" (App (Var "y") (Var "x"))) 

-- 6. (λy.(y x))[x/(λz.z)] = λy.(y (λz.z)).
test6 = subst "x" (Lambda "z" (Var "z")) (Lambda "y" (App (Var "y") (Var "x")))

-- Substitutia de mai sus este de tip non-capture-avoiding susbtitution, deoarece: λx.y[y/x] = λx.x (verificati).

varTest1 = subst "y" (Var "x") (Lambda "x" (Var "y")) 
varTest2 = Lambda "x" (Var "x")

varTestEq = (varTest1 == varTest2)


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 3. Completati functia remove, care elimina toate aparitiile unui element dat ca argument dintr-o lista:
remove :: Id -> [Id] -> [Id]
remove _ [] = []
remove id (hd:tl) | id == hd = remove id tl
                  | True     = [hd] ++ (remove id tl)


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 4. Completati functia free, care calculeaza toate variabilele libere ale uni lambda-term (rezultatul poate continue duplicate):
free :: Term -> [Id]
free (Var id) = [id]
free (App term1 term2) = (free term1) ++ (free term2) 
free (Lambda id term) = remove id (free term)


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 5. Completati functia vars, care calculeaza toate variabilele unui lambda-term, indiferent ca sunt libere sau nu (rezultatul poate contine duplicate):
vars :: Term -> [Id]
vars (Var id) = [id]
vars (App term1 term2) = (vars term1) ++ (vars term2)
vars (Lambda id term) = [id] ++ (vars term)


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 6. Completati functia fresh (puteti folosi functia ajutatoare fresh’)care este
-- folosita pentru calcularea unui identificator proaspat (identificator ce nu apare deja ın lista de
-- identificatori data ca argument):
fresh' :: [Id] -> Int -> Id
fresh' ids index = if ("n" ++ (show index)) `elem` ids then fresh' ids (index + 1)
                   else "n" ++ (show index)

-- Module:	Prelude
-- Function:	elem
-- Type:	Eq a => a -> [a] -> Bool
-- Description:	returns True if the list contains an item equal to the first argument
-- Related:	(&&), all, and, any, not, notElem, or, (||)

fresh :: [Id] -> Id
fresh ids = fresh' ids 0


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 7. Completati functia casubst, care implementeaza o substitutie de tip capture-avoiding:
casubst :: Id -> Term -> Term -> [Id] -> Term
casubst id term (Var id') _ | id == id' = term
                            | True      = (Var id')
casubst id term (App term1 term2) avoid = App (casubst id term term1 avoid) (casubst id term term2 avoid)
casubst id term (Lambda id' term') avoid | id == id' = (Lambda id' term') -- termen original
                                         | id' `elem` (free term) = let 
                                                                        id'' = fresh avoid 
                                                                        avoidNew = (avoid ++ [id''])
                                                                    in (casubst id term (Lambda id'' (casubst id' (Var id'') term' avoidNew)) avoidNew)
                                         | True                   = Lambda id' (casubst id term term' (avoid ++ [id']))

-- initializeaza avoid cu variabilele termenului caruia ii este aplicata inlocuirea
casubstcall :: Id -> Term -> Term -> Term
casubstcall id term term' = casubst id term term' (vars term') 

--Testati functia casubst pe toate exemplele de la substplus exemplul: λx.y[y/x] = λn0.x
ex7Test1 = Lambda "x" (Var "y")
ex7Test1_result = casubstcall "y" (Var "x") ex7Test1

-- TEST EXEMPLE DE MAI SUS
-- 1. x[x/y] = y;
ex7_prevTest1 = casubstcall "x" (Var "y") (Var "x") 

-- 2. x[y/z] = x;
ex7_prevTest2 = casubstcall "y" (Var "z") (Var "x") 
    
-- 3. (x y)[y/z] = x z;
ex7_prevTest3 = casubstcall "y" (Var "z") (App (Var "x") (Var "z")) 

-- 4. (y x)[y/z] = z x;
ex7_prevTest4 = casubstcall "y" (Var "z") (App (Var "y") (Var "x"))  

-- 5. (λx.(y x))[x/(λz.z)] = λx.(y x);
ex7_prevTest5 = casubstcall "x" (Lambda "z" (Var "z")) (Lambda "x" (App (Var "y") (Var "x")))  

-- 6. (λy.(y x))[x/(λz.z)] = λy.(y (λz.z)).
ex7_prevTest6 = casubstcall "x" (Lambda "z" (Var "z")) (Lambda "y" (App (Var "y") (Var "x"))) 


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 8. Completati functia reduce1 care aplica o beta-reducere ın termenul dat ca
-- parametru si ın acest caz ıntoarce termenul rezultat (protejat cu constructorul Just) sau
-- ıntoarce Nothing daca nu exista nicio beta-reducere care se poate aplica.

reduce1' :: Term -> [Id] -> Maybe Term
reduce1' (Var id') _ = trace ("t_r1" ++ (show (Var id')) ) ( Nothing)
-- REDUCERE RADACINA
reduce1' (App (Lambda id term) term') avoid = 
   trace ("t_r6" ++ (show (App (Lambda id term) term'))    ) ( Just (casubst id term' term avoid) ) --beta-reducere propriu-zisa
reduce1' (App term1 term2) avoid = case reduce1' term1 avoid of -- REDUCERE STANGA
    Nothing -> case reduce1' term2 avoid of -- REDUCERE DREAPTA
        Nothing -> trace ("t_r1" ++ (show (App term1 term2)) ) Nothing
        Just term2' -> trace ("t_r2" ++ (show (App term1 term2)) ) (Just (App term1 term2'))
    Just term1' -> trace ("t_r3" ++ (show (App term1 term2)) ) (Just (App term1' term2))
reduce1' (Lambda id term) avoid = case reduce1' term avoid of
    Nothing -> trace ("t_r4" ++ (show (Lambda id term)) ) Nothing
    Just term' -> trace ("t_r5" ++ (show (Lambda id term)) ) (Just (Lambda id term'))

reduce1 :: Term -> Maybe Term
reduce1 t = reduce1' t (vars t)

-- Testati functia reduce1 pe urmatoarele exemple:
x = Var "x"
y = Var "y"
z = Var "z"
term1 = Lambda "x" x
term2 = App term1 term1
term3 = Lambda "y" (Lambda "x" term2)
term4 = App term3 term1
ex1 = reduce1 term1 -- Nothing
ex2 = reduce1 term2 -- Just (\x.x)
ex3 = reduce1 term3 -- Just \y.\x.(\x.x)
ex4 = reduce1 term4 -- Care este rezultatul?
-- acesta este rezultatul:
-- Just (Lambda "x" (App (Lambda "x" (Var "x")) (Lambda "x" (Var "x"))))

{-
 term4 fiind egal cu:
    (App (Lambda "y" 
            (Lambda "x" 
                (App 
                    (Lambda "x" (Var "x")) 
                    (Lambda "x" (Var "x"))
                )
            )
        ) 
        
        (Lambda "x" (Var "x"))
    )
 sau 
 \y.\x.((\x.x)(\x.x)) _ \x.x

 are loc urmatoarea reducere:
  \y.\x.((\x.x)(\x.x)) [y/\x.x]
-}


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 9. Completati urmatoarea functie recursivacare calculeaza o forma normala a
-- lambda-termenului dat ca parametru (aplica toate beta-reducerile posibile cat timp exista):
reduce :: Term -> Term
reduce term = case reduce1 term of
    Nothing -> term
    Just term' -> reduce term'

-- Exemple: reduce aplicat pe (λx.x)((λz.z)y) ar trebui sa ıntoarca y. Care sunt betareducerile efectuate de reduce?
ex9Term = App (Lambda "x" (Var "x")) (App (Lambda "z" (Var "z")) (Var "y"))
ex9TermTest = reduce ex9Term

{-
    Beta reducerile:
    1. (λx.x) [ x / ((λz.z)y)]
    2. (λz.z) [ z / y ]
    3. y (nicio reducere de aplicat)

    Pasii in obtinerea rezultatului sunt de asemenea visibili folosind functia trace (primeste un text pe care il afiseaza pe ecran si primeste o valoare de orice tip pe care o va returna dupa print):
    *Main Debug Debug.Trace> ex9TermTest
    (1.) trace-reduce1' 6 
    (2.) trace-reduce1' 6
    (3.) trace-reduce1' 1
-}


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 10. Dati exemplu de un lambda termen pentru care reduce intra ın bucla infinita.
-- Completati urmatoarea functiecare aplica cel mult n pasi de beta-reducere:
reducereFor :: Int -> Term -> Term
reducereFor 0 term = term
reducereFor n term = case reduce1 term of 
    Nothing -> term
    Just term' -> reducereFor (n-1) term'

-- Exemplu de bucla infinita: (λx.x x) (λx.x x)
aTerm = (Lambda "x" (App (Var "x") (Var "x")))
infiniteTerm = App aTerm aTerm
reduceForExample = reducereFor 100 infiniteTerm


-----------------------------------------------------------------------------------------------------------------------------------------
--Exercitiul 11. Scrieti ca valori de tip Term lambda-termenii TRUE, FALSE, AND, OR, NOT, ITE:
-- x = Var "x" --redeclarat aici
-- y = Var "y"

u = Var "u"
v = Var "v"

tTRUE = Lambda "x" (Lambda "y" x)
tFALSE = Lambda "x" (Lambda "y" y)
tAND = Lambda "u" (Lambda "v" (App (App u v) u ))
tOR = Lambda "u" (Lambda "v" (App (App u u) v ))
tNOT = Lambda "u" (App (App u tFALSE) tTRUE)

reduceForExample100 = reducereFor 100

testb1 = reduceForExample100 (App (App tAND tTRUE) tFALSE)
testb2 = reduceForExample100 (App (App tAND tTRUE) tTRUE)

testb3 = reduceForExample100 (App (App tOR tFALSE) tFALSE)
testb4 = reduceForExample100 (App (App tOR tFALSE) tTRUE)

testb5 = reduceForExample100 (App tNOT tFALSE)
testb6 = reduceForExample100 (App tNOT tTRUE)

-- PF_11_END************************************************************************************************************************************************************|
-- ***********************************************************************************************************************************************************************|

--Exercitiul 0.1. Reamintim functiile reduce1 si reduce1’:
-- Intrebare: Care este strategia de evaluare implementata mai sus? Testati strategia pe exemplele urmatoare:

-- 1.(λx1.x1) (λx2.x2) (λz.(λx3.x3) z);
exB_entity1 = App (Lambda "x1" (Var "x1")) 
                  (
                    App 
                    (Lambda "x2" (Var "x2")) 
                    (
                        Lambda "z" 
                        (
                            App 
                            (Lambda "x3" (Var "x3"))  
                            (Var "z")
                        )
                    )
                  )

-- reducere in 'Normal Order', prima data este tradata reducerea din radacina, care functioneaza prin urmatorul matching: (App (Lambda id term) term')
-- Dupa care se trateaza cazul: (App term1 term2), de unde mai intai se evalueza (si eventual reduc) term1 si dupa care term2
testExB_1 = reduceForExample100 exB_entity1

-----------------------------------------------------
-- 2.(λx1.λx2.x2) (λx.x) (λy.y).
exB_entity2 = App 
                (Lambda "x1" (Lambda "x2" (Var "x2"))) 
                (App 
                    (Lambda "x" (Var "x")) 
                    (Lambda "y" (Var "y"))
                )

testExB_2 = reduceForExample100 exB_entity2



{-
    Exercitiul 0.2. Pornind de la implementarea strategiei de la Exercitiul 0.1implementati
strategia call-by-name (CBN). Reamintim ca pentru aceasta strategie nu sunt permise
reducerile ın interiorul unei lambda-abstractii. Testati implementarea strategiei peste
exemplele de la Exercitiul 0.1. Puteti identifica un avantaj al strategiei CBN?
-}

reduce2' :: Term -> [Id] -> Maybe Term
reduce2' (Var id') _ = trace ("CBN1" ++ (show (Var id')) ) ( Nothing)
-- REDUCERE RADACINA
reduce2' (App (Lambda id term) term') avoid = 
   trace ("CBN6" ++ (show (App (Lambda id term) term'))    ) ( Just (casubst id term' term avoid) ) --beta-reducere propriu-zisa
reduce2' (App term1 term2) avoid = case reduce2' term1 avoid of -- REDUCERE STANGA
    Nothing -> case reduce2' term2 avoid of -- REDUCERE DREAPTA
        Nothing -> trace ("CBN1" ++ (show (App term1 term2)) ) Nothing
        Just term2' -> trace ("CBN2" ++ (show (App term1 term2)) ) (Just (App term1 term2'))
    Just term1' -> trace ("CBN3" ++ (show (App term1 term2))) (Just (App term1' term2))
-- evitarea reducerii termenilor din interiorul unei lambda abstractii
reduce2' (Lambda id term) avoid = trace ("CBN4" ++ (show (Lambda id term))) Nothing

reduce2 :: Term -> Maybe Term
reduce2 t = reduce2' t (vars t)

reduceByName :: Term -> Term
reduceByName term = case reduce2 term of
    Nothing -> term
    Just term' -> reduceByName term'

reducereCBNFor :: Int -> Term -> Term
reducereCBNFor 0 term = term
reducereCBNFor n term = case reduce2 term of 
    Nothing -> term
    Just term' -> reducereCBNFor (n-1) term'

reduceCBN100 = reducereCBNFor 100 


--TESTE--
testExB_ex02_1 = reduceCBN100 exB_entity1
testExB_ex02_2 = reduceCBN100 exB_entity2


-- Testati strategia si pe urmatorul exemplu:
-- (λx1.x1 x1) (λx.x) (λy.y)
-- exB_entity3 = App (
--                 Lambda "x1" 
--                     (App
--                         (Var "x1")
--                         (Var "x1")
--                      )
--                 )
--                 (
--                 Lambda "x1" 
--                     (App
--                         (Var "x1")
--                         (Var "x1")
--                      )
--                 )