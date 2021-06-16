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
#             SKRYPT DODAJACY WARTOSCI DO TABEL W BAZIE DANYCH
#
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI LICENCJA
INSERT INTO pbd_plywanie.licencja(
     DataWaznosciLicencji,
     Typ
) VALUES ('2021-08-30', 'SEDZIA'),
    ('2023-09-25', 'SEDZIA'),
    ('2023-03-01', 'SEDZIA'),
    ('2022-07-30', 'TRENER'),
    ('2024-04-21', 'TRENER'),
    ('2025-11-07', 'TRENER');
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI KLUBPLYWACKI
INSERT INTO pbd_plywanie.klubplywacki(
     Nazwa,
     Adres,
     IloscCzlonkow,
     DataPowstania
) VALUES ('KlubRybka', 'Wodna 2, Warszawa', '3', '2015-06-03'),
         ('KlubPosejdon', 'Zimna 10, Wroclaw', '5', '2018-03-12'),
         ('KlubBoja', 'Ciepla 12, Poznan', '7', '2007-11-09');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ZAWODY
INSERT INTO pbd_plywanie.zawody(
     Miasto,
     Kraj,
     Rok,
     Kod
) VALUES ('Warszawa', 'Polska', '2021', 'EC'),
         ('Tarnow', 'Polska', '2020', 'WC'),
         ('Wroclaw', 'Polska', '2019', 'PC'),
         ('Krakow', 'Polska', '2018', 'SOG'),
         ('Gdansk', 'Polska', '2017', 'PC');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ZAWODNIK
INSERT INTO pbd_plywanie.zawodnik(
     Imie,
     Nazwisko,
     DataUrodzenia,
     Plec,
     ID_Klubu
) VALUES ('Mikolaj', 'Wariancki', '1990-05-12', 'M', '1'),
         ('Kamil', 'Warzecha', '1998-01-01', 'M', '1'),
         ('Tomasz', 'Korus', '1999-04-30', 'M', '1'),
         ('Katarzyna', 'Kuta', '1992-09-28', 'K', '2'),
         ('Konrad', 'Prandota', '2001-02-12', 'M', '2'),
         ('Michal', 'Bogucki', '2000-10-10', 'M', '2'),
         ('Natalia', 'Bugajska', '1997-08-19', 'K', '2'),
         ('Radoslaw', 'Galas', '2002-03-19', 'M', '2'),
         ('Kamila', 'Fraczek', '1999-02-02', 'K', '3'),
         ('Krzysztof', 'Kiwi', '1999-01-27', 'M', '3'),
         ('Małgorzata', 'Szybka', '2000-06-21', 'K', '3'),
         ('Marek', 'Grechuta', '2003-04-07', 'M', '3'),
         ('Michal', 'Faliszewski', '2005-10-15', 'M', '3'),
         ('Franciszek', 'Stopa', '2000-01-09', 'M', '3'),
         ('Oliwia', 'Brzoza', '2001-10-21', 'K', '3');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI SEDZIA
INSERT INTO pbd_plywanie.sedzia(
     Imie,
     Nazwisko,
     DataUrodzenia,
     Plec,
     ID_Licencji
) VALUES ('Jan', 'Kowalski', '1972-06-19', 'M','1'),
         ('Wladyslaw', 'Baran', '1979-03-22', 'M','2'),
         ('Jan', 'Kowalski', '1985-09-11', 'M','3');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI TRENER
INSERT INTO pbd_plywanie.trener(
     Imie,
     Nazwisko,
     DataUrodzenia,
     Plec,
     ID_Licencji,
     ID_Klubu
) VALUES ('Krzysztof', 'Walec', '1980-04-30', 'M','4','1'),
         ('Mieczyslaw', 'Grudka', '1989-07-21', 'M','5','2'),
         ('Mateusz', 'Gorski', '1990-01-22', 'M','6','3');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI OBIEKT
INSERT INTO pbd_plywanie.obiekt(
     Adres,
     Miasto,
     Powierzchnia,
     IloscTorow,
     RekordToru
) VALUES ('Mokra 5', 'Wrocław', '1282.0', '10','21.12'),
         ('Sucha 32', 'Krakow', '1350.0', '11','22.33'),
         ('Biala 44', 'Gdansk', '1411.0', '12','20.94'),
         ('Czarna 11', 'Tarnow', '890.0', '6','24.34');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI KONKURENCJA
