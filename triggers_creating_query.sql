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
        SET @oldtime = (SELECT r.czas FROM rekordOsobisty r JOIN konkurencja k on k.ID_Konkurencji =
            (SELECT kk.ID_Konkurencji FROM konkurencja kk JOIN etap e on r.ID_Konkurencji = e.ID_Konkurencji
            WHERE e.ID_Etapu = new.ID_Etapu));

        IF(@oldtime > new.Czas) THEN
            UPDATE rekordosobisty SET Czas = new.Czas, rekordosobisty.ID_Konkurencji = (SELECT ID_Konkurencji FROM etap WHERE etap.ID_Etapu = new.ID_Etapu);
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
