-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 04:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgludtr`
--

-- --------------------------------------------------------

--
-- Table structure for table `backlogs`
--

CREATE TABLE `backlogs` (
  `id` int(10) NOT NULL,
  `pers_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `log` datetime NOT NULL,
  `machine` int(11) NOT NULL,
  `flexible` int(10) NOT NULL DEFAULT 0,
  `system_log` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dtr`
--

CREATE TABLE `dtr` (
  `id` int(10) NOT NULL,
  `eid` int(10) NOT NULL,
  `ddate` date NOT NULL,
  `morning_in` time NOT NULL,
  `morning_out` time NOT NULL,
  `afternoon_in` time NOT NULL,
  `afternoon_out` time NOT NULL,
  `tardiness` time DEFAULT NULL,
  `undertime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) NOT NULL,
  `empid` varchar(50) DEFAULT NULL,
  `schedule_id` int(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `appointment_status` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `gsis` varchar(50) DEFAULT NULL,
  `sss` varchar(50) DEFAULT NULL,
  `hdmf` varchar(50) DEFAULT NULL,
  `philhealth` varchar(50) DEFAULT NULL,
  `is_built_in` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `empid`, `schedule_id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `gender`, `birthday`, `birthplace`, `address`, `contact_no`, `email`, `appointment_status`, `position`, `gsis`, `sss`, `hdmf`, `philhealth`, `is_built_in`, `created_at`, `updated_at`) VALUES
(1, '82156', 0, 'Sly', 'Bulilan', 'Flores', 'admin', 'admin', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 1, NULL, NULL),
(2, '76019', 1, 'EMILY', 'MILAN', 'ABIBUAG', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Computer Operator IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(3, '74134', 1, 'RODNEY', 'PAROHINOG', 'ABIBUAG', NULL, NULL, 'Male', NULL, 'Talisay, Negros Occidental', NULL, NULL, NULL, 'Permanent', 'Engineer I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(4, '82038', 1, 'KATRINA', 'PANIS', 'ACOSTA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative  Officer I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(5, '62039', 1, 'NOEL', 'ARONGAT', 'AGUILAR', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(6, '86122', 1, 'ARIANE ERIN', 'CUNANAN', 'AMPARO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(7, '95081', 1, 'CHRISHELL', 'FERNANDEZ', 'ANDERSON', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Permanent', 'Social Welfare Officer I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(8, '60024', 1, 'AMESTADIO', 'URMAZA', 'AQUINO', NULL, NULL, 'Male', NULL, 'Binmaley, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(9, '89018', 1, 'KAREEN', 'MERCADO', 'AQUISAP', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(10, '85073', 1, 'KRISTOFFER', 'ESTILLORE', 'AQUISAP', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(11, '79016', 1, 'LEA', 'DE GUZMAN', 'ARAGON', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(12, '68040', 1, 'DELIA', 'ROSAL', 'ARELLANO', NULL, NULL, 'Female', NULL, 'Dagupan City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(13, '80036', 1, 'LEODILMAR', 'CASALME', 'ARREOLA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Technologist I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(14, '69045', 1, 'GENARO', 'MERCADO', 'ASPIRAS', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(15, '81167', 1, 'GUILVIC TIRSO', 'SOMINTAC', 'ASPIRAS', NULL, NULL, 'Male', NULL, 'Dagupan City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(16, '79050', 1, 'NEIL SIMON', 'MAMUYAC', 'ASPIRAS', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(17, '93066', 1, 'TRESHA ANN', 'RIVERA', 'ASPREC', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(18, '61046', 1, 'DOROTEO', 'LAPIZAR', 'AVECILLA', NULL, NULL, 'Male', NULL, 'San Juan, La Union', NULL, NULL, NULL, 'Permanent', 'Radiologic Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(19, '63020', 1, 'VILMA', 'GALI', 'BALADAD', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(20, '80159', 1, 'ELLEN ', 'ESLAO', 'BALANCIO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Admin. Officer IV (Mgt & Audit Analyst II)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(21, '73008', 1, 'SONIA', 'PADILLA', 'BALANCIO', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(22, '71013', 1, 'NERISSA', 'REFUGIA', 'BALANON', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(23, '71015', 1, 'EMMALAINE', 'RIVERA', 'BALDEMOR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(24, '75035', 1, 'MERCEDITA', 'ESTORCO', 'BALLESIL', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(25, '66031', 1, 'OMAR', 'BOADO', 'BALLESIL', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(26, '57032', 1, 'RENATO MARTIN', 'VASADRE', 'BALMADRES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(27, '78095', 1, 'EMILIA', 'RETIG', 'BALOLONG', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Pharmacist I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(28, '61026', 1, 'DIVINA GRACIA', 'TAMPOYA', 'BARBACHANO', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(29, '61027', 1, 'LEON JR.', 'ASPURIA', 'BARBACHANO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(30, '57023', 1, 'ELFLIDA', 'OLIVAR', 'BAUTISTA', NULL, NULL, 'Female', NULL, 'Villasis, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(31, '74058', 1, 'GRACE', 'VIERNES', 'BAUTISTA', NULL, NULL, 'Female', NULL, 'La Unionna, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(32, '57024', 1, 'EILEEN', 'VALMONTE', 'BERNABE', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(33, '69067', 1, 'ARVIN', 'PELO', 'BIACO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Cook I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(34, '72040', 1, 'MARITES', 'ISLA', 'BOADO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(35, '67012', 1, 'DULIA PRIMA', 'LARON', 'CABACUNGAN', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(36, '83133', 1, 'MARIE FE', 'GALINDO', 'CALINDAS', NULL, NULL, 'Female', NULL, 'Candon City', NULL, NULL, NULL, 'Permanent', 'Laboratory Aide II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(37, '80022', 1, 'LETTY', 'PULQUISO', 'CAMODAG', NULL, NULL, 'Female', NULL, 'Bakun, Benguet', NULL, NULL, NULL, 'Permanent', 'Nutritionist - Dietitian II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(38, '85075', 1, 'ARMIDA', 'ROMERO', 'CARAS', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(39, '60035', 1, 'ALICIA', 'GANADEN', 'CARILLO', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer V', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(40, '80039', 1, 'SHERYL', 'RIVERA', 'CATALAN', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(41, '59018', 1, 'MERCEDES SOCORRO', 'PEÑA', 'CONTERO', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(42, '85070', 1, 'SHEENA MAE', 'MILO', 'COPE', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(43, '71034', 1, 'AIDEN', 'DOMINGO', 'CORDOVA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(44, '72024', 1, 'MARLENE', 'DE VERA', 'CRUZ', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Assistant III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(45, '76036', 1, 'RODICEL', 'FORTES', 'CRUZ', NULL, NULL, 'Female', NULL, 'Olongapo City', NULL, NULL, NULL, 'Permanent', 'Laundry Worker I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(46, '84176', 1, 'ANNE RHEA', 'SELGA', 'DACAYANAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(47, '76082', 1, 'JEAN', 'ORDOÑA', 'DALAO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(48, '60025', 1, 'MONICA', 'OLARTE', 'DE GUZMAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(49, '83016', 1, 'ANILYN', 'OLLERO', 'DELA CRUZ', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(50, '61037', 1, 'JESSICA', 'RIVERA', 'DELIM', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(51, '75010', 1, 'MINERVA', 'LACHICA', 'DELLA', NULL, NULL, 'Female', NULL, 'Sudipen, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(52, '84021', 1, 'RHEMELYN', 'BALAIS', 'DELLIMA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(53, '85107', 1, 'JAYSON JIRO', 'DE GUZMAN', 'DIMDIMAN', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(54, '78043', 1, 'OLIVIA', 'ESTOESTA', 'DOCTOLERO', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer V', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(55, '76065', 1, 'RANDY', 'ORCINO', 'DOMONDON', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(56, '69014', 1, 'ROSEMARIE', 'JACANG', 'DORIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Assistant IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(57, '64027', 1, 'NOEMI', 'GUILLET', 'DUCLAYAN', NULL, NULL, 'Female', NULL, 'San Gabriel, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(58, '73007', 1, 'AGNES', 'ESTOQUE', 'DUCUSIN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(59, '73076', 1, 'CESAR III', 'MOLINA', 'DURAN', NULL, NULL, 'Male', NULL, 'Legaspi City, Albay', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(60, '68012', 1, 'CRISTINA', 'ASPRER', 'DY', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(61, '70016', 1, 'APOLONIO, Jr.', 'NORIAL', 'EDADES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide VI', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(62, '71037', 1, 'MARY ANN', 'ESCOBAR', 'EMPERADOR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(63, '60026', 1, 'NESTOR', 'SUPSUP', 'EMPERADOR', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Security Guard I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(64, '66038', 1, 'JOSEPH', 'PARILLA', 'ERPELO', NULL, NULL, 'Male', NULL, 'Itogon, Benguet', NULL, NULL, NULL, 'Permanent', 'Computer Programmer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(65, '80163', 1, 'JOEL', 'MARCELINO', 'ESTANISLAO', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(66, '67043', 1, 'EDGAR', 'DIFUNTORUM', 'ESTOESTA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Construction & Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(67, '75018', 1, 'MARJORIE', 'BRAVO', 'ESTOESTA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(68, '65049', 1, 'SOLITA', 'GARCIA', 'ESTRADA', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Pharmacist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(69, '84163', 1, 'TERENCE JOHN', 'CARRERA', 'FANG', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(70, '82094', 1, 'LEAH', 'JAVIER', 'FANGON', NULL, NULL, 'Female', NULL, 'Narvacan, Ilocos Sur', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(71, '83012', 1, 'ROY', 'DOMONDON', 'FANGON', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide VI', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(72, '89040', 1, 'JOANNE', 'SUGUITAN', 'FANGONILO', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(73, '70078', 1, 'MONICA', 'GALI', 'FERNANDEZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(74, '70018', 1, 'CLAIRE', 'TABISULA', 'FONBUENA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(75, '71071', 1, 'GLENN ERNEST ', 'MANGASER', 'FONBUENA', NULL, NULL, 'Male', NULL, 'Caba, La Union', NULL, NULL, NULL, 'Permanent', 'Chief Executive Officer IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(76, '56024', 1, 'LOURDES', 'OFINA', 'FONSECA', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse V', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(77, '77023', 1, 'JOMAR', 'La UnionNGSOD', 'FORTES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(78, '74047', 1, 'MARVIN', 'DESEO', 'FORTES', NULL, NULL, 'Male', NULL, 'Atimonan, Quezon', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(79, '82025', 1, 'JOSEPHINE', 'CONDE', 'FRONDA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(80, '81106', 1, 'JENNIFER', 'GUBATAN', 'GALBAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Social Welfare Officer II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(81, '77084', 1, 'ROSEMARIE GLEN', 'GARCIA', 'GALBAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer V', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(82, '71105', 1, 'JOSEPH MANNIX', 'FLORES', 'GALIMBA', NULL, NULL, 'Male', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(83, '59058', 1, 'GRACE', 'SORIANO', 'GALLAO', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(84, '69036', 1, 'ALMA', 'EDADES', 'GALVEZ', NULL, NULL, 'Female', NULL, 'Dagupan City', NULL, NULL, NULL, 'Permanent', 'Laundry Worker II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(85, '63021', 1, 'MYRNA', 'LARON', 'GANADEN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Cook I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(86, '61060', 1, 'NORA', 'HERRERIA', 'GANADEN', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(87, '87070', 1, 'PRINCESS JOY ', 'ESLAO', 'GAPOY', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Pharmacist I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(88, '77063', 1, 'ROLDAN', 'PEREZ', 'GATCHALIAN', NULL, NULL, 'Male', NULL, 'Calasiao, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Electrician I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(89, '59015', 1, 'NATIVIDAD', 'BAUTISTA', 'GATCHALLAN', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II                              ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(90, '77009', 1, 'RUDOLF', 'RIVERA', 'GONGORA', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(91, '62019', 1, 'THELMA DORIS', 'DENUS', 'GURION', NULL, NULL, 'Female', NULL, 'Paoay, Ilocos Norte', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(92, '68013', 1, 'ROBERTO', 'FANGON', 'HALOG', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(93, '68031', 1, 'CONSUELO', 'RAMOS', 'IGO', NULL, NULL, 'Female', NULL, 'Sta. Cruz, Ilocos Sur', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(94, '64004', 1, 'AMERENCIO', 'BUENO', 'INES', NULL, NULL, 'Male', NULL, 'Laoag City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(95, '56052', 1, 'BEATRIZ', 'DE MESA', 'ISIBIDO', NULL, NULL, 'Female', NULL, 'Masbate City', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(96, '72028', 1, 'DOMINADOR JR', 'CARRERA', 'ISIBIDO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(97, '69057', 1, 'ALEXANDER', 'ASPIRAS', 'JARATA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(98, '71111', 1, 'MARIA VICTORIA', 'ESPINOZA', 'JARATA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(99, '64050', 1, 'MELINDA', 'OLARTE', 'JAVILLONAR', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(100, '71054', 1, 'ALOHA MARCIA', 'BANTIYAN', 'KALAW', NULL, NULL, 'Female', NULL, 'Lagawe, Ifugao', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(101, '66017', 1, 'JUAN JR.', 'DELA ROSA', 'KOMIYA', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(102, '74079', 1, 'YOLY', 'VERCELES', 'LARON', NULL, NULL, 'Female', NULL, 'Cuyapo, Nueva Ecija', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(103, '81003', 1, 'WENROSE', 'LAURETA', 'LEDDA', NULL, NULL, 'Female', NULL, 'Sison, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Administrative Assistant III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(104, '65055', 1, 'BERNADETTE', 'MOLINA', 'LIZADA', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(105, '83055', 1, 'BERNADETTE', 'ULAT', 'MABUTAS', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(106, '18230', 1, 'MA. LOURDES BERNADETTE', 'CERALDE', 'MACARAEG', NULL, NULL, 'Female', NULL, 'Dagupan City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(107, '76154', 1, 'JEHAN  GRACE', 'BUACK', 'MAGLAYA', NULL, NULL, 'Female', NULL, 'Caba, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(108, '62020', 1, 'AGUSTIN', 'VALDEZ', 'MAMARIL', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(109, '67021', 1, 'MARISSA', 'DACAYANAN', 'MANLUSOC', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(110, '82032', 1, 'PATRICIA GAYLE', 'ENAL', 'MANONGDO', NULL, NULL, 'Female', NULL, 'Los Baños, Laguna', NULL, NULL, NULL, 'Permanent', 'Pharmacist I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(111, '73078', 1, 'FLORENCE', 'MAPILE', 'MANZANO', NULL, NULL, 'Female', NULL, 'Dulao, Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(112, '57056', 1, 'VICENTE RONEY', 'MALINAO', 'MARINDUQUE', NULL, NULL, 'Male', NULL, 'Dumaguete City', NULL, NULL, NULL, 'Permanent', 'Painter II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(113, '86063', 1, 'SHENA MAE', 'DACPANO', 'MEJIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Admin. Officer II (Mgt & Audit Analyst I)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(114, '77053', 1, 'HAZEL', 'ISIBIDO', 'MENTAR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(115, '79166', 1, 'MARY GRACE ', 'FABIA', 'MISTICA', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(116, '76105', 1, 'NONETTE', 'GALERA', 'MOLINA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Physical Therapist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(117, '76112', 1, 'MICHAEL', 'LALES', 'MOSTALES', NULL, NULL, 'Male', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(118, '77041', 1, 'JOANNE', 'VIBAR', 'NACIONALES', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer V', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(119, '60059', 1, 'VALENTIN', 'ALCANTARA', 'NAOE', NULL, NULL, 'Male', NULL, 'Manaoag, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(120, '57026', 1, 'AMELIA', 'QUIBIN', 'NIDOY', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Technologist III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(121, '67013', 1, 'JOSIE', 'EMPERADOR', 'NIDOY', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(122, '57027', 1, 'ERLINDA', 'GALLIGUEZ', 'NIETO', NULL, NULL, 'Female', NULL, 'Urdaneta, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Dentist III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(123, '77057', 1, 'CHARLITO', 'OLLER', 'NIÑALGA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(124, '70048', 1, 'CONCEPCION', 'CERALDE', 'NISPEROS', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Accountant IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(125, '63022', 1, 'CARLOS', 'CAPILI', 'ONG', NULL, NULL, 'Male', NULL, 'San Juan, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(126, '71055', 1, 'VERGEL', 'KUAN', 'ONTALAN', NULL, NULL, 'Male', NULL, 'Manila', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(127, '70063', 1, 'MILA', 'DACLAN', 'ORDONIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(128, '72033', 1, 'CATHERINE', 'PANELO', 'ORENCIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(129, '73019', 1, 'La UnionDGER', 'ORIBELLO', 'ORENCIA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(130, '70022', 1, 'GLADITA', 'RAPIR', 'ORTEGA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Midwife II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(131, '69062', 1, 'MONICA', 'SOTELO', 'ORTEGA', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Laundry Worker I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(132, '84190', 1, 'MARY JESSIL', 'PASAG', 'PABLO', NULL, NULL, 'Female', NULL, 'San Manuel, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(133, '77038', 1, 'CORA', 'SARMIENTO', 'PADILLA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(134, '80057', 1, 'JACKILOU', 'OCTAVIANO', 'PADILLA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Assistant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(135, '73038', 1, 'JEPTAH', 'KOMIYA', 'PADILLA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(136, '76111', 1, 'WILLIAM', 'SARMIENTO', 'PADILLA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(137, '87049', 1, 'DARVIN', 'MARTINEZ', 'PADUA', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Permanent', 'Radiologic Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(138, '85034', 1, 'LEANA GRACE', 'GOMEZ', 'PADUA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(139, '77054', 1, 'JOSEPHINE', 'NIEVA', 'PAGLINGAYEN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(140, '77022', 1, 'MA. TERESA', 'SAPITULA', 'PATULOT', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(141, '71033', 1, 'AMAPULA', 'MAMUYAC', 'PERALTA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(142, '59019', 1, 'LORENZO JR.', 'ARAÑAS', 'PICARDAL', NULL, NULL, 'Male', NULL, 'Bauang, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(143, '77024', 1, 'JOY', 'JARATA', 'PIÑON', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nutritionist - Dietitian III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(144, '58057', 1, 'GERALDINE', 'TOMAS', 'POSADAS', NULL, NULL, 'Female', NULL, 'Laoag City', NULL, NULL, NULL, 'Permanent', 'Nurse VI', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(145, '61030', 1, 'DJARMA', 'BUSTAMANTE', 'QUIMING', NULL, NULL, 'Female', NULL, 'Dagupan City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(146, '60029', 1, 'LEANDRO', 'VILLANUEVA', 'QUIMING', NULL, NULL, 'Male', NULL, 'Bayombong, Nueva Vizcaya', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(147, '70021', 1, 'MA. GLENDA', 'ORENCIA', 'RABANES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(148, '79021', 1, 'MARIE GRACE', 'FRONDA', 'REBUALOS', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(149, '94088', 1, 'CARYL JOYCE', 'SEROTE', 'REYES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Accountant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(150, '67041', 1, 'MA. LIZA', 'GACAYAN', 'REYES', NULL, NULL, 'Female', NULL, 'Sultan Kudarat', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(151, '72015', 1, 'SHIRLEY', 'EMPERADOR', 'REYES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(152, '60030', 1, 'LYDIA', 'DAMIAN', 'RIBLEZA', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(153, '68042', 1, 'JOCELYN', 'MABANTA', 'RIVERA', NULL, NULL, 'Female', NULL, 'Bauang, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(154, '84054', 1, 'DESIREE GRACE', 'FABIAN', 'ROC', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(155, '60050', 1, 'ANNABELLE', 'MIRANDA', 'RODRIGUEZ', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Supervising Admin. Officer', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(156, '81156', 1, 'MA. THERESA', 'DIASEN', 'ROMERO', NULL, NULL, 'Female', NULL, 'Quezon City', NULL, NULL, NULL, 'Permanent', 'Medical Officer III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(157, '70019', 1, 'DAISY', 'MARIÑAS', 'ROSETE', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(158, '65044', 1, 'JOSE', 'ASPIRAS', 'RULLODA', NULL, NULL, 'Male', NULL, 'Cebu City', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(159, '62025', 1, 'ESMENIA', 'ROSETE', 'RUPINTA', NULL, NULL, 'Female', NULL, 'Mangatarem, Pangasinan', NULL, NULL, NULL, 'Permanent', 'Seamstress', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(160, '83022', 1, 'MARIA GENEVIEVE', 'GARINGO', 'SAPI', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(161, '70045', 1, 'ALBERTO JR.', 'ESTIGOY', 'SARINAS ', NULL, NULL, 'Male', NULL, 'Caloocan City', NULL, NULL, NULL, 'Permanent', 'Radiologic Technologist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(162, '77058', 1, 'IMELDA', 'LAROYA', 'SAWIT', NULL, NULL, 'Female', NULL, 'Pugo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(163, '72012', 1, 'MARY ANN', 'MALANO', 'SUBALA', NULL, NULL, 'Female', NULL, 'La Trinidad, Benguet', NULL, NULL, NULL, 'Permanent', 'Pharmacist III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(164, '81184', 1, 'MICHELLE VANESSA', 'FLORES', 'TABANDA', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(165, '59046', 1, 'MARTIN JR.', 'ASPIRAS', 'TACLAY', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(166, '73023', 1, 'NANCY', 'PANEDA', 'TALUCOD', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(167, '81035', 1, 'ELMER', 'RUPINTA', 'TAVARES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(168, '90043', 1, 'RONELE FRANCIS', 'BENAURO', 'TAVARES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(169, '68081', 1, 'JOSEPH ', 'QUINTO', 'TAVORA', NULL, NULL, 'Male', NULL, 'Manila', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(170, '18759', 1, 'PAULINE MAY', 'CHAN', 'TORRES', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Medical Specialist II(PT)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(171, '74006', 1, 'MERCEDES ', 'LAROYA', 'UCOL', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(172, '84043', 1, 'RYMON', 'OBUNGEN', 'URBANO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(173, '77046', 1, 'AMANDA', 'MANIMTIM', 'VIERNES', NULL, NULL, 'Female', NULL, 'Alitagtag, Batangas', NULL, NULL, NULL, 'Permanent', 'Nursing Attendant I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(174, '77006', 1, 'VENUS', 'MANAOIS', 'VILLAFUERTE', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Aide IV', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(175, '80047', 1, 'ALLAN JOHN', 'FONTANILLA', 'VILLANUEVA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Permanent', 'Administrative Officer I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(176, '72104', 1, 'NEIL ', 'VILLENA', 'VILLANUEVA', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Permanent', 'Laboratory Aide II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(177, '72029', 1, 'DIVINA', 'PALISOC', 'VIRTUDES', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse I', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(178, '60031', 1, 'JOSEPH JOSE', 'CASIÑO', 'ZARATE', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Permanent', 'Nurse III', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(179, '81032', 1, 'RUDOLF NOEL', 'BOADO', 'AGRA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (MIS Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(180, '95053', 1, 'HAZEL KATHRINA', 'REOTUTAR', 'BARROGA', NULL, NULL, 'Female', NULL, 'Rosales, Pangasinan', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(181, '99452', 1, 'ARGENTINA', 'SIOBAL', 'BARTOLO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(182, '17011', 1, 'EDUARDO', 'DELA CRUZ', 'BOADO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Ambulance Driver)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(183, '78163', 1, 'AVELINA', 'BAS - ILAN', 'CARIASO', NULL, NULL, 'Female', NULL, 'Zamabales', NULL, NULL, NULL, 'Casual', 'Laborer I (Radiologic Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(184, '93068', 1, 'GERALDINE LEAH ', 'CAASI', 'CASILA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(185, '88118', 1, 'MARISSA', 'ESTUESTA', 'CO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(186, '90077', 1, 'DONNABELLE', 'MAMARIL', 'COLLADO', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(187, '94002', 1, 'JAN DAVE', 'CHAN', 'COQUIA', NULL, NULL, 'Male', NULL, 'Bauang, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Biomedical Technician)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(188, '96020', 1, 'KATHLEEN SHAYNE', 'FRIGILLANA', 'CORTEZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(189, '86111', 1, 'VICTORY', 'ARCANGEL', 'CORTEZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Personnel Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(190, '87030', 1, 'JOHN ERICSON', 'JUCUTAN', 'COSTALES', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(191, '82008', 1, 'JHANETTE', 'DE VERA', 'DACAYANAN', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Budget Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(192, '76095', 1, 'MARITES', 'DACLAN', 'DACUMOS', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Physiotherapy Aide)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(193, '94018', 1, 'RODESSA', 'FANGON', 'DALAZA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(194, '86081', 1, 'MELITON', 'VILLANUEVA', 'DULAY', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(195, '77128', 1, 'OLIVIA', 'FONTANOZA', 'DULAY', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(196, '99327', 1, 'CARMELITA', 'DULAY', 'DUNGAN', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(197, '90042', 1, 'ROBERT DEAN', 'ESTIOCO', 'DUNGAN', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(198, '78078', 1, 'LOURDES', 'GALIVO', 'EMPERADOR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(199, '71047', 1, 'LOUIE', 'GARCIA', 'FORTES', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(200, '73072', 1, 'LUIS', 'GARCIA', 'FORTES', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(201, '92026', 1, 'DIANE ALYSSA', 'PARAGAS', 'GALI', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(202, '90044', 1, 'KELVIN ERIK', 'PADILLA', 'GALI', NULL, NULL, 'Male', NULL, 'Baguio City', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(203, '84096', 1, 'CRISTINE CHERRY', 'PASCUA', 'GARCIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Pharmacy Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(204, '94066', 1, 'JEDINE IVY', 'GALERA', 'GAYO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(205, '84032', 1, 'JESUSA FLOR', 'YMSON', 'GONZAGA', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (OPD Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(206, '92040', 1, 'MADELAINE', 'QUERO', 'GONZALES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(207, '65042', 1, 'BEATRIZ', 'GARCIA', 'HALOG', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (OPD Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(208, '94067', 1, 'GLADYS', 'GAYO', 'HALOG', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(209, '91002', 1, 'MAY JENNIFER', 'GARCIA', 'HALOG', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Admitting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(210, '99350', 1, 'GULLIVER', 'CASEM', 'HUFANA', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(211, '81153', 1, 'WALTER', 'CARRERA', 'ISIBIDO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Construction and Maint. Man)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(212, '91037', 1, 'ROMENDA MAE ', 'PARADO', 'JACLA', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(213, '70074', 1, 'JOSEPHINE', 'PECSON', 'LACHICA', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Casual', 'Laborer I (Food Service Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(214, '68066', 1, 'VIDASTO', 'ALBAN', 'LAGLIVA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(215, '89066', 1, 'JUDY ANNE', 'DUNGAN', 'LLAVORE', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(216, '85104', 1, 'LEE STEVE', 'MINA', 'LUCERO', NULL, NULL, 'Male', NULL, 'Tagudin, Ilocos Sur', NULL, NULL, NULL, 'Casual', 'Laborer I (MIS Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(217, '82093', 1, 'JOSE', 'DOCTOLERO', 'MACUSI', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(218, '81136', 1, 'JOAN', 'HALOG', 'MAGBANUA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(219, '99613', 1, 'ODYSEUS', 'GAPASIN', 'MANAOIS', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (OPD Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(220, '93011', 1, 'KEAVY ', 'CORDOVA', 'MANGAOANG', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(221, '92020', 1, 'CHRISTITA', 'EMPERADOR', 'MEDINA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07');
INSERT INTO `employees` (`id`, `empid`, `schedule_id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `gender`, `birthday`, `birthplace`, `address`, `contact_no`, `email`, `appointment_status`, `position`, `gsis`, `sss`, `hdmf`, `philhealth`, `is_built_in`, `created_at`, `updated_at`) VALUES
(222, '88044', 1, 'LEAMOR', 'REGACHO', 'MEDINA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(223, '83092', 1, 'MA. LOURDES', 'MACUSI', 'MERCADO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Pharmacy Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(224, '81126', 1, 'MYRNA', 'FANGON', 'MILANES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Pharmacy Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(225, '90041', 1, 'LEA', 'ASPIRAS', 'MUNAR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Billing Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(226, '82143', 1, 'LELYN ', 'BALTAZAR', 'NALUPA', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, 'Casual', 'Laborer I (Accounting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(227, '86094', 1, 'RONALD HELMER', 'DELA TRINIDAD', 'NALUPA', NULL, NULL, 'Male', NULL, 'Tugegarao, Cagayan', NULL, NULL, NULL, 'Casual', 'Laborer I (MIS Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(228, '88058', 1, 'FRANCIA SOTERA', 'YODICO', 'NAVARILLO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Pharmacy Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(229, '85007', 1, 'MARK SIMPLICIO', 'YODICO', 'NAVARILLO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(230, '87084', 1, 'JOHN DARYL', 'NORIAL', 'NERONA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(231, '93067', 1, 'ARRIANE MAE', 'QUIBIN', 'NIDOY', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Pharmacist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(232, '95043', 1, 'KENNA AMYLECH', 'RAMOS', 'NISPEROS', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Radiologic Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(233, '83057', 1, 'NARISSA', 'MEDRIANO', 'OCOL', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Property Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(234, '77145', 1, 'MICHELLE ', 'FORTES', 'OLARTE', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(235, '86164', 1, 'RAYGAN ', 'CASTILLO', 'OREL', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Ambulance Driver)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(236, '73080', 1, 'IRENE', 'CEREZO', 'ORINION', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(237, '99670', 1, 'MARICAR', 'VILLANUEVA', 'PACIS', NULL, NULL, 'Female', NULL, 'Naguilian, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(238, '99774', 1, 'DARLENE MAE ', 'MARTINEZ', 'PADUA', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(239, '81116', 1, 'MARLON', 'MARZAN', 'PADUA', NULL, NULL, 'Male', NULL, 'San Juan, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Food Service Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(240, '73079', 1, 'CHERRY', 'DE GUZMAN', 'PANELO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Laundry Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(241, '19115', 1, 'JEANNE MELODY ', 'GUERRO', 'PANES', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Casual', 'Laborer I(Physical Therapist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(242, '82153', 1, 'JONA FE', 'GACAD', 'PASCUA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(243, '86062', 1, 'THERESA', 'OBRERO', 'PEREZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Supply Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(244, '71115', 1, 'DARWIN', 'RIVERA', 'PICAR', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(245, '65082', 1, 'RENATO', 'OBEÑA', 'RAFANAN', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Plumber)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(246, '9', 1, 'JINKEE', 'ESTOESTA', 'RAPIR', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(247, '93015', 1, 'GENIE', 'GANADEN', 'REDUSINDO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nursing Attendant)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(248, '92021', 1, 'ALYSSA MARIE ', 'CASTRO', 'RIMANDO ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Personnel Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(249, '77111', 1, 'DENVER', 'CASTILLO', 'RIVERA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Physiotherapist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(250, '84154', 1, 'JOSE ERIC ', 'CASTILLO', 'RIVERA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(251, '86110', 1, 'MELVIN', 'CANCINO', 'RIVERA', NULL, NULL, 'Male', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Food Service Worker) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(252, '95054', 1, 'JACKIELOU', 'SELGA', 'ROMERO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(253, '66054', 1, 'ROSENDA', 'GAGNI', 'RULLODA', NULL, NULL, 'Female', NULL, 'Garcia, Tubao, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Utility Worker) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(254, '77137', 1, 'ANA', 'MAGLAYA', 'SERAPION', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Utility Worker)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(255, '65079', 1, 'MARGIE', 'ASPIRAS', 'SIBAYAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Billing Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(256, '92048', 1, 'JULIE ANDREA ', 'CACAS', 'SISON', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(257, '76130', 1, 'RACHEL', 'BALDERAS', 'TAMIAO', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(258, '92037', 1, 'MA. DIANE ', 'OFIAZA', 'TAWAGON', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, 'Casual', 'Laborer I (Admitting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(259, '76020', 1, 'GEMMALYN', 'SUNGA', 'URAGAMI', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, 'Casual', 'Laborer I (Philhealth Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(260, '90062', 1, 'ANGELINE', 'JARAVATA', 'URBANO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(261, '96023', 1, 'KLYDE', 'OLIVEROS', 'VALDRIZ', NULL, NULL, 'Female', NULL, 'SFLa Union', NULL, NULL, NULL, 'Casual', 'Laborer I(Respiratory Therapist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(262, '94052', 1, 'ARYTON', 'BASCO', 'VALENCIA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Radiologic Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(263, '93069', 1, 'MARILYN', 'SION', 'VERRANO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(264, '91026', 1, 'JANICE', 'NARVAS', 'VIDUYA', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Cash Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(265, '93034', 1, 'MAY LIZA', 'LACESTE', 'VIERNES', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Medical Technologist)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(266, '92032', 1, 'CHRIS ', 'DE GUZMAN', 'VILLANUEVA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Nurse)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(267, '83035', 1, 'LEE ANN', 'ANCHETA', 'VILLANUEVA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Casual', 'Laborer I (Cash Collecting Clerk)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(268, '95056', 1, 'RUEL', 'NIÑALGA', 'ADAME', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(269, '92114', 1, 'FE ', 'PARROCHA', 'AGRA', NULL, NULL, 'Female', NULL, 'Baguio City', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(270, '76153', 1, 'ALEXANDER', 'ARONGAT', 'AGUILAR', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(271, '95057', 1, 'MARY LOUISE', 'ENOY', 'ALOOT', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'Radiologic Technologist ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(272, '20009', 1, 'MELANIE ', 'NIÑALGA', 'ALTERADO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(273, '20011', 1, 'JENNIFER', 'LACHICA', 'AMANDO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(274, '99806', 1, 'KAREL ANN', 'BOADO', 'AVECILLA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(275, '96022', 1, 'TRISHA ERIKA', 'CACHERO', 'BANAYAT', NULL, NULL, 'Female', NULL, 'Naguilian, La Union', NULL, NULL, NULL, NULL, 'Radiologic Technologist ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(276, '86183', 1, 'DARYL ', 'SORIANO', 'BARTOLO', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(277, '20019', 1, 'PATRICIA MAE ', 'PAMITTAN', 'BASCAO', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(278, '18225', 1, 'RAIZA KAYE ', 'BANWA', 'BASCAO', NULL, NULL, 'Female', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(279, '84189', 1, 'RACHELLE ANN', 'AVELLANA', 'BAUTISTA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Medical Officer (Full-Time)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(280, '99649', 1, 'ROSALINDA', 'DACANAY', 'BAUTISTA', NULL, NULL, 'Female', NULL, 'Tubao, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(281, '20003', 1, 'JESS', 'ESTABILLO', 'BELOCURA', NULL, NULL, 'Male ', NULL, 'Itogon, Benguet', NULL, NULL, NULL, NULL, 'Part-Time Medical Specialist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(282, '18070', 1, 'ARIANNE MAE', 'DE GUZMAN', 'BENGUET', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(283, '69100', 1, 'IMELDA', 'DURIANO', 'BITANGA', NULL, NULL, 'Female', NULL, 'San Miguel, Bulacan', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(284, '73096', 1, 'BELINDA', 'ALBAN', 'BLANZA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(285, '5', 1, 'GEOFREY ', 'DOCTOLERO', 'BORREROS', NULL, NULL, 'Male', NULL, 'Manila', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(286, '99576', 1, 'KRISTOFFERSON ', 'LABUTONG ', 'CABALITAZAN', NULL, NULL, 'Male ', NULL, 'Paniqui, Tarlac', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(287, '19117', 1, 'MARK JOHN ', 'AQUINO ', 'CALUB', NULL, NULL, 'Male ', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'OPD Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(288, '80180', 1, 'ARVIN', 'VIDUYA', 'CARLOS', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(289, '87138', 1, 'JANDEE', 'MIGUEL', 'CARLOS', NULL, NULL, 'Male', NULL, 'Tarlac City', NULL, NULL, NULL, NULL, 'Food Service Worker ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(290, '93082', 1, 'CELEBRITY', 'BACANI', 'CARREON', NULL, NULL, 'Female', NULL, 'Castillejos, Zambales', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(291, '84188', 1, 'ERIC', 'ASPIRAS', 'CARRERA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(292, '91054', 1, 'CLIFFORD', 'ANCHETA', 'CASUGA', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(293, '92092', 1, 'MARK ANTHONY', 'FONTANILLA', 'CERCADO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(294, '84175', 1, 'JOSELITO', 'REMIENDO', 'CORPUZ', NULL, NULL, 'Male', NULL, 'Bauang, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(295, '70114', 1, 'ROSAURO', 'VILLANUEVA', 'CRISOSTOMO', NULL, NULL, 'Male', NULL, 'Tondo, Manila', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(296, '18083', 1, 'FRANCIS JAMES', 'TORIO', 'DACLAN', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(297, '92088', 1, 'MAUREEN', 'NALa UnionPA', 'DACLAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Social Services Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(298, '96041', 1, 'KRISTINE MARIE', 'LIMOS', 'DACPANO', NULL, NULL, 'Female', NULL, 'Tagudin, Ilocos Sur', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(299, '20027', 1, 'CATHERINE', 'REGACHO', 'DE GRACIA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(300, '20002', 1, 'ANNALEE ', 'LULU', 'DE LEON- MANALO ', NULL, NULL, 'Female', NULL, 'Balanga City, Bataan', NULL, NULL, NULL, NULL, 'Part-Time Medical Specialist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(301, '92087', 1, 'HARVEN', 'BOADO', 'DEL ROSARIO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Records Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(302, '99927', 1, 'JEANELLE', 'MARQUESES', 'DELA CRUZ', NULL, NULL, 'Female', NULL, 'Sampaloc, Manila', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(303, '94019', 1, 'RAYMART KHEVIN', 'ARENAS', 'DELA CRUZ', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(304, '90116', 1, 'LEI ANN', 'VILLANUEVA', 'DIANO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(305, '65094', 1, 'GLENDA', 'TAGAPULOT', 'DIO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(306, '99808', 1, 'BRYAN', 'CALLANTA', 'DOCTOLERO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(307, '80170', 1, 'MARIA LEAH', 'CALETENA', 'DOCTOLERO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(308, '89103', 1, 'SHERMAINE JOY', 'BARBACHANO', 'DOCTOLERO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(309, '97997', 1, 'RENZ MARTIN ', 'RONQUILLO', 'DOMONDON', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(310, '87147', 1, 'MANILYN ', 'BAUTISTA', 'DUCUSIN', NULL, NULL, 'Female', NULL, 'Tugegarao, Cagayan', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(311, '93084', 1, 'SAMUEL SON JR.', 'ASPIRAS', 'DULAY', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(312, '20038', 1, 'JENNY ROSE ', 'MANANGAN', 'DULAY', NULL, NULL, 'Female', NULL, 'Pugo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(313, '18193', 1, 'ROXANNE', 'HUNGGANG', 'DULNUAN', NULL, NULL, 'Female', NULL, 'Pugo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(314, '89037', 1, 'JENNIFFER', 'DY', 'DULUEÑA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(315, '19113', 1, 'EDSEL EDWARD', 'LAGLIVA ', 'EDURIA', NULL, NULL, 'Male ', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Part-Time Medical Specialist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(316, '94079', 1, 'WILSON ', 'GALAPATI', 'EMPERADOR', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(317, '96043', 1, 'MA. ANGELICA STEFFANY ', 'MIRANDA', 'ESLAO', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(318, '20001', 1, 'ANTONIO JR. ', 'IGLESIA', 'ESPLANA', NULL, NULL, 'Male ', NULL, 'Albay ', NULL, NULL, NULL, NULL, 'Utility Worker( Groundsman) ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(319, '86170', 1, 'MELANIE ', 'TATAD', 'ESTOESTA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Food Service Worker ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(320, '82157', 1, 'WILMA', 'ARANGORIN', 'FANGON', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Philhealth Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(321, '95038', 1, 'CHELSI MAY', 'CALAUNAN', 'FERNANDEZ', NULL, NULL, 'Female', NULL, 'Sta. Barbara, Pangasinan', NULL, NULL, NULL, NULL, 'OPD Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(322, '18190', 1, 'AIZA', 'ESTOESTA', 'FONTANILLA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(323, '99657', 1, 'JANE ', 'MIRAFLOR', 'FORONDA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(324, '85159', 1, 'LEA', 'DE GUZMAN', 'FRANCO', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(325, '20010', 1, 'VANESSA', 'DE LA PEÑA', 'GALI', NULL, NULL, 'Female', NULL, 'Bauang, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(326, '18099', 1, 'MARK JOSEPH ', 'VALLEJO', 'GALVAN', NULL, NULL, 'Male', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(327, '80190', 1, 'MARY ANN ', 'GUNDAYAO', 'GAMBOA', NULL, NULL, 'Female', NULL, 'Caloocan City', NULL, NULL, NULL, NULL, 'Admitting Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(328, '19142', 1, 'JOVEE THEA ', 'ABALOS', 'GAMILDE', NULL, NULL, 'Female', NULL, 'Mankayan, Benguet ', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(329, '99809', 1, 'MARK ANTHONY', 'LARON', 'GANADEN', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Security Staff', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(330, '92108', 1, 'JANINE KRISTINE ', 'PADAN', 'GARCIA', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(331, '19034', 1, 'LIEZLE HANZ ', 'REFUERZO ', 'GATCHALIAN', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(332, '81176', 1, 'FERDINAND', 'EMPERADOR', 'GAYO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(333, '88122', 1, 'ARIZTOTLE', 'DULAY', 'GAZMEN', NULL, NULL, 'Male', NULL, 'Tubao, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(334, '90117', 1, 'JOSMAR', 'MACULAD', 'GERNALE', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Admitting Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(335, '68093', 1, 'PURITA', 'LAROYA', 'GOMEZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(336, '95072', 1, 'ARVHIE', 'BALANAG', 'GRABANZOR', NULL, NULL, 'Male', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'MIS Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(337, '92099', 1, 'SARAH MIEH', 'LITAS', 'HERNANDEZ', NULL, NULL, 'Female', NULL, 'Quezon City', NULL, NULL, NULL, NULL, 'Admitting Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(338, '19033', 1, 'JAIMELYN ', 'LICTAO ', 'HIDALGO', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(339, '93033', 1, 'KATRINA SHEEN', 'DE MESA', 'ISIBIDO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Records Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(340, '19029', 1, 'KIMBERLY', 'DE MESA ', 'ISIBIDO ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Pharmacist ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(341, '99342', 1, 'JENNALYN', 'NIEVA', 'JADORMEO', NULL, NULL, 'Female', NULL, 'Sta. Cruz, Manila', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(342, '98006', 1, 'SHEENA MAE', 'DACALCAP', 'JUAN', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(343, '86179', 1, 'MARLON', 'MATEO', 'LAGLIVA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Property Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(344, '73095', 1, 'JOSEPH', 'AUSTRIA', 'LAZARO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(345, '75135', 1, 'RODOLFO', 'DULAY', 'MADARANG', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Admitting Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(346, '84172', 1, 'LUIE', NULL, 'MADRIAGA', NULL, NULL, 'Male', NULL, 'Pugo, La Union', NULL, NULL, NULL, NULL, 'Records Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(347, '19035', 1, 'BIANCA MAE ', 'BOSQUE', 'MAGNO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(348, '99817', 1, 'MARIA KATRINA ', 'MARTINEZ', 'MAMUYAC', NULL, NULL, 'Female', NULL, 'Makati City', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(349, '19004', 1, 'JUDY ANN', 'ANGEL', 'MENDOZA', NULL, NULL, 'Female', NULL, 'Sta. Maria, Ilocos Sur', NULL, NULL, NULL, NULL, 'Psychometrician', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(350, '19074', 1, 'CHRSITIAN ANGELO', 'GALERA', 'MILANA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Clerk ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(351, '54039', 1, 'MARIA NIDA', 'SISON', 'MORTERO', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, NULL, 'Part-Time Medical Specialist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(352, '99720', 1, 'PANCHO', 'TANGALIN', 'OBRA', NULL, NULL, 'Male', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Plumber', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(353, '71129', 1, 'BRENDA', 'ALOOT', 'OFIANA', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(354, '91074', 1, 'NELSON', 'ISIBIDO', 'ORDOÑA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Billing Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(355, '99812', 1, 'MARY JANE', 'VELASCO', 'ORENCIA', NULL, NULL, 'Female', NULL, 'Sta. Cruz, Manila', NULL, NULL, NULL, NULL, 'Nursing Attendant', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(356, '84160', 1, 'CHARLEMAGNE', 'TAVAS', 'ORIBELLO', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(357, '99658', 1, 'RONALDO ', 'DACALAÑO', 'PADIN', NULL, NULL, 'Male', NULL, 'Sto. Tomas, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(358, '99974', 1, 'CHRISTOFFER', 'MUNAR', 'PANEDA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(359, '92086', 1, 'MARK ', 'PEDRING', 'PATANGAN', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(360, '85155', 1, 'VANESSA', 'ORPILLA', 'PAULINO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(361, '19032', 1, 'JANET ', 'CARRERA', 'PERALTA', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(362, '19141', 1, 'ROXANNE', 'NISPEROS ', 'PRE', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(363, '90119', 1, 'VIA LORRAINE ', 'BARROGA', 'QUIBOTE', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(364, '82169', 1, 'ERICSON', 'DE VERA', 'RAMIREZ', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(365, '99926', 1, 'JOKER', 'SAMBRANO', 'RAMOS', NULL, NULL, 'Male', NULL, 'Caba, La Union', NULL, NULL, NULL, NULL, 'Security Staff', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(366, '20029', 1, 'MARREN JOY ', 'BOADO', 'RASAY', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(367, '19116', 1, 'STEPHEN RAY ', 'SANTIAGO ', 'RENDON', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Laundry Worker ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(368, '96012', 1, 'MARVIN', 'GINGO', 'RIVERA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Philhealth Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(369, '96040', 1, 'SIEGFRED', 'ORDOÑA', 'ROBLES', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(370, '18185', 1, 'MARIVIC', 'SOMERA', 'SABDANI', NULL, NULL, 'Female', NULL, 'Manila', NULL, NULL, NULL, NULL, 'Respiratory Therapist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(371, '94055', 1, 'MARIEL CATRINA', 'POCSIDIO', 'SALES', NULL, NULL, 'Female', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Billing Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(372, '10', 1, 'GENARO', 'GARCIA', 'SAMONTE', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Maintenance Man', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(373, '87141', 1, 'VENUS', 'FORTES', 'SANCHEZ', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Laundry Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(374, '76152', 1, 'PAZ', 'GARCIA', 'SIENES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Personnel Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(375, '89095', 1, 'RACHEL ANNE', 'RONQUILLO', 'SINGZON', NULL, NULL, 'Female', NULL, 'Tacloban  City', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(376, '92115', 1, 'JEANZY ', 'AMIGO ', 'SOLOMON', NULL, NULL, 'Female', NULL, 'Caba, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(377, '82152', 1, 'CHARITO', 'DULAY', 'SORIANO', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'Philhealth Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(378, '19123', 1, 'JOHANNES ', 'SELGA', 'TACLAY', NULL, NULL, 'Male ', NULL, 'San Fernando City, La Union', NULL, NULL, NULL, NULL, 'Clerk ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(379, '93022', 1, 'ROXANNE BERYL', 'Dela Rosa', 'TAGATAC', NULL, NULL, 'Female', NULL, 'Bauang, La Union', NULL, NULL, NULL, NULL, 'Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(380, '19031', 1, 'HEIDE DAINE ', 'ITLIONG', 'TAMAYO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nurse ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(381, '20037', 1, 'WELISA', 'RIVERA', 'TAMAYO', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(382, '87148', 1, 'LORENZO FRANCIS', 'RONCESVALLES', 'VALDEZ', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Records Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(383, '78155', 1, 'GEMMA', 'ESTOLAS', 'VERCELES', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(384, '82154', 1, 'MARJORIE', 'RIVERA', 'VILA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Philhealth Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(385, '75144', 1, 'DIEGO', 'OBRERO', 'VILLANUEVA', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Utility Worker', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(386, '20018', 1, 'GLADYS ', 'SAMONTE', 'VILLANUEVA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Nursing Attendant ', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(387, '73094', 1, 'LIEZEL ', 'GATTU', 'YAMBALLA', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Pharmacist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(388, '91083', 1, 'ELEIZER', 'CABATCAN', 'ZARATE', NULL, NULL, 'Male', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Biomedical Technician', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(389, '81171', 1, 'JENIFER', 'DE VERA', 'ZARATE', NULL, NULL, 'Female', NULL, 'Aringay, La Union', NULL, NULL, NULL, NULL, 'CEO Clerk', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(390, '70042', 1, 'GENALYN', 'DE VERA', 'ANCHETA', NULL, NULL, 'Female', NULL, 'Rosario, La Union', NULL, NULL, NULL, NULL, 'Nurse II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(391, '20034', 1, 'KRISTINE DIANNE ', 'Q', 'AVILES', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, 'COVID-19 Project-Based Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(392, '60041', 1, 'PACITA', 'SORIANO', 'GAMAYEN', NULL, NULL, 'Female', NULL, 'Bauang, La Union', NULL, NULL, NULL, NULL, 'Comm. Equip\'t Oprt. II', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(393, '20033', 1, 'WREN JAELEEN ', 'A', 'PALABAY', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, 'COVID-19 Project-Based Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(394, '20035', 1, 'KARLA PAULINE', 'B', 'PASUQUIN', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, 'COVID-19 Project-Based Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(395, '20032', 1, 'CHARLES RUSSEL ', 'C', 'PETINA', NULL, NULL, 'Male ', NULL, NULL, NULL, NULL, NULL, NULL, 'COVID-19 Project-Based Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(396, '20036', 1, 'DONNA MARIE ', 'F', 'SANTOS', NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, NULL, 'COVID-19 Project-Based Nurse', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(397, '20026', 1, 'Irene Ivanna', 'M', 'Santiago', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'DOH Detailed (Med Tech)', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(398, '20025', 1, 'Angieneette', 'A', 'Acosta', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, NULL, 'Detailed Med tech', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(399, '20028', 1, 'Kate Andriane', 'F', 'Balderas', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Volunteer', 'Phlebotomist Encoder', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07'),
(400, '20020', 1, 'Nicole Paulynne', 'B', 'Gali', NULL, NULL, 'Female', NULL, 'Agoo, La Union', NULL, NULL, NULL, 'Volunteer', 'Pharmacist', NULL, NULL, NULL, NULL, 0, '2021-01-07 19:54:07', '2021-01-07 19:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leaves_dates`
--

CREATE TABLE `leaves_dates` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_duration` varchar(20) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manual_logs`
--

CREATE TABLE `manual_logs` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `log` datetime DEFAULT NULL,
  `allotment` varchar(20) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  `flexible` int(10) NOT NULL DEFAULT 0,
  `is_default` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `description`, `flexible`, `is_default`) VALUES
(1, '8AM-5PM', 0, NULL),
(2, 'Flexi', 1, 1),
(3, 'Utility', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_details`
--

CREATE TABLE `schedule_details` (
  `id` int(10) NOT NULL,
  `schedule_id` int(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `morning_in` time NOT NULL,
  `morning_cutoff` time DEFAULT NULL,
  `morning_out` time NOT NULL,
  `lunch_break_cutoff` time DEFAULT NULL,
  `afternoon_in` time NOT NULL,
  `afternoon_cutoff` time DEFAULT NULL,
  `afternoon_out` time NOT NULL,
  `morning_grace_period` int(11) DEFAULT NULL,
  `afternoon_grace_period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_details`
--

INSERT INTO `schedule_details` (`id`, `schedule_id`, `day`, `morning_in`, `morning_cutoff`, `morning_out`, `lunch_break_cutoff`, `afternoon_in`, `afternoon_cutoff`, `afternoon_out`, `morning_grace_period`, `afternoon_grace_period`) VALUES
(1, 1, 'Monday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', 10, 10),
(2, 1, 'Tuesday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(3, 1, 'Wednesday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(4, 1, 'Thursday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(5, 1, 'Friday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(6, 1, 'Saturday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(7, 1, 'Sunday', '08:00:00', '10:30:00', '12:00:00', '12:30:00', '13:00:00', '15:30:00', '17:00:00', NULL, NULL),
(8, 2, 'Monday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(9, 2, 'Tuesday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(10, 2, 'Wednesday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(11, 2, 'Thursday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(12, 2, 'Friday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(13, 2, 'Saturday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(14, 2, 'Sunday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, NULL),
(15, 3, 'Monday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(16, 3, 'Tuesday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(17, 3, 'Wednesday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(18, 3, 'Thursday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(19, 3, 'Friday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(20, 3, 'Saturday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL),
(21, 3, 'Sunday', '06:00:00', '08:30:00', '10:00:00', '11:00:00', '12:00:00', '14:30:00', '16:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `travel_orders`
--

CREATE TABLE `travel_orders` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `travel_orders_dates`
--

CREATE TABLE `travel_orders_dates` (
  `id` int(11) NOT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `to_duration` varchar(20) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backlogs`
--
ALTER TABLE `backlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pers_id` (`pers_id`);

--
-- Indexes for table `dtr`
--
ALTER TABLE `dtr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `leaves_dates`
--
ALTER TABLE `leaves_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_id` (`leave_id`);

--
-- Indexes for table `manual_logs`
--
ALTER TABLE `manual_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pers_id` (`employee_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_details`
--
ALTER TABLE `schedule_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `travel_orders`
--
ALTER TABLE `travel_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `travel_orders_dates`
--
ALTER TABLE `travel_orders_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_id` (`to_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backlogs`
--
ALTER TABLE `backlogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dtr`
--
ALTER TABLE `dtr`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves_dates`
--
ALTER TABLE `leaves_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_logs`
--
ALTER TABLE `manual_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule_details`
--
ALTER TABLE `schedule_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `travel_orders`
--
ALTER TABLE `travel_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travel_orders_dates`
--
ALTER TABLE `travel_orders_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dtr`
--
ALTER TABLE `dtr`
  ADD CONSTRAINT `dtr_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves_dates`
--
ALTER TABLE `leaves_dates`
  ADD CONSTRAINT `leaves_dates_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `manual_logs`
--
ALTER TABLE `manual_logs`
  ADD CONSTRAINT `manual_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `schedule_details`
--
ALTER TABLE `schedule_details`
  ADD CONSTRAINT `schedule_details_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `travel_orders`
--
ALTER TABLE `travel_orders`
  ADD CONSTRAINT `travel_orders_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `travel_orders_dates`
--
ALTER TABLE `travel_orders_dates`
  ADD CONSTRAINT `travel_orders_dates_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `travel_orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
