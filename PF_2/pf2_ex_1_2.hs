{-
    Exercitiul 1.2. Incarcati ın ghci un fisier care contine definitia tipului Mobile Device. Care
    sunt tipurile pentru SmartphoneLaptop si Tablet?
-}

{-
    data MobileDevice = Smartphone
                        | Laptop
                        | Tablet

    
    
    *Main> Smartphone
    <interactive>:8:1: error:
        * No instance for (Show MobileDevice) arising from a use of `print'
        * In a stmt of an interactive GHCi command: print it


    Pentru a avea o reprezentare ca sir de caractere (ca sa evitam eroare de mai sus) folosim "deriving (Show)"
-}

    data MobileDevice = Smartphone
                        | Laptop
                        | Tablet
                          deriving (Show)

{-
    *Main> :l pf2_ex_1_2
    [1 of 1] Compiling Main             ( pf2_ex_1_2.hs, interpreted )
    Ok, one module loaded.
    *Main> Smartphone
    Smartphone
    *Main>
-}                          