INSERT INTO pbd_plywanie.konkurencja(
     Styl,
     Dystans,
     Kategoria,
     ID_Zawodow,
     ID_Sedziego,
     ID_Obiektu
) VALUES ('KLASYCZNY', '50M', 'INDYWIDUALNE', '1', '1', '1'),
         ('KLASYCZNY', '100M', 'INDYWIDUALNE', '2', '2', '2'),
         ('KLASYCZNY', '200M', 'INDYWIDUALNE', '3', '3', '3'),
         ('KLASYCZNY', '400M', 'INDYWIDUALNE', '4', '1', '4'),
         ('KLASYCZNY', '10KM', 'INDYWIDUALNE', '5', '2', '1'),
         ('KRAUL', '50M', 'INDYWIDUALNE', '1', '1', '2'),
         ('KRAUL', '100M', 'INDYWIDUALNE', '2', '2', '3'),
         ('KRAUL', '200M', 'INDYWIDUALNE', '3', '3', '4'),
         ('KRAUL', '400M', 'INDYWIDUALNE', '4', '1', '1'),
         ('KRAUL', '10KM', 'INDYWIDUALNE', '5', '2', '2'),
         ('GRZBIETOWY', '50M', 'INDYWIDUALNE', '1', '3', '3'),
         ('GRZBIETOWY', '100M', 'INDYWIDUALNE', '2', '1', '4'),
         ('GRZBIETOWY', '200M', 'INDYWIDUALNE', '3', '2', '1'),
         ('GRZBIETOWY', '400M', 'INDYWIDUALNE', '4', '3', '2'),
         ('GRZBIETOWY', '10KM', 'INDYWIDUALNE', '5', '1', '3'),
         ('MOTYLKOWY', '50M', 'INDYWIDUALNE', '1', '2', '4'),
         ('MOTYLKOWY', '100M', 'INDYWIDUALNE', '2', '3', '1'),
         ('MOTYLKOWY', '200M', 'INDYWIDUALNE', '3', '1', '2'),
         ('MOTYLKOWY', '400M', 'INDYWIDUALNE', '4', '2', '3'),
         ('MOTYLKOWY', '10KM', 'INDYWIDUALNE', '5', '3', '4'),
         ('DOWOLNY', '50M', 'INDYWIDUALNE', '1', '1', '1'),
         ('DOWOLNY', '100M', 'INDYWIDUALNE', '2', '2', '2'),
         ('DOWOLNY', '200M', 'INDYWIDUALNE', '3', '3', '3'),
         ('DOWOLNY', '400M', 'INDYWIDUALNE', '4', '1', '4'),
         ('DOWOLNY', '10KM', 'INDYWIDUALNE', '5', '2', '1'),


         ('KLASYCZNY', '50M', 'SZTAFETA', '1', '1', '1'),
         ('KLASYCZNY', '100M', 'SZTAFETA', '2', '2', '1'),
         ('KLASYCZNY', '200M', 'SZTAFETA', '3', '3', '1'),
         ('KLASYCZNY', '400M', 'SZTAFETA', '4', '1', '1'),
         ('KLASYCZNY', '10KM', 'SZTAFETA', '5', '2', '1'),
         ('KRAUL', '50M', 'SZTAFETA', '1', '3', '1'),
         ('KRAUL', '100M', 'SZTAFETA', '2', '1', '1'),
         ('KRAUL', '200M', 'SZTAFETA', '3', '2', '1'),
         ('KRAUL', '400M', 'SZTAFETA', '4', '3', '1'),
         ('KRAUL', '10KM', 'SZTAFETA', '5', '1', '1'),
         ('GRZBIETOWY', '50M', 'SZTAFETA', '1', '2', '1'),
         ('GRZBIETOWY', '100M', 'SZTAFETA', '2', '3', '1'),
         ('GRZBIETOWY', '200M', 'SZTAFETA', '3', '1', '1'),
         ('GRZBIETOWY', '400M', 'SZTAFETA', '4', '2', '1'),
         ('GRZBIETOWY', '10KM', 'SZTAFETA', '5', '3', '1'),
         ('MOTYLKOWY', '50M', 'SZTAFETA', '1', '1', '1'),
         ('MOTYLKOWY', '100M', 'SZTAFETA', '2', '2', '1'),
         ('MOTYLKOWY', '200M', 'SZTAFETA', '3', '3', '1'),
         ('MOTYLKOWY', '400M', 'SZTAFETA', '4', '1', '1'),
         ('MOTYLKOWY', '10KM', 'SZTAFETA', '5', '2', '1'),
         ('DOWOLNY', '50M', 'SZTAFETA', '1', '3', '1'),
         ('DOWOLNY', '100M', 'SZTAFETA', '2', '1', '1'),
         ('DOWOLNY', '200M', 'SZTAFETA', '3', '2', '1'),
         ('DOWOLNY', '400M', 'SZTAFETA', '4', '3', '1'),
         ('DOWOLNY', '10KM', 'SZTAFETA', '5', '1', '1');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ETAP

