-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 14, 2020 at 10:57 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `cveCuenta` bigint(20) NOT NULL,
  `noPlatillos` int(11) NOT NULL,
  `Subtotal` float NOT NULL,
  `Total` float NOT NULL,
  `ticket` char(40) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `noOrden` bigint(20) NOT NULL,
  `cvePlatillo` bigint(20) NOT NULL,
  PRIMARY KEY (`cveCuenta`,`noOrden`,`cvePlatillo`),
  KEY `FK1cuenta` (`noOrden`),
  KEY `FK2cuenta` (`cvePlatillo`)
) ;

--
-- Dumping data for table `cuenta`
--

INSERT INTO `cuenta` (`cveCuenta`, `noPlatillos`, `Subtotal`, `Total`, `ticket`, `noOrden`, `cvePlatillo`) VALUES
(1, 2, 298, 342.7, NULL, 1, 1),
(1, 1, 99, 113.85, NULL, 2, 3),
(1, 1, 129, 148.35, NULL, 3, 4),
(2, 3, 139, 479.55, NULL, 4, 2),
(3, 1, 89, 102.35, NULL, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `cveEmpleado` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` char(35) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apePaterno` char(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoEmpleado` bigint(20) NOT NULL,
  `edadEmpleado` int(11) NOT NULL,
  `cveTipo` int(11) DEFAULT NULL,
  `cve` char(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `foto` char(5) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`cveEmpleado`),
  UNIQUE KEY `telefonoEmpleado` (`telefonoEmpleado`),
  KEY `FK1empleado` (`cveTipo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`cveEmpleado`, `nombreEmpleado`, `apePaterno`, `telefonoEmpleado`, `edadEmpleado`, `cveTipo`, `cve`, `foto`) VALUES
(1, 'Erick', 'Camacho', 4612754592, 22, 1, 'd34bb586b7ca18b35a7797bd19df9770e277f646', 'JPG'),
(2, 'Francisco', 'Tierrablanca', 4611234567, 22, 3, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL),
(3, 'Ruben', 'Ortega', 4617654321, 25, 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL),
(4, 'Yareli', 'Martinez', 4611982034, 21, 3, '8cb2237d0679ca88db6464eac60da96345513964', NULL),
(5, 'Aranza', 'Lopez', 4612004440, 21, 3, '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL),
(6, 'Yunuen', 'Gomez', 4614614611, 23, 2, 'c29fcddc9a35254bf7b0e4890801f41e56a69e13', 'png');

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
CREATE TABLE IF NOT EXISTS `ingrediente` (
  `cveIngrediente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreIngrediente` char(35) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precioIngrediente` float DEFAULT NULL,
  `Existente` int(11) DEFAULT NULL,
  PRIMARY KEY (`cveIngrediente`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `ingrediente`
--

INSERT INTO `ingrediente` (`cveIngrediente`, `nombreIngrediente`, `precioIngrediente`, `Existente`) VALUES
(1, 'Jitomate', 4, 50),
(2, 'Cebolla', 5, 55),
(3, 'Ajo', 10, 20),
(4, 'Cilantro', 5, 10),
(5, 'Calabaza', 3, 40),
(6, 'Chayote', 5, 35),
(7, 'Pimienta', 15, 20),
(8, 'Sal', 12, 25),
(9, 'Zanahoria', 6, 50),
(10, 'Papa', 6.5, 44),
(11, 'Arugula', 3, 20),
(12, 'Brocoli', 4.5, 33),
(13, 'Pollo', 25, 20),
(14, 'Arroz', 18.5, 29),
(15, 'Aceite', 25, 14),
(16, 'Mantequilla', 21.5, 30),
(17, 'Queso', 4, 50);

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `cveIngrediente` bigint(20) NOT NULL,
  `cveEmpleado` bigint(20) NOT NULL,
  `fechaInventario` date DEFAULT NULL,
  `existente` int(3) DEFAULT NULL,
  PRIMARY KEY (`cveIngrediente`,`cveEmpleado`),
  KEY `FK2inventario` (`cveEmpleado`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`cveIngrediente`, `cveEmpleado`, `fechaInventario`, `existente`) VALUES
(1, 2, '2020-10-01', 10),
(2, 2, '2020-10-01', 11),
(3, 3, '2020-10-01', 12),
(4, 3, '2020-10-03', 13),
(5, 4, '2020-10-03', 14),
(6, 4, '2020-10-03', 15),
(7, 5, '2020-10-03', 16);

-- --------------------------------------------------------

--
-- Table structure for table `lleva`
--

DROP TABLE IF EXISTS `lleva`;
CREATE TABLE IF NOT EXISTS `lleva` (
  `cvePlatillo` bigint(20) NOT NULL,
  `cveIngrediente` bigint(20) NOT NULL,
  PRIMARY KEY (`cvePlatillo`,`cveIngrediente`),
  KEY `FK2lleva` (`cveIngrediente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `lleva`
--

INSERT INTO `lleva` (`cvePlatillo`, `cveIngrediente`) VALUES
(1, 3),
(1, 7),
(1, 8),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 9),
(5, 12),
(5, 14),
(5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `cveCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` char(35) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`cveCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`cveCategoria`, `categoria`) VALUES
(1, 'ensaladas'),
(2, 'Pollo'),
(3, 'Vegano'),
(4, 'Bebidas'),
(5, 'Bebidas c/Alcohol');

-- --------------------------------------------------------

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
CREATE TABLE IF NOT EXISTS `mesa` (
  `noMesa` bigint(20) NOT NULL AUTO_INCREMENT,
  `capacidad` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `cveEmpleado` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`noMesa`),
  KEY `FK1mesa` (`cveEmpleado`)
) ;

--
-- Dumping data for table `mesa`
--

INSERT INTO `mesa` (`noMesa`, `capacidad`, `estado`, `cveEmpleado`) VALUES
(1, 5, 1, 2),
(2, 6, 1, 2),
(3, 7, 1, 3),
(4, 8, 1, 4),
(5, 9, 1, 5),
(6, 10, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE IF NOT EXISTS `orden` (
  `noOrden` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaOrden` datetime DEFAULT NULL,
  PRIMARY KEY (`noOrden`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `orden`
--

INSERT INTO `orden` (`noOrden`, `fechaOrden`) VALUES
(1, '2020-10-31 15:30:00'),
(2, '2020-10-31 15:35:00'),
(3, '2020-11-01 14:10:00'),
(4, '2020-11-05 09:33:00'),
(5, '2020-11-07 10:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS `plato`;
CREATE TABLE IF NOT EXISTS `plato` (
  `cvePlatillo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombrePlatillo` char(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precioPlatillo` float DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL,
  `Foto` char(40) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`cvePlatillo`),
  KEY `FK1plato` (`Categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `plato`
--

INSERT INTO `plato` (`cvePlatillo`, `nombrePlatillo`, `precioPlatillo`, `Categoria`, `Foto`) VALUES
(1, 'Pollo a la plancha', 149, 2, NULL),
(2, 'Pollo relleno', 139, 2, NULL),
(3, 'Ensalada Cesar', 99, 1, NULL),
(4, 'Ensalda con pollo', 129, 2, NULL),
(5, 'Ensalda con arroz', 89, 3, NULL),
(6, 'Pollo con mantequilla', 139, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
CREATE TABLE IF NOT EXISTS `reservacion` (
  `noReservacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreCliente` char(35) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `correoCliente` char(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `fechaReservacion` datetime DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `noAcompa` int(11) DEFAULT NULL,
  `noMesa` bigint(20) DEFAULT NULL,
  `cveEmpleado` bigint(20) NOT NULL,
  PRIMARY KEY (`noReservacion`),
  UNIQUE KEY `Telefono` (`Telefono`),
  KEY `FK1reservacion` (`noMesa`),
  KEY `FK2reservacion` (`cveEmpleado`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `reservacion`
--

INSERT INTO `reservacion` (`noReservacion`, `nombreCliente`, `correoCliente`, `Telefono`, `fechaReservacion`, `fecha`, `noAcompa`, `noMesa`, `cveEmpleado`) VALUES
(1, 'Mariana', 'mariana@gmail.com', 4612027346, '2020-10-27 13:08:22', '2020-11-20 15:15:00', 5, 1, 2),
(2, 'Alex', 'alex@gmail.com', 4613125654, '2020-10-28 14:09:23', '2020-11-21 16:16:00', 2, 2, 3),
(3, 'Jazmin', 'jazmin@gmail.com', 4617845687, '2020-10-29 15:10:24', '2020-11-22 17:17:00', 1, 3, 3),
(4, 'Frida', 'frida@gmail.com', 4617905089, '2020-10-30 16:11:25', '2020-11-23 18:18:00', 4, 4, 4),
(5, 'Yunuen', 'yunuen@gmail.com', 46111153003, '2020-10-31 17:12:26', '2020-11-24 19:19:00', 2, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tiene`
--

DROP TABLE IF EXISTS `tiene`;
CREATE TABLE IF NOT EXISTS `tiene` (
  `noMesa` bigint(20) NOT NULL,
  `noOrden` bigint(20) NOT NULL,
  PRIMARY KEY (`noMesa`,`noOrden`),
  KEY `FK2tiene` (`noOrden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tiene`
--

INSERT INTO `tiene` (`noMesa`, `noOrden`) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
CREATE TABLE IF NOT EXISTS `tipoempleado` (
  `cveTipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionEmpleado` char(25) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`cveTipo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tipoempleado`
--

INSERT INTO `tipoempleado` (`cveTipo`, `descripcionEmpleado`) VALUES
(1, 'administrador'),
(2, 'recepcionista'),
(3, 'mesero');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
