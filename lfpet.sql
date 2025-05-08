-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 10:21 PM
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
-- Database: `lfpet`
--

-- --------------------------------------------------------

--
-- Table structure for table `communitymember`
--

CREATE TABLE `communitymember` (
  `memberid` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `joinDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communitymember`
--

INSERT INTO `communitymember` (`memberid`, `email`, `imgpath`, `join_date`, `password`, `status`, `username`, `fullname`, `joinDate`) VALUES
(1, 'jane@example.com', 'profile1.jpg', NULL, 'secret', b'1', 'jane_doe', 'Jane Doe', '2025-04-22 00:52:28'),
(2, 'smith@example.com', 'profile2.jpg', NULL, 'secret', b'0', 'Agent Smith', 'Agent Smith', '2025-04-22 00:52:28'),
(3, 'cindy@example.com', 'profile3.jpg', NULL, 'secret', b'1', 'Cindy Thai Tai', 'Cindy Thai Tai', '2025-04-22 00:52:28'),
(4, 'kenny@example.com', 'profile4.jpg', NULL, 'secret', b'1', 'Kenny Sang', 'Kenny Sang', '2025-04-22 00:52:28'),
(5, 'adam@example.com', 'profile5.jpg', NULL, 'secret', b'1', 'Adam Lee', 'Adam Lee', '2025-04-22 00:52:28'),
(6, 'ginny@example.com', 'profile6.jpg', NULL, 'secret', b'1', 'Ginny V', 'Ginny V', '2025-04-22 00:52:28'),
(7, '8man@example.com', 'profile8.jpg', NULL, 'secret', b'1', 'Hachiman Kumamoto', 'Hachiman Kumamoto', '2025-04-22 00:52:28'),
(8, '6phung@example.com', 'profile7.jpg', NULL, 'secret', b'1', 'Luc Tieu Phung', 'Luc Tieu Phung', '2025-04-22 00:52:28'),
(9, 'dfinder@example.com', 'sampleimage.jpg', '2025-03-31 20:28:51', 'secret', b'1', 'Dog_finder', 'John Smith', '2025-04-22 00:52:28'),
(10, 'dwhisperer@example.com', 'sampleimage.jpg', '2025-03-31 20:29:51', 'secret', b'1', 'Dog_whisperer', 'Adam Smith', '2025-04-22 00:52:28'),
(11, 'nekojin@example.com', 'sampleimage.jpg', '2025-03-31 20:30:21', 'secret', b'1', 'Cat_man', 'Chet Baker', '2025-04-22 00:52:28');

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
  `status` bit(1) DEFAULT NULL,
  `memberid` int DEFAULT NULL,
  `petid` int DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  `ownerid` int DEFAULT NULL,
  `foundDate` datetime(6) DEFAULT NULL,
  `foundLocation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foundpetreport`
--

INSERT INTO `foundpetreport` (`found_reportid`, `createdat`, `description`, `found_date`, `found_location`, `status`, `memberid`, `petid`, `type`, `ownerid`, `foundDate`, `foundLocation`) VALUES
(1, NULL, NULL, '2025-04-15 12:52:14.000000', 'Downtown Park', b'0', 1, 15, b'0', NULL, NULL, NULL),
(2, NULL, NULL, '2025-04-17 18:52:21.000000', NULL, b'1', NULL, 14, b'1', 6, NULL, NULL),
(3, NULL, NULL, '2025-04-09 18:52:24.000000', '4th avenue intersect', b'1', 8, 17, b'0', NULL, NULL, NULL),
(5, NULL, NULL, '2025-04-16 18:52:27.000000', '4th avenue intersect', b'0', 1, 1, b'1', 8, NULL, NULL),
(7, NULL, NULL, '2025-04-23 18:52:29.000000', '4th avenue intersect', b'0', 1, 2, b'1', 9, NULL, NULL),
(8, NULL, NULL, '2025-04-14 18:52:31.000000', '4th avenue intersect', b'0', 1, 3, b'0', NULL, NULL, NULL),
(16, '2025-03-31 16:53:53', NULL, '2025-04-06 18:52:34.000000', '4th avenue intersect', b'0', 4, 9, b'0', NULL, NULL, NULL),
(17, '2025-03-31 20:12:38', NULL, '2025-04-08 18:52:37.000000', 'near UNCG', b'0', 4, 29, b'1', 3, NULL, NULL),
(18, '2025-03-31 20:13:12', NULL, '2025-04-01 18:52:39.000000', 'near UNCG police station', b'0', 5, 28, b'0', NULL, NULL, NULL),
(20, '2025-03-31 20:18:01', NULL, '2025-04-16 18:52:41.000000', 'near UNCG ECU', b'0', 8, 17, b'0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `found_reportid`
--

CREATE TABLE `found_reportid` (
  `foundReportID` int NOT NULL,
  `createdAT` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foundDate` datetime(6) DEFAULT NULL,
  `foundLocation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `memberID` int DEFAULT NULL,
  `petID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lostpetowner`
--

CREATE TABLE `lostpetowner` (
  `ownerid` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `joinDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lostpetowner`
--

INSERT INTO `lostpetowner` (`ownerid`, `email`, `imgpath`, `password`, `status`, `username`, `join_date`, `fullname`, `joinDate`) VALUES
(1, 'john@example.com', NULL, 'secret', b'1', 'john_feezly', '2025-03-31 20:27:31', 'John Ng', '2025-04-22 03:15:43'),
(2, 'john_updated@example.com', 'newprofile.jpg', 'newsecret', b'1', 'john_doe_updated', '2025-03-31 20:27:31', 'Diff John', '2025-04-22 03:15:43'),
(3, 'Tom@example.com', 'profile3.jpg', 'secret', b'1', 'Tommy Teo', '2025-03-31 20:27:31', 'Tommy Teo', '2025-04-22 03:15:43'),
(4, 'jimm@example.com', 'profile4.jpg', 'secret', b'0', 'Jimmy Nguyen', '2025-03-31 20:27:31', 'Jimmy Nguyen', '2025-04-22 03:15:43'),
(5, 'Tony@example.com', 'profile5.jpg', 'secret', b'0', 'Tony from LCSign', '2025-03-31 20:27:31', 'Tony Lee', '2025-04-22 03:15:43'),
(6, 'carrick@example.com', 'profile6.jpg', 'secret', b'1', 'Carrick William', '2025-03-31 20:27:31', 'Carrick William', '2025-04-22 03:15:43'),
(7, 'Lumen@example.com', 'profile6.jpg', 'secret', b'1', 'Lumen Nguyen', '2025-03-31 20:27:31', 'Lumen Nguyen', '2025-04-22 03:15:43'),
(8, 'edwar@example.com', 'profile8.jpg', 'secret', b'0', 'Edward Norton', '2025-03-31 20:27:31', 'Edward Norton', '2025-04-22 03:15:43'),
(9, 'liz@example.com', 'profile9.jpg', 'secret', b'1', 'Elizabeth Wood', '2025-03-31 20:27:31', 'Edward Norton', '2025-04-22 03:15:43'),
(10, 'honda@example.com', 'profile10.jpg', 'secret', b'1', 'Honda Suzuki', '2025-03-31 20:27:31', 'Honda Suzuki', '2025-04-22 03:15:43'),
(17, 'wahhab@email.com', '31.jpg', 'wahhabpass', b'0', 'wahhabr2', '2025-04-22 23:04:52', 'wahhab2', '2025-04-22 23:04:52'),
(23, 'demo@email.com', '31.jpg', 'demopass', b'0', 'demo1', '2025-04-24 11:14:46', 'demo user', '2025-04-24 11:14:46'),
(24, 'newtest@gmail.com', '25.jpg', 'newtest1', b'0', 'newtest1', '2025-05-08 01:27:36', 'Newtest', '2025-05-08 01:27:36'),
(25, 'wahhabtest@gmail.com', '33.jpg', 'wahhabtest', b'0', 'wtestingss', '2025-05-08 12:07:31', 'Wahhabtesting', '2025-05-08 12:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `lostpetreport`
--

CREATE TABLE `lostpetreport` (
  `lost_reportid` int NOT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_seen` datetime(6) DEFAULT NULL,
  `lost_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `ownerid` int DEFAULT NULL,
  `petid` int DEFAULT NULL,
  `lastSeen` datetime(6) DEFAULT NULL,
  `lostLocation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lostpetreport`
--

INSERT INTO `lostpetreport` (`lost_reportid`, `createdat`, `last_seen`, `lost_location`, `status`, `ownerid`, `petid`, `lastSeen`, `lostLocation`) VALUES
(1, NULL, NULL, 'middle of the lake', b'0', 8, 16, NULL, NULL),
(2, NULL, NULL, 'balboa park', b'0', 2, 11, NULL, NULL),
(3, NULL, NULL, 'mcDonald on 2nd street', b'0', 2, 9, NULL, NULL),
(4, NULL, NULL, 'train station', b'0', 4, 12, NULL, NULL),
(9, NULL, NULL, 'Lake Rd', b'0', 17, 35, NULL, NULL),
(10, NULL, NULL, 'Rivers Lake\r\n', b'0', 24, 36, NULL, NULL),
(11, NULL, NULL, 'Downtown road', b'0', 25, 37, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `petid` int NOT NULL,
  `age` double NOT NULL,
  `breed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `species` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bit(1) NOT NULL,
  `memberid` int DEFAULT NULL,
  `ownerid` int DEFAULT NULL,
  `imgPath` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`petid`, `age`, `breed`, `description`, `img_path`, `name`, `species`, `status`, `memberid`, `ownerid`, `imgPath`) VALUES
(1, 2, 'Tabby', 'Friendly cat', '/images/36.jpg', 'Fluffy', 'Cat', b'1', NULL, 8, NULL),
(2, 2.2, 'Tabby', 'Bad cat', '/images/37.jpg', 'A Cat Name', 'Cat', b'1', NULL, 9, NULL),
(3, 3, 'Golden Retriever', 'good dog', '/images/42.jpg', 'A Dog Name', 'Dog', b'1', NULL, 7, NULL),
(9, 8, 'Tabby Persian', 'orange and chubby', '/images/8.jpg', 'Garfield', 'Cat', b'1', NULL, 2, NULL),
(10, 4, 'Tabby', 'Dark stripe and grumpy', '/images/40.jpg', 'Abyss', 'Cat', b'1', NULL, 2, NULL),
(11, 3, 'Siamese', 'White and small', '/images/44.jpg', 'Shironeko', 'Cat', b'1', NULL, 2, NULL),
(12, 10, 'Aki', 'Smart dog with clay fur', '/images/45.jpeg', 'Hachiko', 'Dog', b'1', NULL, 4, NULL),
(13, 12, 'Dane', 'dark brown short fur', '/images/46.jpg', 'Roach', 'Dog', b'1', NULL, 5, NULL),
(14, 1.5, 'Japanese Bobtail', 'black, white, and brown spot', '/images/7.jpg', 'Chuchumaru', 'Cat', b'1', NULL, 6, NULL),
(15, 7.2, 'no idea', 'Deep red tall horse', '/images/47.jpg', 'Amargeddon', 'Horse', b'1', NULL, 7, NULL),
(16, 0.5, 'Clown Fish', 'red and white stripes', '/images/48.jpg', 'Nemo', 'Fish', b'1', NULL, 8, NULL),
(17, 0, 'Tabby', 'black cat', '/images/39.jpg', NULL, 'Cat', b'0', 8, NULL, NULL),
(18, 0, 'Tabby', 'white cat', '/images/41.jpg', NULL, 'Cat', b'0', 7, NULL, NULL),
(19, 0, 'Tabby', 'brown cat with blue eye', '/images/20.jpg', NULL, 'Cat', b'0', 8, NULL, NULL),
(20, 0, 'British Shorthair', 'white cat with blue eyes', '/images/15.jpg', NULL, 'Cat', b'0', 8, NULL, NULL),
(21, 0, 'British Shorthair', 'white cat with green eyes', '/images/14.jpg', NULL, 'Cat', b'0', 8, NULL, NULL),
(23, 0, 'British Shorthair', 'white cat with green left eye and blue right eye', '/images/14.jpg', NULL, 'Cat', b'0', 7, NULL, NULL),
(24, 0, 'British Shorthair', 'black with brown eyes', '/images/11.jpg', NULL, 'Cat', b'0', 6, NULL, NULL),
(25, 0, 'British Shorthair', 'black and orange stripe', '/images/4.jpg', NULL, 'Cat', b'0', 6, NULL, NULL),
(26, 0, 'Bulldog', 'black', '/images/49.jpg', NULL, 'Dog', b'0', 6, NULL, NULL),
(27, 0, 'Border Collie', 'black and white', '/images/27.jpg', NULL, 'Dog', b'0', 5, NULL, NULL),
(28, 0, 'Border Collie', 'black and brown mouth', '/images/52.jpg', NULL, 'Dog', b'0', 5, NULL, NULL),
(29, 0, 'Husky', 'black and white', '/images/34.jpg', NULL, 'Dog', b'0', NULL, 3, NULL),
(30, 0, 'Chihuahua', 'short brown with pointy ears', '/images/53.jpg', NULL, 'Dog', b'0', 3, NULL, NULL),
(31, 0, 'Poddle', 'brown with short legs', '/images/54.jpg', NULL, 'Dog', b'0', 2, NULL, NULL),
(32, 0, 'Pug', 'pale cream fur', 'someImage.jpg', NULL, 'Dog', b'0', 1, NULL, NULL),
(33, 3, 'Bengal', 'very wild', NULL, 'tigger', 'Tiger', b'0', NULL, 17, NULL),
(34, 1, 'Peruvian', 'Not friendly at all stay away!', '40.jpg', 'Perry', 'Cat', b'0', NULL, 17, NULL),
(35, 1, 'Peruvian', 'Not so friendly, will bite', '/images/40.jpg', 'Perry', 'Cat', b'0', NULL, 17, NULL),
(36, 2, 'Labrador', 'loves dog treats and is very friendly', '/images/42.jpg', 'Doggo', 'Dog', b'0', NULL, 24, NULL),
(37, 2, 'German Shepher', 'Very friendly but will bite', '/images/40.jpg', 'Doggos', 'Dog', b'0', NULL, 25, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewid` int NOT NULL,
  `rating` int NOT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `found_reportid` int DEFAULT NULL,
  `ownerid` int DEFAULT NULL,
  `timeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `foundReportID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewid`, `rating`, `review_text`, `found_reportid`, `ownerid`, `timeStamp`, `foundReportID`) VALUES
(1, 4, 'Great service!', 1, 2, '2025-04-22 00:52:29', NULL),
(2, 5, 'Great service!', 2, 3, '2025-04-22 00:52:29', NULL),
(3, 5, 'Great service!', 3, 4, '2025-04-22 00:52:29', NULL),
(7, 5, 'Great service!', 5, 4, '2025-04-22 00:52:29', NULL),
(8, 3, NULL, NULL, NULL, NULL, NULL),
(9, 3, 'very nice and cool', NULL, NULL, NULL, NULL),
(10, 2, 'not cool.', NULL, NULL, '2025-04-23 22:25:55', NULL),
(11, 1, 'Super nice!!!', NULL, 17, '2025-04-23 23:52:11', NULL),
(12, 5, 'great job!\r\n', NULL, 17, '2025-04-23 23:58:17', NULL),
(13, 5, 'lovely!', NULL, 3, '2025-04-24 00:10:46', NULL),
(15, 5, 'loved it', NULL, 17, '2025-04-24 01:32:14', NULL),
(20, 4, 'very nice', NULL, 17, '2025-04-24 11:16:04', NULL),
(21, 5, 'Great experience.', NULL, 24, '2025-05-08 01:32:33', NULL),
(22, 4, 'Great service would recommend', NULL, 25, '2025-05-08 12:09:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `systemadmin`
--

CREATE TABLE `systemadmin` (
  `adminid` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `communitymember`
--
ALTER TABLE `communitymember`
  ADD PRIMARY KEY (`memberid`);

--
-- Indexes for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  ADD PRIMARY KEY (`found_reportid`),
  ADD KEY `FKfh1xpwqa9d8whey4rpkb6oy62` (`memberid`),
  ADD KEY `UK8ufgi2nl0wjug9ecgeu9xhpj9` (`petid`) USING BTREE,
  ADD KEY `FK9qtnjnu2r9tsgb8ww28lf15fx` (`ownerid`);

--
-- Indexes for table `found_reportid`
--
ALTER TABLE `found_reportid`
  ADD PRIMARY KEY (`foundReportID`),
  ADD UNIQUE KEY `UK7hvwp4shoab5f90cr7k7e7vnl` (`petID`),
  ADD KEY `FKp9ct7ubrdxws5yr0gh1cbmtdp` (`memberID`);

--
-- Indexes for table `lostpetowner`
--
ALTER TABLE `lostpetowner`
  ADD PRIMARY KEY (`ownerid`);

--
-- Indexes for table `lostpetreport`
--
ALTER TABLE `lostpetreport`
  ADD PRIMARY KEY (`lost_reportid`),
  ADD KEY `FK2d59rqk2tqxha5wq2eih48ics` (`ownerid`),
  ADD KEY `UKcpw8fls45rukdrba2kbfhsdf3` (`petid`) USING BTREE;

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`petid`),
  ADD KEY `memberid` (`memberid`),
  ADD KEY `UKk0wb8kcp3puxgf5d429kwqsku` (`ownerid`) USING BTREE;

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewid`),
  ADD UNIQUE KEY `UK5ahcmodfe9nvws07wrssy34cc` (`found_reportid`),
  ADD UNIQUE KEY `UKlybmwsv0hvd0ou84bupyroc2k` (`foundReportID`),
  ADD KEY `FKg41j73cx3tniu4ie7x5fqqyge` (`ownerid`);

--
-- Indexes for table `systemadmin`
--
ALTER TABLE `systemadmin`
  ADD PRIMARY KEY (`adminid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `communitymember`
--
ALTER TABLE `communitymember`
  MODIFY `memberid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  MODIFY `found_reportid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `found_reportid`
--
ALTER TABLE `found_reportid`
  MODIFY `foundReportID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lostpetowner`
--
ALTER TABLE `lostpetowner`
  MODIFY `ownerid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `lostpetreport`
--
ALTER TABLE `lostpetreport`
  MODIFY `lost_reportid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `petid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `systemadmin`
--
ALTER TABLE `systemadmin`
  MODIFY `adminid` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  ADD CONSTRAINT `FK3b5lr920n9qd8b5max8fjk5ef` FOREIGN KEY (`petid`) REFERENCES `pet` (`petid`),
  ADD CONSTRAINT `FK9qtnjnu2r9tsgb8ww28lf15fx` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`),
  ADD CONSTRAINT `FKfh1xpwqa9d8whey4rpkb6oy62` FOREIGN KEY (`memberid`) REFERENCES `communitymember` (`memberid`);

--
-- Constraints for table `found_reportid`
--
ALTER TABLE `found_reportid`
  ADD CONSTRAINT `FKp9ct7ubrdxws5yr0gh1cbmtdp` FOREIGN KEY (`memberID`) REFERENCES `communitymember` (`memberid`),
  ADD CONSTRAINT `FKq26dsjbi30nmknfwstgdy21jm` FOREIGN KEY (`petID`) REFERENCES `pet` (`petid`);

--
-- Constraints for table `lostpetreport`
--
ALTER TABLE `lostpetreport`
  ADD CONSTRAINT `FK2d59rqk2tqxha5wq2eih48ics` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`),
  ADD CONSTRAINT `FK5umhde0m7y20r2xd4fmu3tqpb` FOREIGN KEY (`petid`) REFERENCES `pet` (`petid`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `FKncjafftqe91oaapc83ywjxsey` FOREIGN KEY (`memberid`) REFERENCES `communitymember` (`memberid`),
  ADD CONSTRAINT `FKptqfoxwsaoh5edd2nkb3j765o` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK92tny9bs9wyy21dkafcl96q1b` FOREIGN KEY (`foundReportID`) REFERENCES `foundpetreport` (`found_reportid`),
  ADD CONSTRAINT `FKepsb8yaioera72p5q2lna8crk` FOREIGN KEY (`found_reportid`) REFERENCES `foundpetreport` (`found_reportid`),
  ADD CONSTRAINT `FKg41j73cx3tniu4ie7x5fqqyge` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`),
  ADD CONSTRAINT `FKrkp7vjik6mk6p3trpu8r3vcr0` FOREIGN KEY (`foundReportID`) REFERENCES `found_reportid` (`foundReportID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
