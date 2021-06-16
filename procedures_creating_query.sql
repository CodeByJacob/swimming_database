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
#           SKRYPT DODAJACY PROCEDURY DO BAZY DANYCH
#
# -------------------------------------------------------------
#
# -------------------------------------------------------------
#                         BAZA DANYCH
# -------------------------------------------------------------

USE pbd_plywanie;

# --------------------------------------------------------------
# USTAWIANIE LICENCJI

DELIMITER //
CREATE PROCEDURE ustawLicencje(IN persona INT(5), IN idLicencji INT(5), IN type ENUM('TRENER','SEDZIA'))
BEGIN
    DECLARE poprawneDane BOOLEAN DEFAULT FALSE;
    IF type = 'TRENER' THEN
        SET poprawneDane = (SELECT TRUE IF EXISTS ( SELECT ID_Trenera FROM Trener WHERE ID_Trenera = persona));
    END IF;
END //
DELIMITER ;