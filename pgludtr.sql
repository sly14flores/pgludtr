-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 13, 2017 at 02:09 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `empid`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `gender`, `address`, `contact_no`, `email`, `appointment_status`, `position`, `gsis`, `sss`, `hdmf`, `philhealth`, `is_built_in`) VALUES
(1, '82156', 'Sly', 'Bulilan', 'Flores', 'admin', 'admin', '', '', '', '', '', '', '', '', '', '', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
