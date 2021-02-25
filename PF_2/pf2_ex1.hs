{-
    1. functii peste Bool: si logic, sau logic, nand, nor, implicatie, dublu implicatie
-}

import Prelude hiding (and, or, neg, nand, nor) -- rezolva conflicte cu functia "and" predefinit de sistem (https://stackoverflow.com/questions/16430025/ambiguous-occurrence) 

and :: Bool -> Bool -> Bool
and False _ = False
and _ False = False
and _ _ = True

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or _ _ = False

neg :: Bool -> Bool
neg True = False
neg False = True

nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True

nor :: Bool -> Bool -> Bool
nor False False = True
nor _ _ = False

implicatie :: Bool -> Bool -> Bool
implicatie True False = False
implicatie _ _ = True

implicatie_dubla :: Bool -> Bool -> Bool
implicatie_dubla True True = True
implicatie_dubla False _ = True
implicatie_dubla _ _ = False