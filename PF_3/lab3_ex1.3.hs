{-
    Exercitiul 1.3. Creati un tip de date Culori care sa contina cateva culori. Apoi modificati
tipul MobileDevice astfel ıncat sa puteti atasa culori pentru fiecare dispozitiv.
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


{-
    Vom explica acest lucru pe un exemplu: sa presupunem ca dorim sa scriem
    o functie care va ıntoarce pentru fiecare dispozitiv o descriere. Considerand prima definitie
    Varianta preliminara 2
    Programare Functionala 2019-2020 Laboratorul II
    pentru MobileDevicefunctia va fi implementata astfel:

-}

descriere :: MobileDevice -> String
descriere (Laptop color) = "Acesta este un laptop de culoare roz."
descriere (Tablet num text color) = "Aceasta este o tableta mov."
descriere (Smartphone color) = "Acesta este un telefon mobil."