-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2021 at 10:19 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p1_plywanie`
--

-- --------------------------------------------------------

--
-- Table structure for table `klubplywacki`
--

CREATE TABLE `klubplywacki` (
  `ID_Klubu` int(10) NOT NULL,
  `Nazwa` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Adres` varchar(40) CHARACTER SET latin1 NOT NULL,
  `IloscCzlonkow` int(255) DEFAULT NULL,
  `DataPowstania` date NOT NULL,
  `Kapital` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trener`
--

CREATE TABLE `trener` (
  `ID_Trenera` int(10) NOT NULL,
  `Imie` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Nazwisko` varchar(40) CHARACTER SET latin1 NOT NULL,
  `DataUrodzenia` date NOT NULL,
  `Plec` enum('mezczyzna','kobieta') CHARACTER SET latin1 NOT NULL,
  `DataWaznosciLicencji` date NOT NULL,
  `ID_Klubu` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klubplywacki`
--
ALTER TABLE `klubplywacki`
  ADD PRIMARY KEY (`ID_Klubu`);

--
-- Indexes for table `trener`
--
ALTER TABLE `trener`
  ADD PRIMARY KEY (`ID_Trenera`),
  ADD KEY `ID_Klubu` (`ID_Klubu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
