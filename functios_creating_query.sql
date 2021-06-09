#  -------------------------------------------------------------
#       REALIZACJA PROJEKTU Z PRZEDMIOTU PODSTAWY BAZ DANYCH
#               W ROKU AKADEMICKIM 2020/2021 SEMESTR IV
#                           TEMAT PROJEKTU :
#                              "PLYWANIE"
#  -------------------------------------------------------------
#
#  REALIZUJACY PROJEKT :
#
#  ALEKSANDRA BABIARSKA
#  MATEUSZ GOCAŁ
#  JAKUB SZOSTAK
#  JAKUB WOJTAŚ
#
#  -------------------------------------------------------------
#  -------------------------------------------------------------
#
#             SKRYPT DODAJACY TABELE DO BAZY DANYCH
#
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#                         BAZA DANYCH
#  -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS pbd_plywanie CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE pbd_plywanie;

# --------------------------------------------------------------
#  FUNKCJE ZLICZAJACE CZLONKOW

DELIMITER //
CREATE FUNCTION zliczCzlonkowPoNazwie ( nazwaklubu VARCHAR(50))
RETURNS INT
RETURN (SELECT COUNT(*) FROM trener NATURAL JOIN klubplywacki k WHERE k.Nazwa = nazwaklubu ) +
       (SELECT COUNT(*) FROM zawodnik NATURAL JOIN klubplywacki k WHERE k.Nazwa = nazwaklubu );
DELIMITER ;

DELIMITER //
CREATE FUNCTION zliczCzlonkowPoID ( idklubu INT(5))
RETURNS INT
RETURN (SELECT COUNT(*) FROM trener WHERE ID_Klubu = idklubu) +
       (SELECT COUNT(*) FROM zawodnik WHERE ID_Klubu = idklubu );
DELIMITER ;

