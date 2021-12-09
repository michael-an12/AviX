-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2021 at 04:33 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Avi_X_48682022`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_CENTER`
--

CREATE TABLE `ADMIN_CENTER` (
  `COST_ID` int(11) DEFAULT NULL,
  `ADMIN_BUDGET` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ADMIN_CENTER`
--

INSERT INTO `ADMIN_CENTER` (`COST_ID`, `ADMIN_BUDGET`) VALUES
(1, 5000),
(2, 2500),
(3, 5700),
(4, 1200),
(5, 2300);

-- --------------------------------------------------------

--
-- Table structure for table `AIRCRAFT`
--

CREATE TABLE `AIRCRAFT` (
  `AIRCRAFT_ID` int(11) NOT NULL,
  `AIRCRAFT_CODE` varchar(100) NOT NULL,
  `AIRCRAFT_IMAGE` varchar(200) NOT NULL,
  `AIRCRAFT_NAME` varchar(20) DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PURPOSE` enum('LEASE','FOR SALE') DEFAULT NULL,
  `MODEL_ID` int(11) DEFAULT NULL,
  `FACILITY_ID` int(11) DEFAULT NULL,
  `PRODUCTION_LEAD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AIRCRAFT`
--

INSERT INTO `AIRCRAFT` (`AIRCRAFT_ID`, `AIRCRAFT_CODE`, `AIRCRAFT_IMAGE`, `AIRCRAFT_NAME`, `CREATION_DATE`, `PRICE`, `QUANTITY`, `PURPOSE`, `MODEL_ID`, `FACILITY_ID`, `PRODUCTION_LEAD`) VALUES
(1, 'D4', 'acimg/p1.jpg', 'DELTA1', '2020-06-19', 735000, 1, 'FOR SALE', 2, 4, 'JERRY MILLS'),
(2, 'AM21', 'acimg/d1.jpg', 'HellchargerX8', '2020-07-01', 645000, 1, 'FOR SALE', 5, 3, 'TINA TURNER'),
(3, 'N1', 'acimg/H1.jpg', 'NIGHTHAWK', '2019-08-30', 535000, 1, 'FOR SALE', 3, 1, 'CHARLES GREY'),
(4, 'R1', 'acimg/f3.jpg', 'RAVEN', '2019-09-08', 135000, 1, 'LEASE', 4, 2, 'JANE FOSTER'),
(5, 'H1', 'acimg/d2.jpg', 'HELLDIVER', '2019-08-17', 965000, 1, 'FOR SALE', 5, 4, 'JOHN DOE'),
(6, 'F1', 'acimg/h2.jpg', 'FOXTROT', '2021-04-12', 236000, 1, 'LEASE', 3, 1, 'ANTIONETTE VALDEZ'),
(7, 'AM3', 'acimg/p2.jpg', 'AviM320-300', '2021-06-13', 215000, 1, 'LEASE', 2, 3, 'JACK FROST');

-- --------------------------------------------------------

--
-- Table structure for table `AIRWORTHY_STATUS`
--

CREATE TABLE `AIRWORTHY_STATUS` (
  `AIRWORTHY_ID` int(11) NOT NULL,
  `ISSUE_DATE` date DEFAULT NULL,
  `EXPIRY_DATE` date DEFAULT NULL,
  `EXAMINATION_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AIRWORTHY_STATUS`
--

INSERT INTO `AIRWORTHY_STATUS` (`AIRWORTHY_ID`, `ISSUE_DATE`, `EXPIRY_DATE`, `EXAMINATION_DATE`) VALUES
(1, '2020-06-21', '2021-06-21', '2021-06-29'),
(2, '2020-07-01', '2021-07-01', '2021-07-14'),
(3, '2019-08-27', '2021-08-27', '2021-08-30'),
(4, '2019-09-19', '2021-09-19', '2021-09-28'),
(5, '2019-09-02', '2021-09-02', '2021-09-05'),
(6, '2021-04-22', '2022-04-30', '2022-05-03'),
(7, '2021-06-23', '2022-06-27', '2022-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `AIRWORTHY_STATUS_AIRCRAFT`
--

CREATE TABLE `AIRWORTHY_STATUS_AIRCRAFT` (
  `AIRWORTHY_ID` int(11) DEFAULT NULL,
  `AIRCRAFT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AIRWORTHY_STATUS_AIRCRAFT`
--

INSERT INTO `AIRWORTHY_STATUS_AIRCRAFT` (`AIRWORTHY_ID`, `AIRCRAFT_ID`) VALUES
(1, 1),
(3, 5),
(5, 3),
(2, 2),
(4, 4),
(6, 7),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `AIRCRAFT_ID` int(11) NOT NULL,
  `AIRCRAFT_NAME` varchar(200) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `AIRCRAFT_IMAGE` varchar(200) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `TOTAL_PRICE` double NOT NULL,
  `AIRCRAFT_CODE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`AIRCRAFT_ID`, `AIRCRAFT_NAME`, `PRICE`, `AIRCRAFT_IMAGE`, `QUANTITY`, `TOTAL_PRICE`, `AIRCRAFT_CODE`) VALUES
(14, 'DELTA1', 735000, 'acimg/p1.jpg', 1, 735000, 'D4');

-- --------------------------------------------------------

--
-- Table structure for table `COST_CENTER`
--

CREATE TABLE `COST_CENTER` (
  `COST_ID` int(11) NOT NULL,
  `ITEM` varchar(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `PURCHASE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COST_CENTER`
--

INSERT INTO `COST_CENTER` (`COST_ID`, `ITEM`, `QUANTITY`, `PRICE`, `PURCHASE_DATE`) VALUES
(1, 'DESKS', 40, 4020.7, '2020-05-13'),
(2, 'CHAIRS', 60, 2240, '2020-12-04'),
(3, 'PRINTERS', 15, 5500, '2020-11-07'),
(4, 'DESKTOPS', 30, 10020.7, '2021-02-11'),
(5, 'PAPER SHREDDER', 10, 2100.9, '2021-03-22'),
(6, 'INK CARTRIDGE', 5, 1900.5, '2021-01-16'),
(7, 'FILE CABINET', 2, 900, '2020-09-12');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `EMPLOYEE_NAME` varchar(30) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `SSN` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `COST_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EMPLOYEE_ID`, `EMPLOYEE_NAME`, `TELEPHONE`, `DOB`, `SSN`, `EMAIL`, `COST_ID`) VALUES
(1, 'TONY STARK', '+233267923945', '1990-05-11', 278929, 'tstark@gmail.com', 1),
(2, 'STEVE ROGERS', '+23323483940', '1995-08-01', 375921, 'srogers@gmail.com', 2),
(3, 'NATALIE BANNER', '+233242893829', '1999-10-08', 438048, 'nbanner@gmail.com', 4),
(4, 'JULIA ROBERTS', '+2332439838434', '1993-04-09', 949494, 'jroberts@gmail.com', 3),
(5, 'BRUCE KARDASHIAN', '+2332348549592', '1994-09-17', 212122, 'bkardash@gmail.com', 5),
(6, 'DANIELLA OBENG', '+233554897185', '1993-07-19', 234232, 'dobeng@gmail.com', 2),
(7, 'CHASE DAVENPORT', '+233502843394', '1992-10-11', 938392, 'cdavenport@gmail.com', 4),
(8, 'KARA DANVERS', '+233235950445', '1998-05-18', 959403, 'kdanvers@gmail.com', 5),
(9, 'KATE ARGENT', '+233242939020', '1997-06-13', 282394, 'kargent@gmail.com', 1),
(10, 'VANESSA APPIAH', '+233554534553', '1991-03-28', 924292, 'vappiah@gmail.com', 3),
(11, 'KAREN KUMI', '+233546949303', '1996-02-13', 384954, 'kkumi@gmail.com', 4),
(12, 'AARON LARBI', '+233243477849', '1998-02-15', 546345, 'alarbi@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ENGINEER`
--

CREATE TABLE `ENGINEER` (
  `ENGINEER_SPECIALTY` enum('FUEL EFFICIENCY','COMMUNICATION SYSTEMS','FLIGHT BAG SYSTEMS','NAVIGATION SYSTEM','IGNITION SYSTEM') DEFAULT NULL,
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `AIRCRAFT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ENGINEER`
--

INSERT INTO `ENGINEER` (`ENGINEER_SPECIALTY`, `EMPLOYEE_ID`, `AIRCRAFT_ID`) VALUES
('FLIGHT BAG SYSTEMS', 8, 1),
('NAVIGATION SYSTEM', 9, 5),
('COMMUNICATION SYSTEMS', 10, 2),
('FLIGHT BAG SYSTEMS', 8, 2),
('COMMUNICATION SYSTEMS', 10, 3),
('NAVIGATION SYSTEM', 9, 4),
('FUEL EFFICIENCY', 11, 4),
('IGNITION SYSTEM', 12, 5),
('FUEL EFFICIENCY', 11, 1),
('IGNITION SYSTEM', 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `INSPECTOR`
--

CREATE TABLE `INSPECTOR` (
  `EXAMINATION_DATE` date DEFAULT NULL,
  `EMPLOYEE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INSPECTOR`
--

INSERT INTO `INSPECTOR` (`EXAMINATION_DATE`, `EMPLOYEE_ID`) VALUES
('2022-05-03', 2),
('2021-06-29', 2),
('2022-07-01', 2),
('2021-07-14', 4),
('2021-07-24', 4),
('2021-08-10', 4),
('2021-08-20', 2),
('2021-08-30', 2),
('2021-09-05', 4),
('2021-09-28', 4);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user_id`, `user_name`, `user_email`, `password`, `date`) VALUES
(1, 28436709977691785, 'Michael Nyantakyi', 'nyantakyi42@gmail.com', '$2y$10$G8kabkE4XObV2kzlSCgRGOHSWwe3bDfGTM2xZyk5QiH9b8rKUdOpS', '2021-12-02 01:55:59'),
(2, 42566928639028941, 'Romel', 'romel.nettey@yahoo.com', '$2y$10$.d11jC2iQSijFpC21zdiNeMlJnN4SqSf2RMsrVwI1pm5WkQrAuybW', '2021-12-03 00:20:28'),
(3, 613604676732, 'Romel', 'romel.nettey@ashesi.edu.gh', '$2y$10$L/m9YDJbPZZu/7vdYGvZTecTMsxff/dZ77ffnD4Tyb364wBMZmYW.', '2021-12-05 22:04:49'),
(4, 8548675910030975, 'Romzz', 'romel.nettey32@gmail.com', '$2y$10$pcfloYNRE2UHsL6JXKYHAuP.NJTKqBHN7J8SxuARX.qhdIxA/yhGG', '2021-12-09 15:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `MODEL`
--

CREATE TABLE `MODEL` (
  `MODEL_ID` int(11) NOT NULL,
  `MODEL_NAME` varchar(15) DEFAULT NULL,
  `MODEL_TYPE` enum('COMMERCIAL','MILITARY','DEFENCE') DEFAULT NULL,
  `CAPACITY` int(11) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MODEL`
--

INSERT INTO `MODEL` (`MODEL_ID`, `MODEL_NAME`, `MODEL_TYPE`, `CAPACITY`, `WEIGHT`) VALUES
(1, 'M220', 'COMMERCIAL', 135, 63.1),
(2, 'M320', 'COMMERCIAL', 150, 75.8),
(3, 'H125M', 'MILITARY', 8, 3.1),
(4, 'H145M', 'MILITARY', 12, 3.8),
(5, 'C295', 'DEFENCE', 126, 73.5);

-- --------------------------------------------------------

--
-- Table structure for table `ORDERS`
--

CREATE TABLE `ORDERS` (
  `ORDER_ID` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `DATE_ORDERED` date DEFAULT NULL,
  `TIME_ORDERED` time DEFAULT NULL,
  `AIRCRAFT_ID` int(11) DEFAULT NULL,
  `PAYMENT_ID` int(11) DEFAULT NULL,
  `PURCHASER_ID` int(11) DEFAULT NULL,
  `SalesRep_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ORDERS`
--

INSERT INTO `ORDERS` (`ORDER_ID`, `QUANTITY`, `DATE_ORDERED`, `TIME_ORDERED`, `AIRCRAFT_ID`, `PAYMENT_ID`, `PURCHASER_ID`, `SalesRep_ID`) VALUES
(1, 35, '2020-07-09', '09:14:00', 2, 1, 2, 'SR3'),
(2, 60, '2019-06-27', '10:05:40', 1, 2, 1, 'SR5'),
(3, 75, '2019-08-30', '11:15:30', 5, 4, 4, 'SR2'),
(4, 3, '2019-09-09', '14:14:50', 3, 5, 5, 'SR3'),
(5, 55, '2019-09-01', '13:34:00', 4, 3, 3, 'SR1');

-- --------------------------------------------------------

--
-- Table structure for table `PART`
--

CREATE TABLE `PART` (
  `PART_ID` int(11) NOT NULL,
  `PART_NAME` varchar(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `AIRCRAFT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PART`
--

INSERT INTO `PART` (`PART_ID`, `PART_NAME`, `QUANTITY`, `PRICE`, `AIRCRAFT_ID`) VALUES
(1, 'PROPELLER BLADES', 2, 10000, 2),
(2, 'SEATS', 135, 70000, 1),
(3, 'INSTRUMENT PANEL', 2, 40000, 2),
(4, 'SHOCK STRUT', 3, 30000, 4),
(5, 'FLAPS', 4, 60000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE `PAYMENT` (
  `PAYMENT_ID` int(11) NOT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `PAYMENT_MODE` enum('Cash','Cheque','Card','Mobile Banking') DEFAULT NULL,
  `DATE_PAID` date DEFAULT NULL,
  `TIME_PAID` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PAYMENT`
--

INSERT INTO `PAYMENT` (`PAYMENT_ID`, `TOTAL_PRICE`, `PAYMENT_MODE`, `DATE_PAID`, `TIME_PAID`) VALUES
(1, 20000000, 'Cheque', '2020-07-10', '13:15:30'),
(2, 65000000, 'Cheque', '2020-06-29', '08:00:10'),
(3, 73500000, 'Mobile Banking', '2019-09-02', '10:25:00'),
(4, 89000000, 'Cheque', '2019-08-27', '15:45:20'),
(5, 1000000, 'Cash', '2019-09-10', '09:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `PURCHASER`
--

CREATE TABLE `PURCHASER` (
  `PURCHASER_ID` int(11) NOT NULL,
  `PURCHASER_NAME` varchar(40) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PURCHASER`
--

INSERT INTO `PURCHASER` (`PURCHASER_ID`, `PURCHASER_NAME`, `TELEPHONE`) VALUES
(1, 'KOTOKA INTERNATIONAL AIRPORT', '+233241292819'),
(2, 'COPENHAGEN INTERNATIONAL AIRPORT', '+4532313231'),
(3, 'HELIX TRANSPORT', '+41438162211'),
(4, 'HOLLOMAN AIR FORCE BASE', '+14047592345'),
(5, 'BILL GATES', '+14042316783');

-- --------------------------------------------------------

--
-- Table structure for table `SALES_REP`
--

CREATE TABLE `SALES_REP` (
  `SalesRep_ID` varchar(5) DEFAULT NULL,
  `EMPLOYEE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SALES_REP`
--

INSERT INTO `SALES_REP` (`SalesRep_ID`, `EMPLOYEE_ID`) VALUES
('SR1', 1),
('SR2', 3),
('SR3', 5),
('SR4', 6),
('SR5', 7);

-- --------------------------------------------------------

--
-- Table structure for table `STORAGE_FACILITY`
--

CREATE TABLE `STORAGE_FACILITY` (
  `FACILITY_ID` int(11) NOT NULL,
  `FACILITY_NAME` varchar(20) DEFAULT NULL,
  `CAPACITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `STORAGE_FACILITY`
--

INSERT INTO `STORAGE_FACILITY` (`FACILITY_ID`, `FACILITY_NAME`, `CAPACITY`) VALUES
(1, 'HANGAR 1', 50),
(2, 'HANGAR 2', 40),
(3, 'HANGAR 3', 45),
(4, 'HANGAR 4', 35),
(5, 'HANGAR 5', 42);

-- --------------------------------------------------------

--
-- Table structure for table `user_collections`
--

CREATE TABLE `user_collections` (
  `ID` int(11) NOT NULL,
  `user_email_id` varchar(200) NOT NULL,
  `AIRCRAFT_ID` int(11) NOT NULL,
  `AIRCRAFT_NAME` varchar(200) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `TOTAL_PRICE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_collections`
--

INSERT INTO `user_collections` (`ID`, `user_email_id`, `AIRCRAFT_ID`, `AIRCRAFT_NAME`, `QUANTITY`, `TOTAL_PRICE`) VALUES
(44, 'nyantakyi42@gmail.com', 1, 'DELTA1', 1, 735000),
(45, 'nyantakyi42@gmail.com', 7, 'AviM320-300', 1, 215000);

-- --------------------------------------------------------

--
-- Table structure for table `WORK_CENTER`
--

CREATE TABLE `WORK_CENTER` (
  `COST_ID` int(11) DEFAULT NULL,
  `PRODUCTION_LEAD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WORK_CENTER`
--

INSERT INTO `WORK_CENTER` (`COST_ID`, `PRODUCTION_LEAD`) VALUES
(1, 'JOHN DOE'),
(2, 'JANE FOSTER'),
(3, 'CHARLES GREY'),
(4, 'JERRY MILLS'),
(5, 'TINA TURNER'),
(6, 'JACK FROST'),
(7, 'ANTIONETTE VALDEZ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN_CENTER`
--
ALTER TABLE `ADMIN_CENTER`
  ADD KEY `COST_ID` (`COST_ID`);

--
-- Indexes for table `AIRCRAFT`
--
ALTER TABLE `AIRCRAFT`
  ADD PRIMARY KEY (`AIRCRAFT_ID`),
  ADD KEY `MODEL_ID` (`MODEL_ID`),
  ADD KEY `FACILITY_ID` (`FACILITY_ID`),
  ADD KEY `PRODUCTION_LEAD` (`PRODUCTION_LEAD`),
  ADD KEY `idx_AIRCRAFT_NAME` (`AIRCRAFT_NAME`);

--
-- Indexes for table `AIRWORTHY_STATUS`
--
ALTER TABLE `AIRWORTHY_STATUS`
  ADD PRIMARY KEY (`AIRWORTHY_ID`),
  ADD KEY `EXAMINATION_DATE` (`EXAMINATION_DATE`);

--
-- Indexes for table `AIRWORTHY_STATUS_AIRCRAFT`
--
ALTER TABLE `AIRWORTHY_STATUS_AIRCRAFT`
  ADD KEY `AIRWORTHY_ID` (`AIRWORTHY_ID`),
  ADD KEY `AIRCRAFT_ID` (`AIRCRAFT_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`AIRCRAFT_ID`);

--
-- Indexes for table `COST_CENTER`
--
ALTER TABLE `COST_CENTER`
  ADD PRIMARY KEY (`COST_ID`);

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `COST_ID` (`COST_ID`);

--
-- Indexes for table `ENGINEER`
--
ALTER TABLE `ENGINEER`
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  ADD KEY `AIRCRAFT_ID` (`AIRCRAFT_ID`);

--
-- Indexes for table `INSPECTOR`
--
ALTER TABLE `INSPECTOR`
  ADD UNIQUE KEY `EXAMINATION_DATE` (`EXAMINATION_DATE`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MODEL`
--
ALTER TABLE `MODEL`
  ADD PRIMARY KEY (`MODEL_ID`),
  ADD KEY `idx_MODEL_NAME` (`MODEL_NAME`);

--
-- Indexes for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `AIRCRAFT_ID` (`AIRCRAFT_ID`),
  ADD KEY `PAYMENT_ID` (`PAYMENT_ID`),
  ADD KEY `PURCHASER_ID` (`PURCHASER_ID`),
  ADD KEY `SalesRep_ID` (`SalesRep_ID`),
  ADD KEY `idx_DATE_ORDERED` (`DATE_ORDERED`);

--
-- Indexes for table `PART`
--
ALTER TABLE `PART`
  ADD PRIMARY KEY (`PART_ID`),
  ADD KEY `AIRCRAFT_ID` (`AIRCRAFT_ID`),
  ADD KEY `idx_QUANTITY` (`QUANTITY`);

--
-- Indexes for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  ADD PRIMARY KEY (`PAYMENT_ID`);

--
-- Indexes for table `PURCHASER`
--
ALTER TABLE `PURCHASER`
  ADD PRIMARY KEY (`PURCHASER_ID`);

--
-- Indexes for table `SALES_REP`
--
ALTER TABLE `SALES_REP`
  ADD UNIQUE KEY `SalesRep_ID` (`SalesRep_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `STORAGE_FACILITY`
--
ALTER TABLE `STORAGE_FACILITY`
  ADD PRIMARY KEY (`FACILITY_ID`);

--
-- Indexes for table `user_collections`
--
ALTER TABLE `user_collections`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AIRCRAFT_ID` (`AIRCRAFT_ID`),
  ADD KEY `AIRCRAFT_NAME` (`AIRCRAFT_NAME`);

--
-- Indexes for table `WORK_CENTER`
--
ALTER TABLE `WORK_CENTER`
  ADD UNIQUE KEY `PRODUCTION_LEAD` (`PRODUCTION_LEAD`),
  ADD KEY `COST_ID` (`COST_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AIRCRAFT`
--
ALTER TABLE `AIRCRAFT`
  MODIFY `AIRCRAFT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `AIRWORTHY_STATUS`
--
ALTER TABLE `AIRWORTHY_STATUS`
  MODIFY `AIRWORTHY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `AIRCRAFT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `COST_CENTER`
--
ALTER TABLE `COST_CENTER`
  MODIFY `COST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `MODEL`
--
ALTER TABLE `MODEL`
  MODIFY `MODEL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ORDERS`
--
ALTER TABLE `ORDERS`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PART`
--
ALTER TABLE `PART`
  MODIFY `PART_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  MODIFY `PAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PURCHASER`
--
ALTER TABLE `PURCHASER`
  MODIFY `PURCHASER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `STORAGE_FACILITY`
--
ALTER TABLE `STORAGE_FACILITY`
  MODIFY `FACILITY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_collections`
--
ALTER TABLE `user_collections`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ADMIN_CENTER`
--
ALTER TABLE `ADMIN_CENTER`
  ADD CONSTRAINT `admin_center_ibfk_1` FOREIGN KEY (`COST_ID`) REFERENCES `COST_CENTER` (`COST_ID`);

--
-- Constraints for table `AIRCRAFT`
--
ALTER TABLE `AIRCRAFT`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`MODEL_ID`) REFERENCES `MODEL` (`MODEL_ID`),
  ADD CONSTRAINT `aircraft_ibfk_2` FOREIGN KEY (`FACILITY_ID`) REFERENCES `STORAGE_FACILITY` (`FACILITY_ID`),
  ADD CONSTRAINT `aircraft_ibfk_3` FOREIGN KEY (`PRODUCTION_LEAD`) REFERENCES `WORK_CENTER` (`PRODUCTION_LEAD`);

--
-- Constraints for table `AIRWORTHY_STATUS`
--
ALTER TABLE `AIRWORTHY_STATUS`
  ADD CONSTRAINT `airworthy_status_ibfk_1` FOREIGN KEY (`EXAMINATION_DATE`) REFERENCES `INSPECTOR` (`EXAMINATION_DATE`);

--
-- Constraints for table `AIRWORTHY_STATUS_AIRCRAFT`
--
ALTER TABLE `AIRWORTHY_STATUS_AIRCRAFT`
  ADD CONSTRAINT `airworthy_status_aircraft_ibfk_1` FOREIGN KEY (`AIRWORTHY_ID`) REFERENCES `AIRWORTHY_STATUS` (`AIRWORTHY_ID`),
  ADD CONSTRAINT `airworthy_status_aircraft_ibfk_2` FOREIGN KEY (`AIRCRAFT_ID`) REFERENCES `AIRCRAFT` (`AIRCRAFT_ID`);

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`COST_ID`) REFERENCES `COST_CENTER` (`COST_ID`);

--
-- Constraints for table `ENGINEER`
--
ALTER TABLE `ENGINEER`
  ADD CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `engineer_ibfk_2` FOREIGN KEY (`AIRCRAFT_ID`) REFERENCES `AIRCRAFT` (`AIRCRAFT_ID`);

--
-- Constraints for table `INSPECTOR`
--
ALTER TABLE `INSPECTOR`
  ADD CONSTRAINT `inspector_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`EMPLOYEE_ID`);

--
-- Constraints for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`AIRCRAFT_ID`) REFERENCES `AIRCRAFT` (`AIRCRAFT_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `PAYMENT` (`PAYMENT_ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`PURCHASER_ID`) REFERENCES `PURCHASER` (`PURCHASER_ID`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`SalesRep_ID`) REFERENCES `SALES_REP` (`SalesRep_ID`);

--
-- Constraints for table `PART`
--
ALTER TABLE `PART`
  ADD CONSTRAINT `part_ibfk_1` FOREIGN KEY (`AIRCRAFT_ID`) REFERENCES `AIRCRAFT` (`AIRCRAFT_ID`);

--
-- Constraints for table `SALES_REP`
--
ALTER TABLE `SALES_REP`
  ADD CONSTRAINT `sales_rep_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`EMPLOYEE_ID`);

--
-- Constraints for table `user_collections`
--
ALTER TABLE `user_collections`
  ADD CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`AIRCRAFT_ID`) REFERENCES `AIRCRAFT` (`AIRCRAFT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_collections_ibfk_1` FOREIGN KEY (`AIRCRAFT_NAME`) REFERENCES `AIRCRAFT` (`AIRCRAFT_NAME`);

--
-- Constraints for table `WORK_CENTER`
--
ALTER TABLE `WORK_CENTER`
  ADD CONSTRAINT `work_center_ibfk_1` FOREIGN KEY (`COST_ID`) REFERENCES `COST_CENTER` (`COST_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