INSERT INTO pbd_plywanie.etap(
     nrEtapu,
     ID_Konkurencji
) VALUES ('1', '1'),
         ('2', '1'),
         ('3', '1'),
         ('4', '1'),
         ('1', '2'),
         ('2', '2'),
         ('3', '2'),
         ('4', '2'),
         ('1', '3'),
         ('2', '3'),
         ('3', '3'),
         ('4', '3'),
         ('1', '4'),
         ('2', '4'),
         ('3', '4'),
         ('4', '4'),
         ('1', '5'),
         ('2', '5'),
         ('3', '5'),
         ('4', '5'),
         ('1', '6'),
         ('2', '6'),
         ('3', '6'),
         ('4', '6'),
         ('1', '7'),
         ('2', '7'),
         ('3', '7'),
         ('4', '7'),
         ('1', '8'),
         ('2', '8'),
         ('3', '8'),
         ('4', '8'),
         ('1', '9'),
         ('2', '9'),
         ('3', '9'),
         ('4', '9'),
         ('1', '10'),
         ('2', '10'),
         ('3', '10'),
         ('4', '10');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI WYNIK
INSERT INTO pbd_plywanie.wynik(
     Pozycja,
     Czas,
     ID_Etapu,
     ID_Zawodnika
) VALUES ('10', '25.3', '1', '1'),
         ('9', '25.1', '4', '2'),
         ('8', '24.9', '3', '3'),
         ('7', '24.6', '1', '4'),
         ('6', '23.1', '2', '5'),
         ('1', '21.7', '6', '6'),
         ('4', '23.9', '1', '2'),
         ('1', '22.9', '1', '4'),
         ('1', '22.3', '5', '2'),
         ('1', '21.4', '1', '1'),
         ('2', '23.9', '21', '5'),
         ('2', '23.8', '1', '3'),
         ('2', '23.9', '9', '1');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI REKORDOSOBISTY
INSERT INTO pbd_plywanie.rekordosobisty(
     ID_Zawodnika,
     ID_Konkurencji,
     DataWykonania,
     Czas
) VALUES ('1', '1', '2021', '21.4'),
         ('2', '2', '2020', '22.3'),
         ('3', '3', '2019', '23.8'),
         ('4', '4', '2018', '22.9'),
         ('5', '4', '2018', '23.1'),
         ('6', '3', '2019', '21.7');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ZAWODNIK_ZAWODY
INSERT INTO pbd_plywanie.zawodnik_zawody(
     ID_Zawodnika,
     ID_Zawodow
) VALUES ('1', '1'),
         ('2', '1'),
         ('3', '1'),
         ('4', '1'),
         ('5', '1'),
         ('6', '1'),
         ('7', '1'),
         ('8', '1'),
         ('9', '1'),
         ('10', '1'),
         ('1', '2'),
         ('2', '2'),
         ('3', '2'),
         ('4', '2'),
         ('5', '2'),
         ('6', '2'),
         ('7', '2'),
         ('8', '2'),
         ('9', '2'),
         ('10', '2'),
         ('1', '3'),
         ('2', '3'),
         ('3', '3'),
         ('4', '3'),
         ('5', '3'),
         ('6', '3'),
         ('7', '3'),
         ('8', '3'),
         ('9', '3'),
         ('10', '3');

