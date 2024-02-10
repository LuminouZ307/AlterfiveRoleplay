-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2024 at 09:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fivemproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `pID` int(12) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Health` float NOT NULL DEFAULT 100,
  `Interior` int(8) NOT NULL DEFAULT 0,
  `World` int(8) NOT NULL DEFAULT 0,
  `UCP` varchar(22) NOT NULL,
  `Birthdate` varchar(32) NOT NULL,
  `Origin` varchar(22) NOT NULL DEFAULT 'None',
  `Gender` int(3) NOT NULL DEFAULT 0,
  `Skin` int(4) NOT NULL DEFAULT 0,
  `Armour` float NOT NULL DEFAULT 0,
  `Hunger` float NOT NULL DEFAULT 100,
  `Thirst` float NOT NULL DEFAULT 100,
  `Number` varchar(15) NOT NULL,
  `Battery` int(3) NOT NULL DEFAULT 100,
  `LastExitTime` int(8) NOT NULL DEFAULT 0,
  `LastDeposit` varchar(24) NOT NULL,
  `LastWithdraw` varchar(24) NOT NULL,
  `LastTransfer` varchar(24) NOT NULL,
  `LastTransferAmount` int(8) NOT NULL DEFAULT 0,
  `BankMoney` int(8) NOT NULL DEFAULT 0,
  `BankNumber` int(8) NOT NULL DEFAULT 0,
  `FactionID` int(2) NOT NULL DEFAULT 0,
  `FactionRank` int(2) NOT NULL DEFAULT 0,
  `FactionSkin` int(3) NOT NULL DEFAULT 0,
  `Injured` int(2) NOT NULL DEFAULT 0,
  `FactionBadge` int(4) NOT NULL DEFAULT 0,
  `pDoor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`pID`, `Name`, `PosX`, `PosY`, `PosZ`, `Health`, `Interior`, `World`, `UCP`, `Birthdate`, `Origin`, `Gender`, `Skin`, `Armour`, `Hunger`, `Thirst`, `Number`, `Battery`, `LastExitTime`, `LastDeposit`, `LastWithdraw`, `LastTransfer`, `LastTransferAmount`, `BankMoney`, `BankNumber`, `FactionID`, `FactionRank`, `FactionSkin`, `Injured`, `FactionBadge`, `pDoor`) VALUES
