# -------------------------------------------------------------
#       REALIZACJA PROJEKTU Z PRZEDMIOTU PODSTAWY BAZ DANYCH
#               W ROKU AKADEMICKIM 2020/2021 SEMESTR IV
#                           TEMAT PROJEKTU :
#                              "PLYWANIE"
# -------------------------------------------------------------
#
# REALIZUJACY PROJEKT :
#
# ALEKSANDRA BABIARSKA
# MATEUSZ GOCAŁ
# JAKUB SZOSTAK
# JAKUB WOJTAŚ
#
# -------------------------------------------------------------
# -------------------------------------------------------------
#
#                           WYZWALACZE
#
# -------------------------------------------------------------

USE pbd_plywanie;

# -------------------------------------------------------------
# WYZWALACZ SPRAWDZAJACY CZAS I AKTUALZUJACY REKORD JESLI JEST

DELIMITER //
CREATE TRIGGER NajlepszyCzasIN AFTER INSERT ON Wynik FOR EACH ROW
    BEGIN
        SET @zawodnik = new.ID_Zawodnika;
        SET @konkurencja = (SELECT ID_Konkurencji FROM etap WHERE etap.ID_Etapu = new.ID_Etapu);
        SET @aktualnyRekord = (SELECT czas FROM rekordosobisty WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @konkurencja );
        SET @rok = (SELECT rok FROM zawody JOIN konkurencja k on zawody.ID_Zawodow = k.ID_Zawodow WHERE ID_Konkurencji = @konkurencja);

        IF @aktualnyRekord IS NULL THEN
            INSERT INTO rekordosobisty(ID_Zawodnika, ID_Konkurencji, DataWykonania, Czas) VALUES (@zawodnik,@konkurencja,@rok,new.Czas);
        ELSEIF @aktualnyRekord > new.Czas THEN
            UPDATE rekordosobisty SET Czas = new.Czas, DataWykonania = @rok WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @konkurencja;
        END IF;
    END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER NajlepszyCzasDEL AFTER DELETE ON Wynik FOR EACH ROW
    BEGIN
        SET @zawodnik = old.ID_Zawodnika;
        SET @konkurencja = (SELECT ID_Konkurencji FROM etap WHERE etap.ID_Etapu = old.ID_Etapu);
        SET @aktualnyRekord = (SELECT czas FROM rekordosobisty WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @konkurencja );
        SET @nowyRekord = (SELECT MIN(czas) FROM wynik WHERE czas IN
                        (SELECT czas FROM wynik w JOIN etap e on e.ID_Etapu = w.ID_Etapu
                        WHERE w.ID_Zawodnika = @zawodnik AND e.ID_Konkurencji = @konkurencja));

        IF @nowyRekord IS NULL THEN
            DELETE FROM rekordosobisty WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @konkurencja;
        ELSE
            SET @rok = (SELECT rok FROM zawody JOIN konkurencja k on zawody.ID_Zawodow = k.ID_Zawodow WHERE ID_Konkurencji = @konkurencja);
            UPDATE rekordosobisty SET Czas = @nowyRekord, DataWykonania = @rok WHERE ID_Konkurencji = @konkurencja AND ID_Zawodnika = @zawodnik;
        END IF;
    END//
DELIMITER ;

# -------------------------------------------------------------

# -------------------------------------------------------------
# WYZWALACZ USUWAJACY REKORDY ID Z TABLICY ZAWODY

DELIMITER //
CREATE TRIGGER IDZawodowZawodnikREMOVE BEFORE DELETE ON zawody FOR EACH ROW
    BEGIN
        DELETE FROM zawodnik_zawody WHERE ID_Zawodow = OLD.ID_Zawodow;
    END//
DELIMITER ;
# -------------------------------------------------------------
