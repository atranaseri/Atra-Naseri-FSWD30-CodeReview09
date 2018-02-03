-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2018 at 05:00 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RentalCar`
--

-- --------------------------------------------------------

--
-- Table structure for table `Car`
--

CREATE TABLE `Car` (
  `Car_id` int(11) NOT NULL,
  `Manufacture` varchar(60) DEFAULT NULL,
  `fk_Class_id` int(11) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `fk_Insurance_id` int(11) DEFAULT NULL,
  `Rental_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE `Class` (
  `Class_id` int(11) NOT NULL,
  `Small_car` varchar(70) DEFAULT NULL,
  `Medium_car` varchar(70) DEFAULT NULL,
  `Larg_car` varchar(70) DEFAULT NULL,
  `Van` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Contract`
--

CREATE TABLE `Contract` (
  `Contract_id` int(11) NOT NULL,
  `fk_Office_id` int(11) DEFAULT NULL,
  `fk_Customer_id` int(11) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Odometer` int(11) DEFAULT NULL,
  `fk_Reservation_id` int(11) DEFAULT NULL,
  `fk_Country_id` int(11) DEFAULT NULL,
  `fk_Car_id` int(11) DEFAULT NULL,
  `fk_Payment_id` int(11) DEFAULT NULL,
  `Country1_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Country1`
--

CREATE TABLE `Country1` (
  `Country1_id` int(11) NOT NULL,
  `Austria` varchar(30) DEFAULT NULL,
  `Germany` varchar(30) DEFAULT NULL,
  `France` varchar(30) DEFAULT NULL,
  `Italy` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Creditcard`
--

CREATE TABLE `Creditcard` (
  `Creditcard_id` int(11) NOT NULL,
  `Creditcard_type` varchar(40) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Last_name` varchar(50) DEFAULT NULL,
  `Card_number` int(11) DEFAULT NULL,
  `CVC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customer_id` int(11) NOT NULL,
  `First_name` varchar(60) DEFAULT NULL,
  `Last_name` varchar(60) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Phone_number` int(11) DEFAULT NULL,
  `Home_address` varchar(100) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `fk_Driving_licence_id` int(11) DEFAULT NULL,
  `fk_Creditcard_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_id`, `First_name`, `Last_name`, `Birthday`, `Gender`, `Phone_number`, `Home_address`, `City`, `fk_Driving_licence_id`, `fk_Creditcard_id`) VALUES
(1, 'Ola', 'Hanan', '1989-06-04', 'F', 2147483647, 'Goldschlagstrasse14', 'Wien', NULL, NULL),
(2, 'Clare', 'Simon', '1980-07-16', 'F', 2147483647, 'Auhofstrasse12', 'Gratz', NULL, NULL),
(3, 'Alex', 'Anderson', '1975-08-04', 'M', 2147483647, 'Burggasse 14', 'Wien', NULL, NULL),
(4, 'Tom', 'Hanks', '1983-02-20', 'M', 2147483647, 'Hernanserstrasse20', 'Salzburg', NULL, NULL),
(5, 'Owen', 'Wilson', '1990-12-14', 'M', 2147483647, 'Embelgasse3', 'Gratz', NULL, NULL),
(6, 'Clare', 'Watson', '1993-10-05', 'F', 2147483647, 'Diehlgasse18', 'Salzburg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Driving_Licence`
--

CREATE TABLE `Driving_Licence` (
  `Driving_licence_id` int(11) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Lastname` varchar(40) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Licence_numer` int(11) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `Class` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Driving_Licence`
--

INSERT INTO `Driving_Licence` (`Driving_licence_id`, `Name`, `Lastname`, `Birthday`, `Licence_numer`, `expiry_date`, `Class`) VALUES
(1, 'Ola', 'Hanen', '1989-06-04', NULL, '2021-05-30', 'C'),
(2, 'Clare', 'Simon', '1980-07-16', NULL, '2021-05-30', 'C'),
(3, 'Alex', 'Anderson', '1975-08-04', NULL, '2021-05-30', 'C'),
(4, 'Tom', 'Hanks', '1983-02-20', NULL, '2021-05-30', 'C'),
(5, 'Owen', 'Wilson', '1990-12-14', NULL, '2021-05-30', 'C'),
(6, 'Clare', 'Watson', '1993-10-05', NULL, '2021-05-30', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `Extra_cost`
--

CREATE TABLE `Extra_cost` (
  `Extra_cost_id` int(11) NOT NULL,
  `Car_accident` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Insurance`
--

CREATE TABLE `Insurance` (
  `Insurance_id` int(11) NOT NULL,
  `fk_Insurance_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--

CREATE TABLE `Office` (
  `Office_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `fk_Country1_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `Payment_id` int(11) NOT NULL,
  `fk_Customer_id` int(11) DEFAULT NULL,
  `fk_Contract_id` int(11) DEFAULT NULL,
  `fk_Extra_cost_id` int(11) DEFAULT NULL,
  `Total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `Reservation_id` int(11) NOT NULL,
  `Date_needed` date DEFAULT NULL,
  `Days_needed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Car`
--
ALTER TABLE `Car`
  ADD PRIMARY KEY (`Car_id`),
  ADD KEY `fk_Class_id` (`fk_Class_id`),
  ADD KEY `fk_Insurance_id` (`fk_Insurance_id`);

--
-- Indexes for table `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`Class_id`);

--
-- Indexes for table `Contract`
--
ALTER TABLE `Contract`
  ADD PRIMARY KEY (`Contract_id`),
  ADD KEY `fk_Reservation_id` (`fk_Reservation_id`),
  ADD KEY `fk_Office_id` (`fk_Office_id`),
  ADD KEY `fk_Payment_id` (`fk_Payment_id`),
  ADD KEY `fk_Customer_id` (`fk_Customer_id`),
  ADD KEY `fk_Car_id` (`fk_Car_id`),
  ADD KEY `Country1_id` (`Country1_id`);

--
-- Indexes for table `Country1`
--
ALTER TABLE `Country1`
  ADD PRIMARY KEY (`Country1_id`);

--
-- Indexes for table `Creditcard`
--
ALTER TABLE `Creditcard`
  ADD PRIMARY KEY (`Creditcard_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `fk_Driving_licence_id` (`fk_Driving_licence_id`),
  ADD KEY `fk_Creditcard_id` (`fk_Creditcard_id`);

--
-- Indexes for table `Driving_Licence`
--
ALTER TABLE `Driving_Licence`
  ADD PRIMARY KEY (`Driving_licence_id`);

--
-- Indexes for table `Extra_cost`
--
ALTER TABLE `Extra_cost`
  ADD PRIMARY KEY (`Extra_cost_id`);

--
-- Indexes for table `Insurance`
--
ALTER TABLE `Insurance`
  ADD PRIMARY KEY (`Insurance_id`);

--
-- Indexes for table `Office`
--
ALTER TABLE `Office`
  ADD PRIMARY KEY (`Office_id`),
  ADD KEY `fk_Country1_id` (`fk_Country1_id`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `fk_Contract_id` (`fk_Contract_id`),
  ADD KEY `fk_Extra_cost_id` (`fk_Extra_cost_id`),
  ADD KEY `fk_Customer_id` (`fk_Customer_id`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`Reservation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Car`
--
ALTER TABLE `Car`
  MODIFY `Car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Class`
--
ALTER TABLE `Class`
  MODIFY `Class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Contract`
--
ALTER TABLE `Contract`
  MODIFY `Contract_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Country1`
--
ALTER TABLE `Country1`
  MODIFY `Country1_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Creditcard`
--
ALTER TABLE `Creditcard`
  MODIFY `Creditcard_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Driving_Licence`
--
ALTER TABLE `Driving_Licence`
  MODIFY `Driving_licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Extra_cost`
--
ALTER TABLE `Extra_cost`
  MODIFY `Extra_cost_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Insurance`
--
ALTER TABLE `Insurance`
  MODIFY `Insurance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Office`
--
ALTER TABLE `Office`
  MODIFY `Office_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payment`
--
ALTER TABLE `Payment`
  MODIFY `Payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `Reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Car`
--
ALTER TABLE `Car`
  ADD CONSTRAINT `Car_ibfk_1` FOREIGN KEY (`fk_Class_id`) REFERENCES `Class` (`Class_id`),
  ADD CONSTRAINT `Car_ibfk_2` FOREIGN KEY (`fk_Insurance_id`) REFERENCES `Insurance` (`Insurance_id`);

--
-- Constraints for table `Contract`
--
ALTER TABLE `Contract`
  ADD CONSTRAINT `Contract_ibfk_1` FOREIGN KEY (`fk_Reservation_id`) REFERENCES `Reservation` (`Reservation_id`),
  ADD CONSTRAINT `Contract_ibfk_2` FOREIGN KEY (`fk_Office_id`) REFERENCES `Office` (`Office_id`),
  ADD CONSTRAINT `Contract_ibfk_3` FOREIGN KEY (`fk_Payment_id`) REFERENCES `Payment` (`Payment_id`),
  ADD CONSTRAINT `Contract_ibfk_4` FOREIGN KEY (`fk_Customer_id`) REFERENCES `Customer` (`Customer_id`),
  ADD CONSTRAINT `Contract_ibfk_5` FOREIGN KEY (`fk_Customer_id`) REFERENCES `Customer` (`Customer_id`),
  ADD CONSTRAINT `Contract_ibfk_6` FOREIGN KEY (`fk_Car_id`) REFERENCES `Car` (`Car_id`),
  ADD CONSTRAINT `Contract_ibfk_7` FOREIGN KEY (`Country1_id`) REFERENCES `Country1` (`Country1_id`);

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`fk_Driving_licence_id`) REFERENCES `Driving_Licence` (`Driving_licence_id`),
  ADD CONSTRAINT `Customer_ibfk_2` FOREIGN KEY (`fk_Creditcard_id`) REFERENCES `Creditcard` (`Creditcard_id`);

--
-- Constraints for table `Office`
--
ALTER TABLE `Office`
  ADD CONSTRAINT `Office_ibfk_1` FOREIGN KEY (`fk_Country1_id`) REFERENCES `Country1` (`Country1_id`);

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`fk_Contract_id`) REFERENCES `Contract` (`Contract_id`),
  ADD CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`fk_Extra_cost_id`) REFERENCES `Extra_cost` (`Extra_cost_id`),
  ADD CONSTRAINT `Payment_ibfk_3` FOREIGN KEY (`fk_Customer_id`) REFERENCES `Customer` (`Customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
