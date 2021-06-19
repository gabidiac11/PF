{-tip de date pentru tipurile simple-}

data Type = TyBool
    | TyNat
    | Ty Type Type

type Id = String

data Term = Var Id
    | Lam Id Type Term
    | App Term Term 
    | Ttrue
    | Ffalse
    | 
    