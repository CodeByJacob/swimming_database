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
) VALUES ('2021-07-30', 'SEDZIA');
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI KLUBPLYWACKI
INSERT INTO pbd_plywanie.klubplywacki(
     Nazwa,
     Adres,
     IloscCzlonkow,
     DataPowstania
) VALUES ('KlubRybka', 'Wodna 2, Warszawa', '7', '2015-06-03');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ZAWODY
INSERT INTO pbd_plywanie.zawody(
     ID_Zawodow,
     Miasto,
     Kraj,
     Rok,
     Kod
) VALUES ('1', 'Warszawa', 'Polska', '2021', 'EC');
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
) VALUES ('Mikolaj', 'Wariancki', '1990-05-12', 'M', '1');
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
) VALUES ('Jan', 'Kowalski', '1972-06-19', 'M','1');
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
) VALUES ('Krzysztof', 'Walec', '1980-04-30', 'M','1','1');
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
) VALUES ('Mokra 5', 'Wrocław', '1282.0', '10','20.94');
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
) VALUES ('klasyczny', '50M', 'INDYWIDUALNE', '1', '1', '1');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ETAP

INSERT INTO pbd_plywanie.etap(
     nrEtapu,
     ID_Konkurencji
) VALUES ('1', '1');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI WYNIK
INSERT INTO pbd_plywanie.wynik(
     Pozycja,
     Czas,
     ID_Etapu,
     ID_Zawodnika
) VALUES ('1', '25.3', '1', '1');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI REKORDOSOBISTY
INSERT INTO pbd_plywanie.rekordosobisty(
     ID_Zawodnika,
     ID_Konkurencji,
     DataWykonania,
     Czas
) VALUES ('1', '1', '2020', '1.4');
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA WARTOSCI DODAWANYCH DO TABELI ZAWODNIK_ZAWODY
INSERT INTO pbd_plywanie.zawodnik_zawody(
     ID_Zawodnika,
     ID_Zawodow
) VALUES ('1', '1');

