-- -------------------------------------------------------------
--      REALIZACJA PROJEKTU Z PRZEDMIOTU PODSTAWY BAZ DANYCH
--              W ROKU AKADEMICKIM 2020/2021 SEMESTR IV
--                          TEMAT PROJEKTU :
--                             "PLYWANIE"
--
--
-- REALIZUJACY PROJEKT :
--
-- ALEKSANDRA BABIARSKA
-- MATEUSZ GOCAŁ
-- JAKUB SZOSTAK
-- JAKUB WOJTAŚ
--
-- -------------------------------------------------------------
-- -------------------------------------------------------------
--
--                          WYZWALACZE
--
-- -------------------------------------------------------------

USE pbd_plywanie;

-- -------------------------------------------------------------
-- WYZWALACZ SPRAWDZAJACY CZAS I AKTUALZUJACY REKORD JESLI JEST

DELIMITER //
CREATE TRIGGER NajlepszyCzas AFTER INSERT ON Wynik FOR EACH ROW
BEGIN
        SET @zawodnik = new.ID_Zawodnika;
        SET @rekord = (SELECT czas FROM RekordOsobisty WHERE rekordosobisty.ID_Zawodnika = @zawodnik);
        SET @miejsce = (SELECT ID_Konkurencji FROM Etap e JOIN Wynik w ON e.ID_Etapu = w.ID_Etapu WHERE w.ID_Etapu = new.ID_Etapu);

        IF @rekord < new.Czas THEN
            UPDATE rekordosobisty SET Czas = new.Czas WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @miejsce;
        END IF;
END//

-- -------------------------------------------------------------
-- TODO TE SAME WYZWALACZE TYLKO NA UPDATE'A ( TE NA DOLE )
-- -------------------------------------------------------------
-- WYZWALACZE AKTUALIZUJACE ILOSC CZLONKOW

DELIMITER //
CREATE TRIGGER CzlonkowieZawodnikADD AFTER INSERT ON Zawodnik FOR EACH ROW
BEGIN
    SET @klub = (SELECT ID_Klubu FROM Zawodnik WHERE ID_Klubu = new.ID_Klubu);
    SET @ilosc = (SELECT IloscCzlonkow FROM klubplywacki WHERE klubplywacki.ID_Klubu = @klub);

    UPDATE klubplywacki SET IloscCzlonkow = @ilosc + 1 WHERE ID_Klubu = @klub;
END//

-- -------------------------------------------------------------

DELIMITER //
CREATE TRIGGER CzlonkowieZawodnikREMOVE AFTER INSERT ON Zawodnik FOR EACH ROW
BEGIN
    SET @klub = (SELECT ID_Klubu FROM Zawodnik WHERE ID_Klubu = new.ID_Klubu);
    SET @ilosc = (SELECT IloscCzlonkow FROM klubplywacki WHERE klubplywacki.ID_Klubu = @klub);

    UPDATE klubplywacki SET IloscCzlonkow = @ilosc - 1 WHERE ID_Klubu = @klub;
END//

-- -------------------------------------------------------------

DELIMITER //
CREATE TRIGGER CzlonkowieTrenerADD AFTER INSERT ON Trener FOR EACH ROW
BEGIN
    SET @klub = (SELECT ID_Klubu FROM Trener WHERE ID_Klubu = new.ID_Klubu);
    SET @ilosc = (SELECT IloscCzlonkow FROM klubplywacki WHERE klubplywacki.ID_Klubu = @klub);

    UPDATE klubplywacki SET IloscCzlonkow = @ilosc + 1 WHERE ID_Klubu = @klub;
END//

-- -------------------------------------------------------------

DELIMITER //
CREATE TRIGGER CzlonkowieTrenerREMOVE AFTER INSERT ON Trener FOR EACH ROW
BEGIN
    SET @klub = (SELECT ID_Klubu FROM Trener WHERE ID_Klubu = new.ID_Klubu);
    SET @ilosc = (SELECT IloscCzlonkow FROM klubplywacki WHERE klubplywacki.ID_Klubu = @klub);

    UPDATE klubplywacki SET IloscCzlonkow = @ilosc - 1 WHERE ID_Klubu = @klub;
END//

-- -------------------------------------------------------------

-- TODO ZAWODNIKZAWODY - ZAWODY I/D