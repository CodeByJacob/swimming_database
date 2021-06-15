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

#  -------------------------------------------------------------
#                           TABELE
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ KLUBPLYWACKI

CREATE TABLE IF NOT EXISTS KlubPlywacki (
  ID_Klubu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  Nazwa VARCHAR(50) NOT NULL,
  Adres VARCHAR(50) NOT NULL,
  IloscCzlonkow INTEGER DEFAULT NULL,
  DataPowstania DATE NOT NULL
) ENGINE = InnoDB;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ LICENCJA

CREATE TABLE IF NOT EXISTS Licencja (
  ID_Licencji INTEGER(5) AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  DataWaznosciLicencji DATE NOT NULL,
  Typ ENUM(
      'TRENER', # LICENCJA TRENERSKA
      'SEDZIA'  # LICENCJA TRENERSKA
      )
) ENGINE = InnoDB;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ OBIEKT

CREATE TABLE IF NOT EXISTS Obiekt (
    ID_Obiektu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Adres VARCHAR(50)  NOT NULL,
    Miasto VARCHAR(50) NOT NULL,
    Powierzchnia DECIMAL(10,2),
    IloscTorow INTEGER NOT NULL,
    RekordToru DECIMAL(5,2)
) ENGINE = InnoDB;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ SEDZIA

CREATE TABLE IF NOT EXISTS Sedzia (
    ID_Sedziego INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Imie VARCHAR(30)  NOT NULL,
    Nazwisko VARCHAR(40) NOT NULL,
    DataUrodzenia DATE NOT NULL,
    Plec ENUM(
      'M',  # MEZCZYZNA
      'K'   # KOBIETA
      ) NOT NULL,
    ID_Licencji INTEGER(5) NOT NULL
) ENGINE = InnoDB;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ TRENER

CREATE TABLE IF NOT EXISTS Trener (
  ID_Trenera INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Imie VARCHAR(30)  NOT NULL,
  Nazwisko VARCHAR(40) NOT NULL,
  DataUrodzenia DATE NOT NULL,
  Plec ENUM(
      'M',  # MEZCZYZNA
      'K'   # KOBIETA
      ) NOT NULL,
  ID_Licencji INTEGER(5) NOT NULL,
  ID_Klubu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDB;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ WYNIK

CREATE TABLE IF NOT EXISTS Wynik (
    ID_Wynik INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Pozycja INTEGER NOT NULL,
    Czas DECIMAL(5,2),
    ID_Etapu INTEGER(5) NOT NULL,
    ID_Zawodnika INTEGER(5) NOT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ ETAP

CREATE TABLE IF NOT EXISTS Etap (
    ID_Etapu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nrEtapu INTEGER NOT NULL,
    ID_Konkurencji INTEGER(5) NOT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ REKORDOSOBISTY

CREATE TABLE IF NOT EXISTS RekordOsobisty (
    ID_Rekordu INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_Zawodnika INTEGER(5) NOT NULL,
    ID_Konkurencji INTEGER(5) NOT NULL,
    DataWykonania YEAR,
    Czas DECIMAL(5,2) NOT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ ZAWODY

CREATE TABLE IF NOT EXISTS Zawody (
    ID_Zawodow INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Miasto VARCHAR(50) NOT NULL,
    Kraj VARCHAR(50) NOT NULL,
    Rok YEAR NOT NULL,
    Kod ENUM(
        'SOG',  # SUMMER OLYMPIC GAMES
        'WC',   # WORLD CUP
        'EC',   # EUROPEAN CUP
        'PC'    # POLISH CHAMPIONSHIPS
        ) NOT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ ZAWODNIK

CREATE TABLE IF NOT EXISTS Zawodnik (
    ID_Zawodnika INTEGER(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Imie VARCHAR(30)  NOT NULL,
    Nazwisko VARCHAR(40) NOT NULL,
    DataUrodzenia DATE NOT NULL,
    Plec ENUM(
      'M',  # MEZCZYZNA
      'K'   # KOBIETA
    ) NOT NULL,
    ID_Klubu INTEGER(5) DEFAULT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ ZAWODNIK_ZAWODY

CREATE TABLE IF NOT EXISTS Zawodnik_Zawody (
    ID_Zawodnika INTEGER(5) NOT NULL,
    ID_Zawodow INTEGER(5) NOT NULL
) ENGINE = InnoDb;

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  STRUKTURA TABELI REPREZENTUJACEJ KONKURENCJA

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

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#                        OGRANICZENIA
#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  SEDZIA

ALTER TABLE Sedzia
ADD CONSTRAINT FOREIGN KEY (ID_Licencji) REFERENCES Licencja(ID_Licencji);

#  -------------------------------------------------------------
#
#  -------------------------------------------------------------
#  TRENER

ALTER TABLE Trener
ADD CONSTRAINT FOREIGN KEY (ID_Klubu) REFERENCES KlubPlywacki(ID_Klubu) ON DELETE SET NULL,
ADD CONSTRAINT FOREIGN KEY (ID_Licencji) REFERENCES Licencja(ID_Licencji);

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# WYNIK

ALTER TABLE Wynik
ADD CONSTRAINT FOREIGN KEY (ID_Etapu) REFERENCES Etap(ID_Etapu),
ADD CONSTRAINT FOREIGN KEY (ID_Zawodnika) REFERENCES Zawodnik(ID_Zawodnika);

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# ETAP

ALTER TABLE Etap
ADD CONSTRAINT FOREIGN KEY (ID_Konkurencji) REFERENCES Konkurencja(ID_Konkurencji);

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# REKORDOSOBISTY

ALTER TABLE RekordOsobisty
ADD CONSTRAINT FOREIGN KEY (ID_Konkurencji) REFERENCES Konkurencja(ID_Konkurencji),
ADD CONSTRAINT FOREIGN KEY (ID_Zawodnika) REFERENCES Zawodnik(ID_Zawodnika);

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# ZAWODNIK

ALTER TABLE Zawodnik
ADD CONSTRAINT FOREIGN KEY (ID_Klubu) REFERENCES KlubPlywacki(ID_Klubu) ON DELETE SET NULL;

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# ZAWODNIK_ZAWODY

ALTER TABLE Zawodnik_Zawody
ADD CONSTRAINT FOREIGN KEY (ID_Zawodow) REFERENCES Zawody(ID_Zawodow),
ADD CONSTRAINT FOREIGN KEY (ID_Zawodnika) REFERENCES Zawodnik(ID_Zawodnika);

# -------------------------------------------------------------
#
# -------------------------------------------------------------
# KONKURENCJA

ALTER TABLE Konkurencja
ADD CONSTRAINT FOREIGN KEY (ID_Zawodow) REFERENCES Zawody(ID_Zawodow),
ADD CONSTRAINT FOREIGN KEY (ID_Sedziego) REFERENCES Sedzia(ID_Sedziego),
ADD CONSTRAINT FOREIGN KEY (ID_Obiektu) REFERENCES Obiekt(ID_Obiektu);

# -------------------------------------------------------------