(1, 'Finn_Xanderz', 1219.72, -1395.57, 13.1927, 100, 0, 0, 'vyn', '53', '', 1, 299, 28.52, -0, -0.01, '08138099412', 100, 1707594232, '0', '0', '0', 0, 10000000, 123, 1, 6, 155, 0, 0, 0),
(2, 'Andhra_Atalaric', 1635.97, -2320.06, 13.3828, 100, 0, 0, 'vyn', '48', '', 1, 240, 100, 95.26, 96.21, '', 100, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Jav_Cop', 0, 0, 0, 100, 0, 0, 'vyn', '', 'None', 0, 0, 0, 100, 100, '', 100, 0, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Chakra_Adhiyoga', 2882.4, -846.101, 10.8757, 100, 0, 0, 'akira', '52', 'None', 0, 0, 0, 85.84, 88.7, '', 100, 1702979752, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Ewe_Fugsa', 1636.57, -2315.89, 13.3864, 100, 0, 0, 'Chakra_Adhiyoga', '50', '', 1, 240, 100, 99.65, 99.72, '081368775277', 100, 1702375580, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dealer_vehicle`
--

CREATE TABLE `dealer_vehicle` (
  `ID` int(11) NOT NULL,
  `Model` int(2) NOT NULL DEFAULT 0,
  `Name` varchar(24) NOT NULL,
  `Price` int(8) NOT NULL DEFAULT 0,
  `Color1` int(3) NOT NULL DEFAULT 0,
  `Color2` int(3) NOT NULL DEFAULT 0,
  `Speed` float NOT NULL DEFAULT 0,
  `Type` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dealer_vehicle`
--

INSERT INTO `dealer_vehicle` (`ID`, `Model`, `Name`, `Price`, `Color1`, `Color2`, `Speed`, `Type`) VALUES
(1, 560, 'Mitsubishi Lancer EVO X', 10, 6, 66, 130, 1),
(2, 562, 'Nissan Skyline R32', 20, 3, 33, 150, 1),
(3, 562, 'Nissan Skyline R32', 0, 3, 3, 160, 1),
(4, 411, 'Honda NSX', 0, 6, 6, 150, 3),
(5, 411, 'Honda NSX', 0, 2, 2, 160, 2),
(6, 411, 'Infernus', 0, 160, 160, 160, 0),
(7, 560, '', 10, 6, 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doors`
--

CREATE TABLE `doors` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `InteriorExt` int(3) NOT NULL DEFAULT 0,
  `WorldExt` int(3) NOT NULL DEFAULT 0,
  `Caption` varchar(64) NOT NULL,
  `WorldInt` int(3) NOT NULL DEFAULT 0,
  `InteriorInt` int(3) NOT NULL DEFAULT 0,
  `InteriorX` float NOT NULL DEFAULT 0,
  `InteriorY` float NOT NULL DEFAULT 0,
  `InteriorZ` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doors`
--

INSERT INTO `doors` (`ID`, `X`, `Y`, `Z`, `InteriorExt`, `WorldExt`, `Caption`, `WorldInt`, `InteriorInt`, `InteriorX`, `InteriorY`, `InteriorZ`) VALUES
(2, 1638.23, -2318.74, 13.383, 0, 0, 'anjinklah', 31, 0, 1647.21, -2319.48, 13.3828);

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `ID` int(5) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Type` int(2) NOT NULL DEFAULT 0,
  `World` int(2) NOT NULL DEFAULT 0,
  `Interior` int(2) NOT NULL DEFAULT 0,
  `Ranks` int(2) NOT NULL DEFAULT 0,
  `LockerX` float NOT NULL DEFAULT 0,
  `LockerY` float NOT NULL DEFAULT 0,
  `LockerZ` float NOT NULL DEFAULT 0,
  `FactionAmmo1` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo2` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo3` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo4` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo5` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo6` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo7` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo8` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo9` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo10` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo11` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo12` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo13` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo14` int(3) NOT NULL DEFAULT 0,
  `FactionAmmo15` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon1` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon2` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon3` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon4` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon5` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon6` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon7` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon8` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon9` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon10` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon11` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon12` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon13` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon14` int(3) NOT NULL DEFAULT 0,
  `FactionWeapon15` int(3) NOT NULL DEFAULT 0,
  `FactionSkin1` int(3) NOT NULL DEFAULT 0,
  `FactionSkin2` int(3) NOT NULL DEFAULT 0,
  `FactionSkin3` int(3) NOT NULL DEFAULT 0,
  `FactionSkin4` int(3) NOT NULL DEFAULT 0,
  `FactionSkin5` int(3) NOT NULL DEFAULT 0,
  `FactionSkin6` int(3) NOT NULL DEFAULT 0,
  `FactionSkin7` int(3) NOT NULL DEFAULT 0,
  `FactionSkin8` int(3) NOT NULL DEFAULT 0,
  `FactionSkin9` int(3) NOT NULL DEFAULT 0,
  `FactionSkin10` int(3) NOT NULL DEFAULT 0,
  `FactionSkin11` int(3) NOT NULL DEFAULT 0,
  `FactionSkin12` int(3) NOT NULL DEFAULT 0,
  `FactionSkin13` int(3) NOT NULL DEFAULT 0,
  `FactionSkin14` int(3) NOT NULL DEFAULT 0,
  `FactionSkin15` int(3) NOT NULL DEFAULT 0,
  `FactionRank1` varchar(64) NOT NULL,
  `FactionRank2` varchar(64) NOT NULL,
  `FactionRank3` varchar(64) NOT NULL,
  `FactionRank4` varchar(64) NOT NULL,
  `FactionRank5` varchar(64) NOT NULL,
  `FactionRank6` varchar(64) NOT NULL,
  `FactionRank7` varchar(64) NOT NULL,
  `FactionRank8` varchar(64) NOT NULL,
  `FactionRank9` varchar(64) NOT NULL,
  `FactionRank10` varchar(64) NOT NULL,
  `FactionRank11` varchar(64) NOT NULL,
  `FactionRank12` varchar(64) NOT NULL,
  `FactionRank13` varchar(64) NOT NULL,
  `FactionRank14` varchar(64) NOT NULL,
  `FactionRank15` varchar(64) NOT NULL,
  `FactionColor` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`ID`, `Name`, `Type`, `World`, `Interior`, `Ranks`, `LockerX`, `LockerY`, `LockerZ`, `FactionAmmo1`, `FactionAmmo2`, `FactionAmmo3`, `FactionAmmo4`, `FactionAmmo5`, `FactionAmmo6`, `FactionAmmo7`, `FactionAmmo8`, `FactionAmmo9`, `FactionAmmo10`, `FactionAmmo11`, `FactionAmmo12`, `FactionAmmo13`, `FactionAmmo14`, `FactionAmmo15`, `FactionWeapon1`, `FactionWeapon2`, `FactionWeapon3`, `FactionWeapon4`, `FactionWeapon5`, `FactionWeapon6`, `FactionWeapon7`, `FactionWeapon8`, `FactionWeapon9`, `FactionWeapon10`, `FactionWeapon11`, `FactionWeapon12`, `FactionWeapon13`, `FactionWeapon14`, `FactionWeapon15`, `FactionSkin1`, `FactionSkin2`, `FactionSkin3`, `FactionSkin4`, `FactionSkin5`, `FactionSkin6`, `FactionSkin7`, `FactionSkin8`, `FactionSkin9`, `FactionSkin10`, `FactionSkin11`, `FactionSkin12`, `FactionSkin13`, `FactionSkin14`, `FactionSkin15`, `FactionRank1`, `FactionRank2`, `FactionRank3`, `FactionRank4`, `FactionRank5`, `FactionRank6`, `FactionRank7`, `FactionRank8`, `FactionRank9`, `FactionRank10`, `FactionRank11`, `FactionRank12`, `FactionRank13`, `FactionRank14`, `FactionRank15`, `FactionColor`) VALUES
(1, 'Pedagang', 5, 0, 0, 6, 1220.27, -1377.53, 13.6477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', -2686806);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` int(11) NOT NULL,
  `ExtraID` int(11) DEFAULT 0,
  `Name` varchar(32) DEFAULT NULL,
  `Amount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID`, `ExtraID`, `Name`, `Amount`) VALUES
(1, 1, 'Guzzle_Combo', 1),
(2, 1, 'Uang', 100000),
(3, 1, 'Handphone', 1);

-- --------------------------------------------------------

--
-- Table structure for table `playerucp`
--

CREATE TABLE `playerucp` (
  `ID` int(12) NOT NULL,
  `UCP` varchar(22) NOT NULL,
  `Password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `playerucp`
--

INSERT INTO `playerucp` (`ID`, `UCP`, `Password`) VALUES
(6, 'vyn', '$2y$12$qxXojzWlU2g0dkxXyVCXie.ChSVAnWdsNHlii6tISupaFE.Sy5CES'),
(7, 'Udin_Jabrig', '$2y$12$VtDWWaErTw6ElLJ1LX074OP/6jN977HbNPjUHvjZlOCvALRtCs/tm'),
(8, 'Aasdasdas_Adasdasda', '$2y$12$4mJf0HEOjny2yvsz5pvP4eZ4qFj2BBi3LPYo02hbZGrorSVzjljUK'),
(9, 'Ewe_Ewe', '$2y$12$FVGmIlr3nVIKkX3IQFvNpumFTh0RgBjFpiGrplH3eCz6rMUR8fQf.'),
(10, 'akira', '$2y$12$G2rZSqk4a8vZLTJexcFLxem./1B6vGOHrUTn3Je78J.7ilCZYQp/O'),
(11, 'Chakra_Adhiyoga', '$2y$12$q04zxzneAp7QXFdaa8huTOaNXzwJ9ttYxKa0Jw8pi1saj0FFqxZ3y');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `R` float NOT NULL DEFAULT 0,
  `Type` int(3) NOT NULL DEFAULT 0,
  `Interior` int(3) NOT NULL DEFAULT 0,
  `World` int(3) NOT NULL DEFAULT 0,
  `Name` varchar(64) NOT NULL,
  `Skin` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`ID`, `X`, `Y`, `Z`, `R`, `Type`, `Interior`, `World`, `Name`, `Skin`) VALUES
(1, 1311.65, -892.309, 39.5781, 271.326, 1, 0, 0, 'Vinewood 24/7', 171),
(2, 398.45, -1526.23, 32.2872, 137.247, 1, 0, 0, 'Rodeo 24/7', 171),
(3, 321.451, -1380.71, 14.2003, 209.474, 1, 0, 0, 'adsa', 171),
(4, 318.668, -1384.51, 14.1822, 128.956, 2, 0, 0, 'dsad', 171);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int(12) NOT NULL,
  `Model` int(3) NOT NULL DEFAULT 400,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `PosA` float NOT NULL DEFAULT 0,
  `Color1` int(3) NOT NULL DEFAULT 1,
  `Color2` int(3) NOT NULL DEFAULT 1,
  `World` int(3) NOT NULL DEFAULT 0,
  `Interior` int(3) NOT NULL DEFAULT 0,
  `Name` varchar(24) NOT NULL DEFAULT 'NotCustom',
  `Type` int(2) NOT NULL DEFAULT 0,
  `ExtraID` int(3) NOT NULL DEFAULT 0,
  `State` int(2) NOT NULL DEFAULT 0,
  `Fuel` float NOT NULL DEFAULT 0,
  `Plate` varchar(36) NOT NULL,
  `MaxSpeed` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`ID`, `Model`, `PosX`, `PosY`, `PosZ`, `PosA`, `Color1`, `Color2`, `World`, `Interior`, `Name`, `Type`, `ExtraID`, `State`, `Fuel`, `Plate`, `MaxSpeed`) VALUES
(1, 411, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(2, 562, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(3, 522, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(4, 411, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(5, 461, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(6, 411, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(7, 411, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(8, 411, 1985.02, -2062.21, 13.08, 89.2, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(9, 560, 1971.9, -1931.11, 13.05, 268.54, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 0, '', 0),
(10, 560, 1967.81, -2051.83, 13.19, 15.76, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(11, 560, 1187.11, -1328.49, 13.23, 340.28, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(12, 560, 1822.16, -1747.8, 13.05, 272.49, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(13, 522, 988.9, -1846.16, 12.23, 158.5, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(14, 522, 1580.22, -1621.72, 27.92, 182.17, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(15, 522, 1544.59, -1631.8, 12.7, 101.44, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(16, 522, 1220.14, -1387.05, 12.76, 262.17, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(17, 522, 1638.76, -2330.86, 13.55, 54.29, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(18, 521, 1347.69, -2322.4, 13.38, 209.29, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(19, 522, 1936.91, -1776.64, 12.98, 51.03, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(20, 522, 1871.81, -1746.8, 12.87, 290.48, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(21, 521, 1040.5, -1798.31, 13.17, 158.75, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(22, 522, 1625.09, -2324.27, 13.55, 84.15, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(23, 560, 1605.08, -2319.09, 13.38, 76.81, 1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(24, 560, 1973.9, -2049.37, 13.22, 238.79, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(25, 560, 1047.51, -1890.8, 12.69, 33.73, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(26, 560, 925.89, -1787.62, 13.06, 76.25, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(27, 562, 878.44, -1783.39, 13.25, 68.92, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(28, 560, 901.24, -1784.96, 13.09, 268.18, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(29, 562, 697.34, -1750.67, 13.15, 60.3, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(30, 560, 679.99, -1167.97, 14.81, 327.41, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(31, 550, 596.02, -1218.72, 17.35, 107.56, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(32, 560, 554.71, -1245.01, 16.63, 125.82, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(33, 560, 628.07, -1214.62, 17.78, 295.88, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(34, 562, 771, -1060.88, 24.15, 324.49, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(35, 547, 691.39, -1141.51, 15.46, 152.04, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(36, 560, 646.45, -1883.36, 3.69, 183.75, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(37, 560, 1083.53, -957.51, 42.05, 252.65, 5, 5, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(38, 596, 627.39, -1256.2, 16.92, 279.75, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(39, 426, 628.92, -1239.9, 17.49, 6.58, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(40, 547, 792.52, -1169.42, 22.42, 175.67, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(41, 598, 797.15, -1202.31, 17.81, 184.86, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(42, 597, 846.26, -1399.56, 12.89, 268.65, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(43, 411, 520.79, -1389.59, 15.61, 202.78, -1, -1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(44, 562, 951.81, -1320.32, 13.03, 73.21, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(45, 522, 293.85, -1401.93, 13.4, 280.18, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(46, 560, 299.37, -1393.57, 13.39, 294.01, 1, 1, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0),
(47, 560, 1218.52, -1393.76, 12.6, 273.36, 6, 6, 0, 0, 'NotCustom', 4, 1, 1, 100, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `weapon_players`
--

CREATE TABLE `weapon_players` (
  `ID` int(11) NOT NULL,
  `weaponid` int(2) NOT NULL DEFAULT 0,
  `slot` int(2) NOT NULL DEFAULT 0,
  `ammo` int(3) NOT NULL DEFAULT 0,
  `serial` varchar(64) DEFAULT NULL,
  `ownerid` int(11) NOT NULL DEFAULT 0,
  `created` int(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `weapon_players`
--

INSERT INTO `weapon_players` (`ID`, `weaponid`, `slot`, `ammo`, `serial`, `ownerid`, `created`) VALUES
(1, 24, 2, 100, '0', 1, 1702022190),
(2, 31, 5, 100, '0', 1, 1702361437),
(3, 34, 6, 100, '0', 1, 1702361622),
(4, 24, 2, 100, '0', 1, 1702978222),
(5, 31, 5, 100, '0', 1, 1702978222),
(6, 34, 6, 100, '0', 1, 1702978222),
(7, 24, 2, 100, '0', 1, 1702978307),
(8, 31, 5, 100, '0', 1, 1702978307),
(9, 34, 6, 100, '0', 1, 1702978307),
(10, 24, 2, 100, '0', 1, 1702982232),
(11, 31, 5, 100, '0', 1, 1702982232),
(12, 34, 6, 100, '0', 1, 1702982232),
(13, 24, 2, 100, '0', 1, 1702982406),
(14, 31, 5, 90, '0', 1, 1702982406),
(15, 34, 6, 97, '0', 1, 1702982406),
(16, 24, 2, 98, '0', 1, 1702982660),
(17, 31, 5, 83, '0', 1, 1702982660),
(18, 34, 6, 96, '0', 1, 1702982660),
(19, 24, 2, 98, '0', 1, 1702982834),
(20, 31, 5, 82, '0', 1, 1702982834),
(21, 34, 6, 95, '0', 1, 1702982834),
(22, 24, 2, 97, '0', 1, 1702982869),
(23, 31, 5, 82, '0', 1, 1702982869),
(24, 34, 6, 95, '0', 1, 1702982869),
(25, 24, 2, 84, '0', 1, 1702983408),
(26, 31, 5, 14, '0', 1, 1702983408),
(27, 34, 6, 89, '0', 1, 1702983408),
(28, 24, 2, 84, '0', 1, 1702984978),
(29, 31, 5, 14, '0', 1, 1702984978),
(30, 34, 6, 88, '0', 1, 1702984978),
(31, 24, 2, 84, '0', 1, 1702999275),
(32, 31, 5, 14, '0', 1, 1702999275),
(33, 34, 6, 88, '0', 1, 1702999275),
(34, 24, 2, 84, '0', 1, 1703070672),
(35, 31, 5, 14, '0', 1, 1703070672),
(36, 34, 6, 88, '0', 1, 1703070672),
(37, 24, 2, 84, '0', 1, 1703078720),
(38, 31, 5, 14, '0', 1, 1703078720),
(39, 34, 6, 86, '0', 1, 1703078720),
(40, 24, 2, 84, '0', 1, 1703180228),
(41, 31, 5, 14, '0', 1, 1703180228),
(42, 34, 6, 86, '0', 1, 1703180228),
(43, 24, 2, 84, '0', 1, 1703185212),
(44, 31, 5, 14, '0', 1, 1703185212),
(45, 34, 6, 82, '0', 1, 1703185212),
(46, 24, 2, 84, '0', 1, 1703186479),
(47, 31, 5, 14, '0', 1, 1703186479),
(48, 34, 6, 82, '0', 1, 1703186479),
(49, 24, 2, 83, '0', 1, 1703229129),
(50, 31, 5, 14, '0', 1, 1703229129),
(51, 34, 6, 82, '0', 1, 1703229129),
(52, 24, 2, 83, '0', 1, 1703234098),
(53, 31, 5, 14, '0', 1, 1703234098),
(54, 34, 6, 82, '0', 1, 1703234098),
(55, 24, 2, 83, '0', 1, 1703234216),
(56, 31, 5, 14, '0', 1, 1703234216),
(57, 34, 6, 82, '0', 1, 1703234216),
(58, 24, 2, 79, '0', 1, 1703318170),
(59, 31, 5, 14, '0', 1, 1703318170),
(60, 34, 6, 82, '0', 1, 1703318170),
(61, 24, 2, 79, '0', 1, 1703319029),
(62, 31, 5, 14, '0', 1, 1703319029),
(63, 34, 6, 82, '0', 1, 1703319029),
(64, 24, 2, 77, '0', 1, 1703319831),
(65, 31, 5, 14, '0', 1, 1703319831),
(66, 34, 6, 82, '0', 1, 1703319831),
(67, 24, 2, 77, '0', 1, 1703414225),
(68, 31, 5, 14, '0', 1, 1703414225),
(69, 34, 6, 82, '0', 1, 1703414225),
(70, 24, 2, 77, '0', 1, 1703414684),
(71, 31, 5, 14, '0', 1, 1703414684),
(72, 34, 6, 82, '0', 1, 1703414684),
(73, 24, 2, 77, '0', 1, 1703758813),
(74, 31, 5, 14, '0', 1, 1703758813),
(75, 34, 6, 82, '0', 1, 1703758813),
(76, 24, 2, 76, '0', 1, 1703780607),
(77, 31, 5, 14, '0', 1, 1703780607),
(78, 34, 6, 81, '0', 1, 1703780607),
(79, 24, 2, 76, '0', 1, 1703780741),
(80, 31, 5, 14, '0', 1, 1703780741),
(81, 34, 6, 81, '0', 1, 1703780741),
(82, 24, 2, 76, '0', 1, 1703781023),
(83, 31, 5, 14, '0', 1, 1703781023),
(84, 34, 6, 81, '0', 1, 1703781023),
(85, 24, 2, 74, '0', 1, 1703781646),
(86, 31, 5, 14, '0', 1, 1703781646),
(87, 34, 6, 81, '0', 1, 1703781646),
(88, 24, 2, 74, '0', 1, 1703781847),
(89, 31, 5, 14, '0', 1, 1703781847),
(90, 34, 6, 81, '0', 1, 1703781847),
(91, 24, 2, 74, '0', 1, 1703782465),
(92, 31, 5, 14, '0', 1, 1703782465),
(93, 34, 6, 81, '0', 1, 1703782465),
(94, 24, 2, 74, '0', 1, 1703783875),
(95, 31, 5, 14, '0', 1, 1703783875),
(96, 34, 6, 81, '0', 1, 1703783875),
(97, 24, 2, 74, '0', 1, 1703783996),
(98, 31, 5, 14, '0', 1, 1703783996),
(99, 34, 6, 81, '0', 1, 1703783996),
(100, 24, 2, 74, '0', 1, 1703784108),
(101, 31, 5, 14, '0', 1, 1703784108),
(102, 34, 6, 81, '0', 1, 1703784108),
(103, 24, 2, 74, '0', 1, 1703784211),
(104, 31, 5, 14, '0', 1, 1703784211),
(105, 34, 6, 81, '0', 1, 1703784211),
(106, 24, 2, 73, '0', 1, 1703784934),
(107, 31, 5, 12, '0', 1, 1703784934),
(108, 34, 6, 81, '0', 1, 1703784934),
(109, 24, 2, 73, '0', 1, 1703785057),
(110, 31, 5, 12, '0', 1, 1703785057),
(111, 34, 6, 81, '0', 1, 1703785057),
(112, 24, 2, 73, '0', 1, 1703785124),
(113, 31, 5, 12, '0', 1, 1703785124),
(114, 34, 6, 81, '0', 1, 1703785124),
(115, 24, 2, 73, '0', 1, 1703785227),
(116, 31, 5, 12, '0', 1, 1703785227),
(117, 34, 6, 81, '0', 1, 1703785227),
(118, 24, 2, 73, '0', 1, 1703786064),
(119, 31, 5, 12, '0', 1, 1703786064),
(120, 34, 6, 81, '0', 1, 1703786064),
(121, 24, 2, 66, '0', 1, 1703786149),
(122, 31, 5, 12, '0', 1, 1703786149),
(123, 34, 6, 81, '0', 1, 1703786149),
(124, 24, 2, 66, '0', 1, 1703786251),
(125, 31, 5, 12, '0', 1, 1703786251),
(126, 34, 6, 81, '0', 1, 1703786251),
(127, 24, 2, 66, '0', 1, 1703786375),
(128, 31, 5, 12, '0', 1, 1703786375),
(129, 34, 6, 81, '0', 1, 1703786375),
(130, 24, 2, 66, '0', 1, 1703786482),
(131, 31, 5, 12, '0', 1, 1703786482),
(132, 34, 6, 81, '0', 1, 1703786482),
(133, 24, 2, 66, '0', 1, 1703786544),
(134, 31, 5, 12, '0', 1, 1703786544),
(135, 34, 6, 81, '0', 1, 1703786544),
(136, 24, 2, 66, '0', 1, 1703787167),
(137, 31, 5, 12, '0', 1, 1703787167),
(138, 34, 6, 81, '0', 1, 1703787167),
(139, 24, 2, 66, '0', 1, 1703787746),
(140, 31, 5, 12, '0', 1, 1703787746),
(141, 34, 6, 81, '0', 1, 1703787746),
(142, 24, 2, 66, '0', 1, 1703787819),
(143, 31, 5, 12, '0', 1, 1703787819),
(144, 34, 6, 81, '0', 1, 1703787819),
(145, 24, 2, 66, '0', 1, 1703791271),
(146, 31, 5, 12, '0', 1, 1703791271),
(147, 34, 6, 81, '0', 1, 1703791271),
(148, 24, 2, 66, '0', 1, 1703791565),
(149, 31, 5, 12, '0', 1, 1703791565),
(150, 34, 6, 81, '0', 1, 1703791565),
(151, 24, 2, 66, '0', 1, 1703792111),
(152, 31, 5, 12, '0', 1, 1703792111),
(153, 34, 6, 79, '0', 1, 1703792111),
(154, 24, 2, 66, '0', 1, 1703792156),
(155, 31, 5, 12, '0', 1, 1703792156),
(156, 34, 6, 79, '0', 1, 1703792156),
(157, 24, 2, 66, '0', 1, 1703792862),
(158, 31, 5, 12, '0', 1, 1703792862),
(159, 34, 6, 79, '0', 1, 1703792862),
(160, 24, 2, 66, '0', 1, 1703793016),
(161, 31, 5, 12, '0', 1, 1703793016),
(162, 34, 6, 79, '0', 1, 1703793016),
(163, 24, 2, 59, '0', 1, 1703793507),
(164, 31, 5, 0, '0', 1, 1703793507),
(165, 34, 6, 78, '0', 1, 1703793507),
(166, 24, 2, 57, '0', 1, 1703793652),
(167, 31, 5, 0, '0', 1, 1703793652),
(168, 34, 6, 78, '0', 1, 1703793652),
(169, 24, 2, 57, '0', 1, 1703793766),
(170, 31, 5, 0, '0', 1, 1703793766),
(171, 34, 6, 78, '0', 1, 1703793766),
(172, 24, 2, 57, '0', 1, 1703793969),
(173, 31, 5, 0, '0', 1, 1703793969),
(174, 34, 6, 78, '0', 1, 1703793969),
(175, 24, 2, 57, '0', 1, 1703794022),
(176, 31, 5, 0, '0', 1, 1703794022),
(177, 34, 6, 78, '0', 1, 1703794022),
(178, 24, 2, 57, '0', 1, 1703794151),
(179, 31, 5, 0, '0', 1, 1703794151),
(180, 34, 6, 78, '0', 1, 1703794151),
(181, 24, 2, 57, '0', 1, 1703794754),
(182, 31, 5, 0, '0', 1, 1703794754),
(183, 34, 6, 78, '0', 1, 1703794754),
(184, 24, 2, 57, '0', 1, 1703794793),
(185, 31, 5, 0, '0', 1, 1703794793),
(186, 34, 6, 78, '0', 1, 1703794793),
(187, 24, 2, 57, '0', 1, 1703794911),
(188, 31, 5, 0, '0', 1, 1703794911),
(189, 34, 6, 78, '0', 1, 1703794911),
(190, 24, 2, 57, '0', 1, 1703795368),
(191, 31, 5, 0, '0', 1, 1703795368),
(192, 34, 6, 78, '0', 1, 1703795368),
(193, 24, 2, 57, '0', 1, 1703795932),
(194, 31, 5, 0, '0', 1, 1703795932),
(195, 34, 6, 78, '0', 1, 1703795932),
(196, 24, 2, 57, '0', 1, 1703830412),
(197, 31, 5, 0, '0', 1, 1703830412),
(198, 34, 6, 78, '0', 1, 1703830412),
(199, 24, 2, 57, '0', 1, 1703831370),
(200, 31, 5, 0, '0', 1, 1703831370),
(201, 34, 6, 78, '0', 1, 1703831370),
(202, 24, 2, 52, '0', 1, 1703831619),
(203, 31, 5, 0, '0', 1, 1703831619),
(204, 34, 6, 78, '0', 1, 1703831619),
(205, 24, 2, 52, '0', 1, 1703845660),
(206, 31, 5, 0, '0', 1, 1703845660),
(207, 34, 6, 78, '0', 1, 1703845660),
(208, 24, 2, 52, '0', 1, 1707593632),
(209, 31, 5, 0, '0', 1, 1707593632),
(210, 34, 6, 77, '0', 1, 1707593632);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`pID`);

--
-- Indexes for table `dealer_vehicle`
--
ALTER TABLE `dealer_vehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `playerucp`
--
ALTER TABLE `playerucp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `weapon_players`
--
ALTER TABLE `weapon_players`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `pID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dealer_vehicle`
--
ALTER TABLE `dealer_vehicle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doors`
--
ALTER TABLE `doors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `playerucp`
--
ALTER TABLE `playerucp`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `weapon_players`
--
ALTER TABLE `weapon_players`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
