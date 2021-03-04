{-
    Exercitiul 1.4. Utilizand tipul de date Culori scrieti o functie care afiseaza culorea fiecarui
dispozitiv.

-}


data Culori = Rosu
            | Galben
            | Albastru
            | Verde
            | Maro
             deriving (Show)
             

data MobileDevice = Smartphone Culori
                    | Laptop Culori
                    | Tablet Int String Culori
                    deriving (Show)

culoareDispozitiv :: MobileDevice -> Culori
culoareDispozitiv (Laptop color) = color
culoareDispozitiv (Tablet num text color) = color
culoareDispozitiv (Smartphone color) = color
