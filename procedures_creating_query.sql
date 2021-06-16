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
    IF type = 'TRENER' THEN
        UPDATE trener SET ID_Licencji = idLicencji WHERE ID_Trenera = persona;
    ELSEIF type = 'SEDZIA' THEN
        UPDATE sedzia SET ID_Licencji = idLicencji WHERE ID_Sedziego = persona;
    END IF;
END //
DELIMITER ;