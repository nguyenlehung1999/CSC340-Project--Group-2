-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 06:52 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lfpet-database`
--

-- --------------------------------------------------------

--
-- Table structure for table `foundpetreport`
--

CREATE TABLE `foundpetreport` (
  `found_reportid` int NOT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `found_date` datetime(6) DEFAULT NULL,
  `found_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT b'0',
  `memberid` int DEFAULT NULL,
  `petid` int DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  `ownerid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foundpetreport`
--

INSERT INTO `foundpetreport` (`found_reportid`, `createdat`, `description`, `found_date`, `found_location`, `status`, `memberid`, `petid`, `type`, `ownerid`) VALUES
(1, '2025-04-08 21:21:43', NULL, '2025-04-15 12:52:14.000000', 'Downtown Park', b'1', 1, 15, b'0', NULL),
(2, '2025-04-16 21:21:46', NULL, '2025-04-17 18:52:21.000000', NULL, b'1', NULL, 14, b'1', 6),
(3, '2025-04-20 21:21:48', NULL, '2025-04-09 18:52:24.000000', '4th avenue intersect', b'1', 8, 17, b'0', NULL),
(5, '2025-04-13 21:21:52', NULL, '2025-04-16 18:52:27.000000', '4th avenue intersect', b'0', 1, 1, b'1', 8),
(7, '2025-04-11 21:21:54', NULL, '2025-04-23 18:52:29.000000', '4th avenue intersect', b'0', 1, 2, b'1', 9),
(8, '2025-04-19 21:21:57', NULL, '2025-04-14 18:52:31.000000', '4th avenue intersect', b'1', 1, 3, b'0', NULL),
(16, '2025-03-31 16:53:53', NULL, '2025-04-06 18:52:34.000000', '4th avenue intersect', b'0', 4, 9, b'0', NULL),
(17, '2025-03-31 20:12:38', NULL, '2025-04-08 18:52:37.000000', 'near UNCG', b'1', 4, 29, b'1', 3),
(18, '2025-03-31 20:13:12', NULL, '2025-04-01 18:52:39.000000', 'near UNCG police station', b'0', 5, 28, b'0', NULL),
(22, '2025-04-21 22:02:52', 'for test and delete', '2025-04-11 22:02:08.000000', 'for test and delete', b'0', 7, 12, b'0', NULL),
(24, '2025-04-22 21:25:22', NULL, '2025-04-22 21:24:25.000000', 'Cowles mountain', b'0', NULL, 15, b'1', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  ADD PRIMARY KEY (`found_reportid`),
  ADD KEY `FKfh1xpwqa9d8whey4rpkb6oy62` (`memberid`),
  ADD KEY `UK8ufgi2nl0wjug9ecgeu9xhpj9` (`petid`) USING BTREE,
  ADD KEY `FK9qtnjnu2r9tsgb8ww28lf15fx` (`ownerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  MODIFY `found_reportid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  ADD CONSTRAINT `FK3b5lr920n9qd8b5max8fjk5ef` FOREIGN KEY (`petid`) REFERENCES `pet` (`petid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK9qtnjnu2r9tsgb8ww28lf15fx` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `FKfh1xpwqa9d8whey4rpkb6oy62` FOREIGN KEY (`memberid`) REFERENCES `communitymember` (`memberid`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
