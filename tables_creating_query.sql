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
--            SKRYPT DODAJACY TABELE DO BAZY DANYCH
--
-- -------------------------------------------------------------

-- -------------------------------------------------------------
--                        BAZA DANYCH
-- -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS pbd_plywanie CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE pbd_plywanie;

-- -------------------------------------------------------------
--                          TABELE
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ KLUBPLYWACKI

CREATE TABLE IF NOT EXISTS KlubPlywacki (
  ID_Klubu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Nazwa VARCHAR(50) NOT NULL,
  Adres VARCHAR(50) NOT NULL,
  IloscCzlonkow INTEGER DEFAULT NULL,
  DataPowstania DATE NOT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ LICENCJA

CREATE TABLE IF NOT EXISTS Licencja (
  ID_Licencji INTEGER(5) AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  DataWaznosciLicencji DATE NOT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ OBIEKT



-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ SEDZIA


-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ TRENER

CREATE TABLE IF NOT EXISTS Trener (
  ID_Trenera INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Imie VARCHAR(30)  NOT NULL,
  Nazwisko VARCHAR(40) NOT NULL,
  DataUrodzenia DATE NOT NULL,
  Plec ENUM(
      'M',  -- MEZCZYZNA
      'K'   -- KOBIETA
      ) NOT NULL,
  ID_Licencji INTEGER(5) NOT NULL,
  ID_Klubu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ WYNIK


-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ ETAP


-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ REKORDOSOBISTY


-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ ZAWODY

CREATE TABLE IF NOT EXISTS Zawody (
    ID_Zawodow INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Miasto VARCHAR(50) NOT NULL,
    Kraj VARCHAR(50) NOT NULL,
    Rok YEAR NOT NULL,
    Kod ENUM(
        'SOG',  -- SUMMER OLYMPIC GAMES
        'WC',   -- WORLD CUP
        'EC',   -- EUROPEAN CUP
        'PC'    -- POLISH CHAMPIONSHIPS
        ) NOT NULL
) ENGINE = InnoDb;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ ZAWODNIK

CREATE TABLE IF NOT EXISTS Zawodnik (
    ID_Zawodnika INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Imie VARCHAR(30)  NOT NULL,
    Nazwisko VARCHAR(40) NOT NULL,
    DataUrodzenia DATE NOT NULL,
    Plec ENUM(
      'M',  -- MEZCZYZNA
      'K'   -- KOBIETA
    ) NOT NULL,
    ID_Klubu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDb;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ ZAWODNIK_ZAWODY

CREATE TABLE IF NOT EXISTS Zawodnik_Zawody (
    ID_Zawodnika INTEGER(5) NOT NULL,
    ID_Zawodow INTEGER(5) NOT NULL
) ENGINE = InnoDb;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ KONKURENCJA

CREATE TABLE IF NOT EXISTS Konkurencja (
    ID_Konkurencji INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Styl ENUM(
        'KRAUL',
        'KLASYCZNY',
        'GRZBIETOWY',
        'MOTYLKOWY',
        'DOWOLONY'
    ) NOT NULL,
    Dystans ENUM(
        '50M',
        '100M',
        '200M',
        '400M',
        '10KM'
    ) NOT NULL,
    Kategoria ENUM(
        'SZTAFETA',
        'INDYWIDUALNE'
    ) NOT NULL,
    ID_Zawodow INTEGER(5) DEFAULT NULL,
    ID_Sedziego INTEGER(5) DEFAULT NULL,
    ID_Obiektu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
--                       OGRANICZENIA
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- TRENER

ALTER TABLE Trener
ADD CONSTRAINT FOREIGN KEY (ID_Klubu) REFERENCES KlubPlywacki(ID_Klubu),
ADD CONSTRAINT FOREIGN KEY (ID_Licencji) REFERENCES Licencja(ID_Licencji);
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- KONKURENCJA

ALTER TABLE Konkurencja
ADD CONSTRAINT FOREIGN KEY (ID_Zawodow) REFERENCES Zawody(ID_Zawodow) -- ,
-- ADD CONSTRAINT FOREIGN KEY (ID_Sedziego) REFERENCES Sedzia(ID_Sedziego),
-- ADD CONSTRAINT FOREIGN KEY (ID_Obiektu) REFERENCES Obiekt(ID_Obiekt)
;
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- Zawodnik_Zawody

ALTER TABLE Zawodnik_Zawody
ADD CONSTRAINT FOREIGN KEY (ID_Zawodow) REFERENCES Zawody(ID_Zawodow),
ADD CONSTRAINT FOREIGN KEY (ID_Zawodnika) REFERENCES Zawodnik(ID_Zawodnika);
-- -------------------------------------------------------------

-- -------------------------------------------------------------