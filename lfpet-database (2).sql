-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2025 at 05:18 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.28

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
-- Table structure for table `communitymember`
--

CREATE TABLE `communitymember` (
  `memberid` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communitymember`
--

INSERT INTO `communitymember` (`memberid`, `email`, `imgpath`, `join_date`, `password`, `status`, `username`, `fullname`) VALUES
(1, 'jane@example.com', 'profile1.jpg', '2025-04-02 01:32:35', 'secret', b'1', 'jane_doe', 'Jane Doe'),
(2, 'smith@example.com', 'profile2.jpg', '2025-04-09 01:32:38', 'secret', b'0', 'Agent Smith', 'Agent Smith'),
(3, 'cindy@example.com', 'profile3.jpg', '2025-04-16 01:32:40', 'secret', b'0', 'Cindy Thai Tai', 'Cindy Thai Tai'),
(4, 'kenny@example.com', 'profile4.jpg', '2025-04-15 01:32:43', 'secret', b'1', 'Kenny Sang', 'Kenny Sang'),
(5, 'adam@example.com', 'profile5.jpg', '2025-04-14 01:32:46', 'secret', b'1', 'Adam Lee', 'Adam Lee'),
(6, 'ginny@example.com', 'profile6.jpg', '2025-04-11 01:32:49', 'secret', b'1', 'Ginny V', 'Ginny V'),
(7, '8man@example.com', 'profile8.jpg', '2025-04-06 01:32:51', 'secret', b'1', 'Hachiman Kumamoto', 'Hachiman Kumamoto'),
(8, '6phung@example.com', 'profile7.jpg', '2025-04-06 01:32:53', 'secret', b'1', 'Luc Tieu Phung', 'Luc Tieu Phung'),
(9, 'dfinder@example.com', 'sampleimage.jpg', '2025-03-31 20:28:51', 'secret', b'1', 'Dog_finder', 'John Smith'),
(10, 'dwhisperer@example.com', 'sampleimage.jpg', '2025-03-31 20:29:51', 'secret', b'1', 'Dog_whisperer', 'Adam Smith'),
(11, 'nekojin@example.com', 'sampleimage.jpg', '2025-03-31 20:30:21', 'secret', b'1', 'Cat_man', 'Chet Baker'),
(12, 'somemember@hotmail.com', NULL, '2025-04-22 22:56:56', 'somepa', b'1', 'Some Member', 'Community Member');

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
(23, '2025-04-21 22:05:05', 'for test and delete', '2025-04-08 22:04:40.000000', 'for test and delete', b'0', 9, 31, b'0', NULL),
(24, '2025-04-22 21:25:22', NULL, '2025-04-22 21:24:25.000000', 'Cowles mountain', b'0', NULL, 15, b'1', 7),
(25, '2025-04-22 21:26:29', 'brown and smol', '2025-04-16 21:26:57.000000', 'by the fountain', b'0', 2, 31, b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lostpetowner`
--

CREATE TABLE `lostpetowner` (
  `ownerid` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lostpetowner`
--

INSERT INTO `lostpetowner` (`ownerid`, `email`, `imgpath`, `password`, `status`, `username`, `join_date`, `fullname`) VALUES
(1, 'john@example.com', 'profile1.jpg', 'secret', b'1', 'john_doe', '2025-03-31 20:27:31', 'John Nguyen'),
(2, 'john_updated@example.com', 'newprofile.jpg', 'newsecret', b'1', 'john_doe_updated', '2025-03-31 20:27:31', 'Diff John'),
(3, 'Tom@example.com', 'profile3.jpg', 'secret', b'1', 'Tommy Teo', '2025-03-31 20:27:31', '	 Tommy Teo'),
(4, 'jimm@example.com', 'profile4.jpg', 'secret', b'1', 'Jimmy Nguyen', '2025-03-31 20:27:31', 'Jimmy Nguyen'),
(5, 'Tony@example.com', 'profile5.jpg', 'secret', b'1', 'Tony from LCSign', '2025-03-31 20:27:31', 'Tony Lee'),
(6, 'carrick@example.com', 'profile6.jpg', 'secret', b'1', 'Carrick William', '2025-03-31 20:27:31', 'Carrick William'),
(7, 'Lumen@example.com', 'profile6.jpg', 'secret', b'1', 'Lumen Nguyen', '2025-03-31 20:27:31', 'Lumen Nguyen'),
(8, 'edwar@example.com', 'profile8.jpg', 'secret', b'1', 'Edward Norton', '2025-03-31 20:27:31', 'Edward Norton'),
(9, 'liz@example.com', 'profile9.jpg', 'secret', b'1', 'Elizabeth Wood', '2025-03-31 20:27:31', 'Edward Norton'),
(10, 'honda@example.com', 'profile10.jpg', 'secret', b'1', 'Honda Suzuki', '2025-03-31 20:27:31', 'Honda Suzuki'),
(11, 'email@gmaill.com', NULL, 'password', b'1', 'Some Account', '2025-04-22 22:30:31', 'Some Name'),
(13, 'something@yahoo.com', NULL, 'averystrongpassword', b'0', 'A Random Guy', '2025-04-22 22:40:26', 'Random Guy'),
(15, 'asd', NULL, '12', b'0', 'ad', '2025-04-22 22:48:01', 'asd'),
(18, 'asd', 'asd', 'asd', b'1', 'asd', '2025-04-22 22:54:40', 'ads');

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
  `petid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lostpetreport`
--

INSERT INTO `lostpetreport` (`lost_reportid`, `createdat`, `last_seen`, `lost_location`, `status`, `ownerid`, `petid`) VALUES
(1, NULL, NULL, 'middle of the lake', b'0', 8, 16),
(2, NULL, NULL, 'balboa park', b'0', 2, 11),
(3, NULL, NULL, 'mcDonald on 2nd street', b'0', 2, 9),
(4, NULL, NULL, 'train station', b'0', 4, 12);

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
  `ownerid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`petid`, `age`, `breed`, `description`, `img_path`, `name`, `species`, `status`, `memberid`, `ownerid`) VALUES
(1, 2, 'Tabby', 'Friendly cat', '/images/36.jpg', 'Fluffy', 'Cat', b'1', NULL, 8),
(2, 2.2, 'Tabby', 'Bad cat', '/images/37.jpg', 'A Cat Name', 'Cat', b'1', NULL, 9),
(3, 3, 'Golden Retriever', 'good dog', '/images/42.jpg', 'A Dog Name', 'Dog', b'1', NULL, 7),
(9, 8, 'Tabby Persian', 'orange and chubby', '/images/8.jpg', 'Garfield', 'Cat', b'1', NULL, 2),
(10, 4, 'Tabby', 'Dark stripe and grumpy', '/images/40.jpg', 'Abyss', 'Cat', b'1', NULL, 2),
(11, 3, 'Siamese', 'White and small', '/images/44.jpg', 'Shironeko', 'Cat', b'1', NULL, 2),
(12, 10, 'Aki', 'Smart dog with clay fur', '/images/45.jpg', 'Hachiko', 'Dog', b'1', NULL, 4),
(13, 12, 'Dane', 'dark brown short fur', '/images/46.jpg', 'Roach', 'Dog', b'1', NULL, 5),
(14, 1.5, 'Japanese Bobtail', 'black, white, and brown spot', '/images/7.jpg', 'Chuchumaru', 'Cat', b'1', NULL, 6),
(15, 7.2, 'no idea', 'Deep red tall horse', '/images/47.jpg', 'Amargeddon', 'Horse', b'1', NULL, 7),
(16, 0.5, 'Clown Fish', 'red and white stripes', '/images/48.jpg', 'Nemo', 'Fish', b'1', NULL, 8),
(17, 0, 'Tabby', 'black cat', '/images/39.jpg', NULL, 'Cat', b'0', 8, NULL),
(18, 0, 'Tabby', 'white cat', '/images/41.jpg', NULL, 'Cat', b'0', 7, NULL),
(19, 0, 'Tabby', 'brown cat with blue eye', '/images/20.jpg', NULL, 'Cat', b'0', 8, NULL),
(20, 0, 'British Shorthair', 'white cat with blue eyes', '/images/15.jpg', NULL, 'Cat', b'0', 8, NULL),
(21, 0, 'British Shorthair', 'white cat with green eyes', '/images/14.jpg', NULL, 'Cat', b'0', 8, NULL),
(23, 0, 'British Shorthair', 'white cat with green left eye and blue right eye', '/images/14.jpg', NULL, 'Cat', b'0', 7, NULL),
(24, 0, 'British Shorthair', 'black with brown eyes', '/images/11.jpg', NULL, 'Cat', b'0', 6, NULL),
(25, 0, 'British Shorthair', 'black and orange stripe', '/images/4.jpg', NULL, 'Cat', b'0', 6, NULL),
(26, 0, 'Bulldog', 'black', '/images/49.jpg', NULL, 'Dog', b'0', 6, NULL),
(27, 0, 'Border Collie', 'black and white', '/images/27.jpg', NULL, 'Dog', b'0', 5, NULL),
(28, 0, 'Border Collie', 'black and brown mouth', '/images/52.jpg', NULL, 'Dog', b'0', 5, NULL),
(29, 0, 'Husky', 'black and white', '/images/34.jpg', NULL, 'Dog', b'0', NULL, 3),
(30, 0, 'Chihuahua', 'short brown with pointy ears', '/images/53.jpg', NULL, 'Dog', b'0', 3, NULL),
(31, 0, 'Poddle', 'brown with short legs', '/images/54.jpg', NULL, 'Dog', b'0', 2, NULL),
(32, 0, 'Pug', 'pale cream fur', 'someImage.jpg', NULL, 'Dog', b'0', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewid` int NOT NULL,
  `rating` double NOT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `time_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `found_reportid` int DEFAULT NULL,
  `ownerid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewid`, `rating`, `review_text`, `time_stamp`, `found_reportid`, `ownerid`) VALUES
(1, 4, 'Great service!', '1900-01-17 00:00:00', 1, 2),
(2, 5, 'Great service!', '2025-04-17 00:00:00', 2, 3),
(3, 5, 'Great service!', '2025-04-16 21:07:26', 3, 4),
(7, 5, 'Great service!', '2025-04-02 21:07:23', 5, 4),
(8, 3, 'thank you', '2025-04-22 20:59:12', 8, 10),
(11, 5, 'something irrelevant', '2025-04-22 20:59:58', 17, 4),
(12, 4.5, 'The weather is nice over here.', '2025-04-22 21:02:50', 16, 9),
(15, 0, 'a bad review', '2025-04-23 00:05:38', 25, 11),
(16, 1, 'another bad review', '2025-04-23 00:05:53', 22, 2),
(37, 0.5, 'a bad review', '2025-04-23 00:54:48', 24, 13),
(38, 0.5, 'another bad review', '2025-04-23 00:55:15', 23, 2),
(42, 1, 'a different bad review', '2025-04-23 01:02:55', 18, 7);

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
  MODIFY `memberid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `foundpetreport`
--
ALTER TABLE `foundpetreport`
  MODIFY `found_reportid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `lostpetowner`
--
ALTER TABLE `lostpetowner`
  MODIFY `ownerid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lostpetreport`
--
ALTER TABLE `lostpetreport`
  MODIFY `lost_reportid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `petid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  ADD CONSTRAINT `FKepsb8yaioera72p5q2lna8crk` FOREIGN KEY (`found_reportid`) REFERENCES `foundpetreport` (`found_reportid`),
  ADD CONSTRAINT `FKg41j73cx3tniu4ie7x5fqqyge` FOREIGN KEY (`ownerid`) REFERENCES `lostpetowner` (`ownerid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
