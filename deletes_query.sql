# --------------------------------------------------
# DELETE TABLES

DROP TABLE IF EXISTS Zawodnik_Zawody;
DROP TABLE IF EXISTS RekordOsobisty;
DROP TABLE IF EXISTS Wynik;
DROP TABLE IF EXISTS Etap;
DROP TABLE IF EXISTS Konkurencja;
DROP TABLE IF EXISTS Obiekt;
DROP TABLE IF EXISTS Trener;
DROP TABLE IF EXISTS Sedzia;
DROP TABLE IF EXISTS Zawodnik;
DROP TABLE IF EXISTS Zawody;
DROP TABLE IF EXISTS Klubplywacki;
DROP TABLE IF EXISTS Licencja;
# --------------------------------------------------

# --------------------------------------------------
# DELETE FUNCTIONS

DROP FUNCTION IF EXISTS zliczCzlonkowPoID;
DROP FUNCTION IF EXISTS zliczCzlonkowPoNazwie;
# --------------------------------------------------

# --------------------------------------------------
# DELETE TRIGGERS

DROP TRIGGER IF EXISTS NajlepszyCzasIN;
DROP TRIGGER IF EXISTS NajlepszyCzasUP;
DROP TRIGGER IF EXISTS NajlepszyCzasDEL;
DROP TRIGGER IF EXISTS IDZawodowZawodnikREMOVE;
# --------------------------------------------------