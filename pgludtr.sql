-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2017 at 03:47 PM
-- Server version: 5.6.20
-- PHP Version: 5.4.31

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pgludtr`
--

-- --------------------------------------------------------

--
-- Table structure for table `backlogs`
--

CREATE TABLE IF NOT EXISTS `backlogs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pers_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `log` datetime NOT NULL,
  `machine` int(11) NOT NULL,
  `system_log` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=159 ;

--
-- Dumping data for table `backlogs`
--

INSERT INTO `backlogs` (`id`, `pers_id`, `date`, `log`, `machine`, `system_log`) VALUES
(1, '70065', '2017-01-02', '2017-01-02 00:01:17', 2, '2017-01-25 15:44:44'),
(2, '70065', '2017-01-02', '2017-01-02 00:01:20', 2, '2017-01-25 15:44:44'),
(3, '73077', '2017-01-02', '2017-01-02 00:03:49', 2, '2017-01-25 15:44:44'),
(4, '73077', '2017-01-02', '2017-01-02 00:03:51', 2, '2017-01-25 15:44:44'),
(5, '73077', '2017-01-02', '2017-01-02 00:03:54', 2, '2017-01-25 15:44:44'),
(6, '83065', '2017-01-02', '2017-01-02 00:15:23', 2, '2017-01-25 15:44:44'),
(7, '83065', '2017-01-02', '2017-01-02 00:15:27', 2, '2017-01-25 15:44:44'),
(8, '76064', '2017-01-02', '2017-01-02 01:06:05', 2, '2017-01-25 15:44:44'),
(9, '76064', '2017-01-02', '2017-01-02 01:06:07', 2, '2017-01-25 15:44:44'),
(10, '73083', '2017-01-02', '2017-01-02 07:29:34', 2, '2017-01-25 15:44:44'),
(11, '73083', '2017-01-02', '2017-01-02 07:29:39', 2, '2017-01-25 15:44:44'),
(12, '73083', '2017-01-02', '2017-01-02 07:29:40', 2, '2017-01-25 15:44:45'),
(13, '73083', '2017-01-02', '2017-01-02 07:29:42', 2, '2017-01-25 15:44:45'),
(14, '59031', '2017-01-02', '2017-01-02 07:41:14', 2, '2017-01-25 15:44:45'),
(15, '59031', '2017-01-02', '2017-01-02 07:41:17', 2, '2017-01-25 15:44:45'),
(16, '55030', '2017-01-02', '2017-01-02 07:45:22', 2, '2017-01-25 15:44:45'),
(17, '70077', '2017-01-02', '2017-01-02 08:04:05', 2, '2017-01-25 15:44:45'),
(18, '70077', '2017-01-02', '2017-01-02 08:04:07', 2, '2017-01-25 15:44:45'),
(19, '76064', '2017-01-02', '2017-01-02 08:04:14', 2, '2017-01-25 15:44:45'),
(20, '76064', '2017-01-02', '2017-01-02 08:04:16', 2, '2017-01-25 15:44:45'),
(21, '76064', '2017-01-02', '2017-01-02 08:04:18', 2, '2017-01-25 15:44:45'),
(22, '78114', '2017-01-02', '2017-01-02 08:23:24', 2, '2017-01-25 15:44:45'),
(23, '78114', '2017-01-02', '2017-01-02 08:23:27', 2, '2017-01-25 15:44:45'),
(24, '58063', '2017-01-02', '2017-01-02 08:24:09', 2, '2017-01-25 15:44:45'),
(25, '58063', '2017-01-02', '2017-01-02 08:24:14', 2, '2017-01-25 15:44:45'),
(26, '83120', '2017-01-02', '2017-01-02 08:24:57', 2, '2017-01-25 15:44:45'),
(27, '65008', '2017-01-02', '2017-01-02 08:25:16', 2, '2017-01-25 15:44:45'),
(28, '67003', '2017-01-02', '2017-01-02 08:29:15', 2, '2017-01-25 15:44:46'),
(29, '67003', '2017-01-02', '2017-01-02 08:29:20', 2, '2017-01-25 15:44:46'),
(30, '84098', '2017-01-02', '2017-01-02 09:46:14', 2, '2017-01-25 15:44:46'),
(31, '84098', '2017-01-02', '2017-01-02 09:46:15', 2, '2017-01-25 15:44:46'),
(32, '67002', '2017-01-02', '2017-01-02 10:59:03', 2, '2017-01-25 15:44:46'),
(33, '65008', '2017-01-02', '2017-01-02 12:00:20', 2, '2017-01-25 15:44:46'),
(34, '60007', '2017-01-02', '2017-01-02 12:00:35', 2, '2017-01-25 15:44:46'),
(35, '76010', '2017-01-02', '2017-01-02 12:00:46', 2, '2017-01-25 15:44:46'),
(36, '64062', '2017-01-02', '2017-01-02 12:00:50', 2, '2017-01-25 15:44:46'),
(37, '93059', '2017-01-02', '2017-01-02 12:00:55', 2, '2017-01-25 15:44:46'),
(38, '93059', '2017-01-02', '2017-01-02 12:01:09', 2, '2017-01-25 15:44:46'),
(39, '63006', '2017-01-02', '2017-01-02 12:01:16', 2, '2017-01-25 15:44:46'),
(40, '63006', '2017-01-02', '2017-01-02 12:01:19', 2, '2017-01-25 15:44:46'),
(41, '79103', '2017-01-02', '2017-01-02 12:01:29', 2, '2017-01-25 15:44:46'),
(42, '86088', '2017-01-02', '2017-01-02 12:01:55', 2, '2017-01-25 15:44:47'),
(43, '86019', '2017-01-02', '2017-01-02 12:02:01', 2, '2017-01-25 15:44:47'),
(44, '93013', '2017-01-02', '2017-01-02 12:02:04', 2, '2017-01-25 15:44:47'),
(45, '64021', '2017-01-02', '2017-01-02 12:02:13', 2, '2017-01-25 15:44:47'),
(46, '87057', '2017-01-02', '2017-01-02 12:02:17', 2, '2017-01-25 15:44:47'),
(47, '87057', '2017-01-02', '2017-01-02 12:02:21', 2, '2017-01-25 15:44:47'),
(48, '66006', '2017-01-02', '2017-01-02 12:02:23', 2, '2017-01-25 15:44:47'),
(49, '66006', '2017-01-02', '2017-01-02 12:02:28', 2, '2017-01-25 15:44:47'),
(50, '85090', '2017-01-02', '2017-01-02 12:02:31', 2, '2017-01-25 15:44:47'),
(51, '67003', '2017-01-02', '2017-01-02 12:02:36', 2, '2017-01-25 15:44:47'),
(52, '67003', '2017-01-02', '2017-01-02 12:02:38', 2, '2017-01-25 15:44:47'),
(53, '78002', '2017-01-02', '2017-01-02 12:02:42', 2, '2017-01-25 15:44:47'),
(54, '92069', '2017-01-02', '2017-01-02 12:03:10', 2, '2017-01-25 15:44:47'),
(55, '84098', '2017-01-02', '2017-01-02 12:05:26', 2, '2017-01-25 15:44:47'),
(56, '84098', '2017-01-02', '2017-01-02 12:05:28', 2, '2017-01-25 15:44:47'),
(57, '77110', '2017-01-02', '2017-01-02 12:06:42', 2, '2017-01-25 15:44:47'),
(58, '77110', '2017-01-02', '2017-01-02 12:06:46', 2, '2017-01-25 15:44:47'),
(59, '92069', '2017-01-02', '2017-01-02 12:31:31', 2, '2017-01-25 15:44:48'),
(60, '78002', '2017-01-02', '2017-01-02 12:37:44', 2, '2017-01-25 15:44:48'),
(61, '92039', '2017-01-02', '2017-01-02 12:39:18', 2, '2017-01-25 15:44:48'),
(62, '84098', '2017-01-02', '2017-01-02 12:41:26', 2, '2017-01-25 15:44:48'),
(63, '84098', '2017-01-02', '2017-01-02 12:41:28', 2, '2017-01-25 15:44:48'),
(64, '67003', '2017-01-02', '2017-01-02 12:41:59', 2, '2017-01-25 15:44:48'),
(65, '67003', '2017-01-02', '2017-01-02 12:42:01', 2, '2017-01-25 15:44:48'),
(66, '86019', '2017-01-02', '2017-01-02 12:42:04', 2, '2017-01-25 15:44:48'),
(67, '77110', '2017-01-02', '2017-01-02 12:45:21', 2, '2017-01-25 15:44:48'),
(68, '77110', '2017-01-02', '2017-01-02 12:45:24', 2, '2017-01-25 15:44:48'),
(69, '83120', '2017-01-02', '2017-01-02 13:08:20', 2, '2017-01-25 15:44:48'),
(70, '74105', '2017-01-02', '2017-01-02 15:41:52', 2, '2017-01-25 15:44:48'),
(71, '74105', '2017-01-02', '2017-01-02 15:41:54', 2, '2017-01-25 15:44:48'),
(72, '74105', '2017-01-02', '2017-01-02 15:41:56', 2, '2017-01-25 15:44:48'),
(73, '74105', '2017-01-02', '2017-01-02 15:41:58', 2, '2017-01-25 15:44:48'),
(74, '66058', '2017-01-02', '2017-01-02 15:50:52', 2, '2017-01-25 15:44:49'),
(75, '66058', '2017-01-02', '2017-01-02 15:50:53', 2, '2017-01-25 15:44:49'),
(76, '66058', '2017-01-02', '2017-01-02 15:50:55', 2, '2017-01-25 15:44:49'),
(77, '66058', '2017-01-02', '2017-01-02 15:50:57', 2, '2017-01-25 15:44:49'),
(78, '70077', '2017-01-02', '2017-01-02 16:01:31', 2, '2017-01-25 15:44:49'),
(79, '70077', '2017-01-02', '2017-01-02 16:01:34', 2, '2017-01-25 15:44:49'),
(80, '55030', '2017-01-02', '2017-01-02 16:01:44', 2, '2017-01-25 15:44:49'),
(81, '55030', '2017-01-02', '2017-01-02 16:01:46', 2, '2017-01-25 15:44:49'),
(82, '55030', '2017-01-02', '2017-01-02 16:01:48', 2, '2017-01-25 15:44:49'),
(83, '73083', '2017-01-02', '2017-01-02 16:02:39', 2, '2017-01-25 15:44:49'),
(84, '73083', '2017-01-02', '2017-01-02 16:02:42', 2, '2017-01-25 15:44:49'),
(85, '73083', '2017-01-02', '2017-01-02 16:02:45', 2, '2017-01-25 15:44:49'),
(86, '63006', '2017-01-02', '2017-01-02 16:50:06', 2, '2017-01-25 15:44:49'),
(87, '63006', '2017-01-02', '2017-01-02 16:50:09', 2, '2017-01-25 15:44:49'),
(88, '92069', '2017-01-02', '2017-01-02 17:09:52', 2, '2017-01-25 15:44:49'),
(89, '59031', '2017-01-02', '2017-01-02 17:16:42', 2, '2017-01-25 15:44:50'),
(90, '59031', '2017-01-02', '2017-01-02 17:16:45', 2, '2017-01-25 15:44:50'),
(91, '56061', '2017-01-02', '2017-01-02 18:00:41', 2, '2017-01-25 15:44:50'),
(92, '56061', '2017-01-02', '2017-01-02 18:00:42', 2, '2017-01-25 15:44:50'),
(93, '67002', '2017-01-02', '2017-01-02 18:15:07', 2, '2017-01-25 15:44:50'),
(94, '64062', '2017-01-02', '2017-01-02 19:25:33', 2, '2017-01-25 15:44:50'),
(95, '93059', '2017-01-02', '2017-01-02 19:47:02', 2, '2017-01-25 15:44:50'),
(96, '93059', '2017-01-02', '2017-01-02 19:47:08', 2, '2017-01-25 15:44:50'),
(97, '74029', '2017-01-02', '2017-01-02 20:00:37', 2, '2017-01-25 15:44:50'),
(98, '60007', '2017-01-02', '2017-01-02 20:02:32', 2, '2017-01-25 15:44:50'),
(99, '85090', '2017-01-02', '2017-01-02 20:05:26', 2, '2017-01-25 15:44:50'),
(100, '65008', '2017-01-02', '2017-01-02 20:05:46', 2, '2017-01-25 15:44:50'),
(101, '93013', '2017-01-02', '2017-01-02 20:07:17', 2, '2017-01-25 15:44:50'),
(102, '93013', '2017-01-02', '2017-01-02 20:07:18', 2, '2017-01-25 15:44:50'),
(103, '78002', '2017-01-02', '2017-01-02 20:07:30', 2, '2017-01-25 15:44:50'),
(104, '66006', '2017-01-02', '2017-01-02 20:07:40', 2, '2017-01-25 15:44:50'),
(105, '67003', '2017-01-02', '2017-01-02 20:07:54', 2, '2017-01-25 15:44:51'),
(106, '67003', '2017-01-02', '2017-01-02 20:07:56', 2, '2017-01-25 15:44:51'),
(107, '86009', '2017-01-02', '2017-01-02 20:11:10', 2, '2017-01-25 15:44:51'),
(108, '73077', '2017-01-02', '2017-01-02 21:20:40', 2, '2017-01-25 15:44:51'),
(109, '73077', '2017-01-02', '2017-01-02 21:20:42', 2, '2017-01-25 15:44:51'),
(110, '73077', '2017-01-02', '2017-01-02 21:20:45', 2, '2017-01-25 15:44:51'),
(111, '65074', '2017-01-02', '2017-01-02 22:03:29', 2, '2017-01-25 15:44:51'),
(112, '86019', '2017-01-02', '2017-01-02 22:03:33', 2, '2017-01-25 15:44:51'),
(113, '79103', '2017-01-02', '2017-01-02 22:03:49', 2, '2017-01-25 15:44:51'),
(114, '86088', '2017-01-02', '2017-01-02 22:47:02', 2, '2017-01-25 15:44:51'),
(115, '87057', '2017-01-02', '2017-01-02 22:47:47', 2, '2017-01-25 15:44:51'),
(116, '76010', '2017-01-02', '2017-01-02 22:48:02', 2, '2017-01-25 15:44:51'),
(117, '87057', '2017-01-02', '2017-01-02 22:48:11', 2, '2017-01-25 15:44:51'),
(118, '76010', '2017-01-02', '2017-01-02 22:48:16', 2, '2017-01-25 15:44:51'),
(119, '80148', '2017-01-02', '2017-01-02 23:22:44', 2, '2017-01-25 15:44:51'),
(120, '80148', '2017-01-02', '2017-01-02 23:22:46', 2, '2017-01-25 15:44:51'),
(121, '70065', '2017-01-02', '2017-01-02 23:30:14', 2, '2017-01-25 15:44:51'),
(122, '70065', '2017-01-02', '2017-01-02 23:30:16', 2, '2017-01-25 15:44:52'),
(123, '83065', '2017-01-02', '2017-01-02 23:38:05', 2, '2017-01-25 15:44:52'),
(124, '83065', '2017-01-02', '2017-01-02 23:38:10', 2, '2017-01-25 15:44:52'),
(125, '81090', '2017-01-02', '2017-01-02 23:48:33', 2, '2017-01-25 15:44:52'),
(126, '79151', '2017-01-02', '2017-01-02 00:06:14', 5, '2017-01-25 15:45:09'),
(127, '79151', '2017-01-02', '2017-01-02 00:06:21', 5, '2017-01-25 15:45:09'),
(128, '79151', '2017-01-02', '2017-01-02 00:06:25', 5, '2017-01-25 15:45:09'),
(129, '77109', '2017-01-02', '2017-01-02 00:06:30', 5, '2017-01-25 15:45:09'),
(130, '77109', '2017-01-02', '2017-01-02 00:06:32', 5, '2017-01-25 15:45:09'),
(131, '80131', '2017-01-02', '2017-01-02 07:25:05', 5, '2017-01-25 15:45:09'),
(132, '80131', '2017-01-02', '2017-01-02 07:25:07', 5, '2017-01-25 15:45:09'),
(133, '80131', '2017-01-02', '2017-01-02 07:25:09', 5, '2017-01-25 15:45:09'),
(134, '75102', '2017-01-02', '2017-01-02 07:48:11', 5, '2017-01-25 15:45:09'),
(135, '71069', '2017-01-02', '2017-01-02 08:04:50', 5, '2017-01-25 15:45:09'),
(136, '71069', '2017-01-02', '2017-01-02 08:04:52', 5, '2017-01-25 15:45:09'),
(137, '71069', '2017-01-02', '2017-01-02 08:04:55', 5, '2017-01-25 15:45:09'),
(138, '65054', '2017-01-02', '2017-01-02 09:53:14', 5, '2017-01-25 15:45:09'),
(139, '65054', '2017-01-02', '2017-01-02 09:53:15', 5, '2017-01-25 15:45:10'),
(140, '65054', '2017-01-02', '2017-01-02 09:53:17', 5, '2017-01-25 15:45:10'),
(141, '65054', '2017-01-02', '2017-01-02 09:53:19', 5, '2017-01-25 15:45:10'),
(142, '65054', '2017-01-02', '2017-01-02 09:53:22', 5, '2017-01-25 15:45:10'),
(143, '65054', '2017-01-02', '2017-01-02 09:53:25', 5, '2017-01-25 15:45:10'),
(144, '65054', '2017-01-02', '2017-01-02 12:46:07', 5, '2017-01-25 15:45:10'),
(145, '65054', '2017-01-02', '2017-01-02 12:46:09', 5, '2017-01-25 15:45:10'),
(146, '76145', '2017-01-02', '2017-01-02 15:34:12', 5, '2017-01-25 15:45:10'),
(147, '76145', '2017-01-02', '2017-01-02 15:34:15', 5, '2017-01-25 15:45:10'),
(148, '79151', '2017-01-02', '2017-01-02 15:46:39', 5, '2017-01-25 15:45:10'),
(149, '79151', '2017-01-02', '2017-01-02 15:46:43', 5, '2017-01-25 15:45:10'),
(150, '80131', '2017-01-02', '2017-01-02 16:01:10', 5, '2017-01-25 15:45:10'),
(151, '80131', '2017-01-02', '2017-01-02 16:01:12', 5, '2017-01-25 15:45:10'),
(152, '80131', '2017-01-02', '2017-01-02 16:01:14', 5, '2017-01-25 15:45:10'),
(153, '75102', '2017-01-02', '2017-01-02 16:01:30', 5, '2017-01-25 15:45:10'),
(154, '79139', '2017-01-02', '2017-01-02 22:44:30', 5, '2017-01-25 15:45:10'),
(155, '79139', '2017-01-02', '2017-01-02 22:44:33', 5, '2017-01-25 15:45:11'),
(156, '77109', '2017-01-02', '2017-01-02 23:30:20', 5, '2017-01-25 15:45:11'),
(157, '77109', '2017-01-02', '2017-01-02 23:30:22', 5, '2017-01-25 15:45:11'),
(158, '77109', '2017-01-02', '2017-01-02 23:30:24', 5, '2017-01-25 15:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `empid` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `appointment_status` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `gsis` varchar(50) NOT NULL,
  `sss` varchar(50) NOT NULL,
  `hdmf` varchar(50) NOT NULL,
  `philhealth` varchar(50) NOT NULL,
  `is_built_in` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `empid`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `gender`, `birthday`, `birthplace`, `address`, `contact_no`, `email`, `appointment_status`, `position`, `gsis`, `sss`, `hdmf`, `philhealth`, `is_built_in`) VALUES
(1, '82156', 'Sly', 'Bulilan', 'Flores', 'admin', 'admin', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 1),
(2, '87129', 'Mark Edwin', 'Tolentino', 'Rivera', '', '', 'Male', '1987-10-21', 'sfclu', '351 ilocanos norte sfclu', '09152480262', 'marketrivera@gmail.com', 'JO', 'jo', '', '', '', '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
