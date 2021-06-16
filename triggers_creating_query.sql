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

        IF @aktualnyRekord = NULL THEN
            SET @rok = (SELECT rok FROM zawody JOIN konkurencja k on zawody.ID_Zawodow = k.ID_Zawodow WHERE ID_Konkurencji = @konkurencja);
            INSERT INTO rekordosobisty(ID_Zawodnika, ID_Konkurencji, DataWykonania, Czas) VALUES (@zawodnik,@konkurencja,@rok,@aktualnyRekord);
        ELSEIF @aktualnyRekord > new.Czas THEN
            UPDATE rekordosobisty SET Czas = new.Czas WHERE ID_Zawodnika = @zawodnik AND ID_Konkurencji = @konkurencja;
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
