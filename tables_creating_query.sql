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
--               SKRYPT DODAJACY TABELE DO BAZY DANYCH
--
-- -------------------------------------------------------------

-- -------------------------------------------------------------
--                          TABELE
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ KLUB_PLYWACKI

CREATE TABLE IF NOT EXISTS pbd_plywanie.KlubPlywacki (
  ID_Klubu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  Nazwa VARCHAR(50) NOT NULL,
  Adres VARCHAR(50) NOT NULL,
  IloscCzlonkow INTEGER DEFAULT NULL,
  DataPowstania DATE NOT NULL,
  Kapital DECIMAL(10,2) NOT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ OBIEKT



-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ Sedzia


-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- STRUKTURA TABELI REPREZENTUJACEJ ZAWODY

CREATE TABLE IF NOT EXISTS pbd_plywanie.Zawody (
    ID_Zawodow INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL ,
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
-- STRUKTURA TABELI REPREZENTUJACEJ TRENERA

CREATE TABLE IF NOT EXISTS pbd_plywanie.Trener (
  ID_Trenera INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  Imie VARCHAR(30)  NOT NULL,
  Nazwisko VARCHAR(40) NOT NULL,
  DataUrodzenia DATE NOT NULL,
  Plec ENUM(
      'M',  -- MEZCZYZNA
      'K'   -- KOBIETA
      ) NOT NULL,
  DataWaznosciLicencji DATE NOT NULL,
  ID_Klubu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------

-- -------------------------------------------------------------
--                          KLUCZE OBCE
-- -------------------------------------------------------------

-- -------------------------------------------------------------

ALTER TABLE pbd_plywanie.Trener
ADD CONSTRAINT FOREIGN KEY (ID_Klubu) REFERENCES KlubPlywacki(ID_Klubu);

-- -------------------------------------------------------------