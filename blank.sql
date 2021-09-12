-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 09:58 AM
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
  `is_built_in` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `empid`, `schedule_id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `gender`, `birthday`, `birthplace`, `address`, `contact_no`, `email`, `appointment_status`, `position`, `gsis`, `sss`, `hdmf`, `philhealth`, `is_built_in`) VALUES
(1, '82156', 0, 'Sly', 'Bulilan', 'Flores', 'admin', 'admin', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 1);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
