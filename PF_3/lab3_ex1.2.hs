{-
    Exercitiul 1.2. Incarcati ın ghci un fisier care contine definitia tipului MobileDevice. Care
    sunt tipurile pentru SmartphoneLaptop si Tablet?
-}

{-
data MobileDevice = Smartphone
                | Laptop
                | Tablet
-}

{-
<interactive>:11:1: error:
    * No instance for (Show MobileDevice) arising from a use of `print'
    * In a stmt of an interactive GHCi command: print it

-}

{- redefinire 
    data MobileDevice = Smartphone
                | Laptop
                | Tablet 
                  deriving (Show)

-}

{- Rezultat:
    *Main> Laptop
            Laptop
    *Main>
-}

{-
data MobileDevice = Smartphone
                    | Laptop
                    | Tablet Int
                    deriving (Show)
-}

{- rezultat:
    *Main> Tablet 3
    Tablet 3
    *Main> 
-}

data MobileDevice = Smartphone
                    | Laptop
                    | Tablet Int String
                    deriving (Show)

{-rezultat:

    *Main> Tablet 6 "Model X"    
        Tablet 6 "Model X"
    *Main>
-}