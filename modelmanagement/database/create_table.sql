-- --------------------------------------------------------
-- Host:                         192.168.123.65
-- Server version:               10.5.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for modelmanagement
CREATE DATABASE IF NOT EXISTS `modelmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `modelmanagement`;

-- Dumping structure for table modelmanagement.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` bigint(20) DEFAULT 2,
  `codeverification` int(11) DEFAULT NULL,
  `expiredcode` datetime DEFAULT (current_timestamp() + interval 2 day),
  `note` varchar(255) DEFAULT 'register',
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.account: ~23 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `password`, `email`, `status`, `codeverification`, `expiredcode`, `note`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'quangnguyen', '$2a$10$ZxhpA9ocgvh5plWg9FIi9eyVBXoGgq/1tEIAFL/htl8QA4nNkfiPm', 'quangntngithub@gmail.com', 3, 892006, '2020-09-06 18:13:06', 'change status', '2020-09-17 18:20:03', '2020-09-25 19:27:07', 'quangnguyen', 'quangnguyen'),
	(80, 'dungdaica', '$2a$10$pdkVTu.7z7KhDaIPpYokL.6/suaW87o.UpI4oSCBGarq67CTvfgcG', 'dung23cm@gmail.com', 3, 220538, '2020-09-16 10:46:39', 'UP SALARY', '2020-09-17 18:20:03', '2020-09-17 18:20:03', NULL, 'SYSTEM'),
	(81, 'khachhang1', '$2a$10$oPivhv2ZJPsvJSHJGLv7nu97zIFIhPtmzkjA/3/8CTrFVDtP1/yhe', 'khachhang1@gmail.com', 3, 805564, '2020-09-16 19:32:34', 'change status', '2020-09-14 19:32:34', '2020-09-15 16:13:56', NULL, 'quangnguyen'),
	(82, 'khachhang2', '$2a$10$Dzt3O3Sd0HNHPksWF7GcHO1WoJwhWFAVUx3jZN9aehTUD8I96Dr3u', 'khachhang2@gmail.com', 2, 449792, '2020-09-17 08:41:34', 'register', '2020-09-15 08:41:34', '2020-09-15 08:41:34', NULL, NULL),
	(83, 'khachhang3', '$2a$10$2/QPFVQgGbrkKQuQONV/ku7bOLP8IDoknpQwAdCIHdOUjXw2vYkiq', 'saonau200796@gmail.com', 2, 497072, '2020-09-17 16:15:10', 'register', '2020-09-15 16:15:10', '2020-09-15 16:15:10', NULL, NULL),
	(84, 'gianglatao', '$2a$10$VniB9r/7RymQxFl96jy8FOegrUSdWxz6uEn25gH0kIW3qHwIc88gO', 'giangca@gmail.com', 2, 417731, '2020-09-17 18:30:49', 'register', '2020-09-15 18:30:49', '2020-09-15 18:30:49', NULL, NULL),
	(85, 'loiphung', '$2a$10$hNtuiDCZecK8AelWX1UbD.X2iUHqn7u8Ne/Fr1Ad6OGUv4LvBhdqa', 'talophu200796@gmail.com', 2, 349812, '2020-09-17 18:33:51', 'register', '2020-09-15 18:33:51', '2020-09-15 18:33:51', NULL, NULL),
	(87, 'dungdaica1', '$2a$10$MTiNSLKPV6IBIIln2gbOp.k2mizwX1GBJdsd2R6jgCZp24zeL6yUe', 'kiss_love_2812@yahoo.com', 2, 497175, '2020-09-17 19:06:45', 'register', '2020-09-15 19:06:45', '2020-09-15 19:06:45', NULL, NULL),
	(89, 'sangdaica', '$2a$10$iRexyKFvdgCyoDj/G5fM6ujZ5FhhtxhjwLDFY4z5bN2SZKikUoSFW', 'sandasdasg@gmail.com', 2, 411747, '2020-09-17 19:10:32', 'register', '2020-09-15 19:10:32', '2020-09-15 19:10:32', NULL, NULL),
	(90, 'bossang', '$2a$10$C9BQOy4mYa8OnCvlulUdTOsi667rxMn5xQDZr/q51NPH4OKepUJ6a', 'trantuvdaseqwan1304@gmail.com', 3, 514294, '2020-09-17 19:12:41', 'register', '2020-09-15 19:12:41', '2020-09-15 19:12:41', NULL, NULL),
	(91, 'minhdeptrai1', '$2a$10$.jSo28ZBTNH9sW0gaTCmhuvhhOlazbutA1E6NyW/ZUANQ06NtDWg.', 'minhdeptrai1@minh.com', 2, 534511, '2020-09-17 19:13:55', 'register', '2020-09-15 19:13:55', '2020-09-15 19:13:55', NULL, NULL),
	(92, 'quangka', '$2a$10$O3i8lTRquzaUphcX.0gUeu72b13a/yb3r07t4EWBjUSLk92d1y/ey', 'quangka@gmail.com', 2, 800389, '2020-09-17 19:14:59', 'register', '2020-09-15 19:14:59', '2020-09-15 19:14:59', NULL, NULL),
	(93, '43242342', '$2a$10$h0ol4THQy.YZ21at6W25pey1Tq060DgdzGONjyxhh7eZbl562h0u2', 'loiccccc@gmail.com', 2, 644438, '2020-09-18 19:42:44', 'register', '2020-09-16 19:42:44', '2020-09-16 19:42:44', 'quangnguyen', 'quangnguyen'),
	(94, 'dungkhachhang', '$2a$10$0dh36bdwvQ5oyLPrhKVzt.gey5x.pK5VqyLPZzLeGASfPthgnRaDW', 'dungdaica@gmail.com', 2, 118965, '2020-09-19 13:25:57', 'register', '2020-09-17 13:25:57', '2020-09-17 13:25:57', NULL, NULL),
	(95, 'sangdaicaca', '$2a$10$D/h/R1KJTcb1QYsX9ifw5.Z3jvBaEVWg2Y7jLPcivu9ejR/3Z5FoS', 'dasdasd@gamail.com', 2, 298415, '2020-09-20 08:20:30', 'register', '2020-09-18 08:20:30', '2020-09-18 08:20:30', NULL, NULL),
	(96, 'vmd211099', '$2a$10$7RUvQGFFpsDdU0JLxuYUf.HhTFcDIEQBBzSCrZP2v.OaMTo2p6tte', 'vmd211099@gmail.com', 2, 582895, '2020-09-20 17:21:24', 'register', '2020-09-18 17:21:24', '2020-09-18 17:21:24', NULL, NULL),
	(97, 'thienhandsome', '$2a$10$dO/L0NyfGncZDWsyXJxgqu6ZSwl311LpSqyNF.3qs20X.PvC376ia', 'chuckimthien.131@gmail.com', 2, 440143, '2020-09-20 18:45:00', 'register', '2020-09-18 18:45:00', '2020-09-18 18:45:00', NULL, NULL),
	(98, 'quangdeptrai', '$2a$10$sij2b87nLp7YY/dEOo4NF.0oHKNCgw2Cv4cBwHTlMWnfPRONEkYAW', 'quangdeptrai@gmail.com', 2, 170817, '2020-09-20 18:46:53', 'register', '2020-09-18 18:46:53', '2020-09-18 18:46:53', NULL, NULL),
	(99, 'dungyeuvo', '$2a$10$0UK77oYWtLdMremsI6l0hut4DGS/6hhzwnLHnHaHqoN2TiWEWXwle', 'jdklsjkla@djskla.com', 2, 884816, '2020-09-20 18:49:51', 'register', '2020-09-18 18:49:51', '2020-09-18 18:49:51', NULL, NULL),
	(100, 'deptraisang', '$2a$10$xCR34Vtj9q/MLchOpjHYYud.3V4PqvCT0XBLLVex3Cx4XXBwEEnN6', 'asdasdd@gmail.com', 2, 623730, '2020-09-20 18:51:35', 'register', '2020-09-18 18:51:35', '2020-09-18 18:51:35', NULL, NULL),
	(101, 'depsangtrai', '$2a$10$CU1147dzMAkRNFGKisIfWuAtd9Bi1oSfXu4eUNlbuJkjCC3kuggfS', 'dasdas@gmail.com', 2, 103035, '2020-09-20 18:53:35', 'register', '2020-09-18 18:53:35', '2020-09-18 18:53:35', NULL, NULL),
	(102, 'ducdeptrai', '$2a$10$S/.QPGjn6v5DWeJtbNidq.BHOWAcnLzzsnLkQijowMKIDeC2QdPXi', 'ducdeptrai@gmail.com', 2, 366041, '2020-09-20 18:59:20', 'register', '2020-09-18 18:59:20', '2020-09-18 18:59:20', NULL, NULL),
	(103, 'liendethuong', '$2a$10$EH.lUVqYCM8Ay144rGCu1eJkKJ1ifrJJuq6dznWucYYb72JY4G31G', 'liendethuong@gmail.com', 2, 174093, '2020-09-23 15:57:40', 'register', '2020-09-21 15:57:40', '2020-09-21 15:57:40', NULL, NULL),
	(106, 'ducdethuong', '$2a$10$vqptCYCnq7Xn/zHsapRik.sKwYTLEw2KrkjRXPGwG8iB1N.3PzbuC', 'ducccc@gmail.com', 2, 841557, '2020-09-24 09:28:17', 'register', '2020-09-22 09:28:17', '2020-09-22 09:28:17', NULL, NULL),
	(108, 'hoachodien', '$2a$10$P3G0UnJnAcItxq6G4TN2GengWAOJo490oCvOlkyu62JaTyDl0lkHa', 'hoa123@gmail.com', 2, 753552, '2020-09-27 18:58:57', 'register', '2020-09-25 18:58:57', '2020-09-25 18:58:57', NULL, NULL),
	(109, 'pho123', '$2a$10$DZYO7X2BzphRItecs2kw7.FRiTnptxsKjgybL0ICtt8hC2fQA4xFC', 'vopho112200@gmail.com', 2, 694408, '2020-09-27 19:10:51', 'register', '2020-09-25 19:10:51', '2020-09-25 19:10:51', NULL, NULL),
	(110, 'nam1111', '$2a$10$CgQJ2yn0BYPiSMQxLKxUFeuJ8Zg7K.Xyfsdta9TeZru.xsUx.AxbK', 'tannguyen1010@gmail.com', 2, 389649, '2020-09-27 19:33:30', 'register', '2020-09-25 19:33:30', '2020-09-25 19:33:30', NULL, NULL),
	(111, 'loi123', '$2a$10$PCRLHPCKzcgM5Gs00kDldu9SYr3D9.IfIcKF9SZa8m4i.b2iExAKa', 'a123211@gmail.com', 2, 519145, '2020-09-27 19:48:18', 'register', '2020-09-25 19:48:18', '2020-09-25 19:48:18', NULL, NULL),
	(112, 'loiccccccccc', '$2a$10$3oGSW2/NoxGR453x2V9MHezJcSsZ3Tfdt7fMjipP/rHCCcEaN530y', 'loicccccc@gmail.com', 2, 659984, '2020-09-27 19:52:57', 'register', '2020-09-25 19:52:57', '2020-09-25 19:52:57', NULL, NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.account_delete
CREATE TABLE IF NOT EXISTS `account_delete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.account_delete: ~25 rows (approximately)
/*!40000 ALTER TABLE `account_delete` DISABLE KEYS */;
INSERT INTO `account_delete` (`id`, `username`, `email`, `name`, `phone`, `address`, `company`, `gender`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(15, 'nguyenquang', 'nguyenquang@gmail.com', 'quang nguyen', '123456789', NULL, NULL, b'1', '2020-09-11 16:55:17', '2020-09-11 16:55:17', NULL, NULL),
	(16, 'nguyenquang', 'nguyenquang@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(17, 'sangnguyen', 'sangnguyen120396@gmail.com', 'Nguyễn Việt Sang', '987654321', 'Số 2. Võ Văn Ngân', 'ZOTAC', b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(18, '42142141', 'dawdaw@gmail.com', 'dawdawdad', '321541421', '12412421', NULL, b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(19, '213213214', 'dawdawdaw@gmail.com', 'dawdada', '3213213313', '3213213', NULL, b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(20, '1241525', 'ddawdaw@gmail.com', 'dwdwadada', '2321321312', '3123123', NULL, b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(21, '21421421', 'wadawdaw@gmail.com', 'dawdawdawd', '2132142142', '213213', NULL, b'0', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(22, 'giangca', 'giangca@gmail.com', 'Hồ Tấn Giang', '1234567890', 'Số 3. Võ Văn Ngân', 'COMPANY NULL', b'1', '2020-09-14 08:51:46', '2020-09-14 08:51:46', NULL, NULL),
	(25, 'giangca', 'giangca@gmail.com', 'Giang Há»', '123456789', NULL, NULL, b'1', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(26, '41242141', 'dwadwadaw@gmail.com', 'giangca', '3213213214', '421421', '421412', b'1', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(27, 'loiphung', 'saonau200796@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(28, 'sneakyg123', 'hotangiang456@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(29, '23423423', 'dwldalw@gmail.com', 'dawdawdaw', '4234324234', '4234234', '423423', b'1', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(30, '321321', 'dawdaw@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(31, '32423423', 'dawdawdaw@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(32, 'awfawfawfa', 'dwadawdaw@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:44:49', '2020-09-14 09:44:49', NULL, NULL),
	(33, 'sangnguyen', 'sangnguyen120396@gmail.com', 'Nguyễn Việt Sang', '123456789', 'Số 2. Võ Văn Ngân', 'Baemin', b'1', '2020-09-14 09:49:41', '2020-09-14 09:49:41', NULL, NULL),
	(34, '14124324235', 'awdawdaw@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:49:41', '2020-09-14 09:49:41', NULL, NULL),
	(35, 'loiphung', 'saonau200796@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:49:41', '2020-09-14 09:49:41', NULL, NULL),
	(36, 'sneakyg', 'hotangiang456@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 09:49:41', '2020-09-14 09:49:41', NULL, NULL),
	(37, '321312', 'dwajdwjadjaw@gmail.com', 'dwadwadaw', '123213213', '21321312', '3213213', b'1', '2020-09-14 09:49:41', '2020-09-14 09:49:41', NULL, NULL),
	(38, '21321321', 'dwadawdaw@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 10:05:57', '2020-09-14 10:05:57', NULL, NULL),
	(39, '42141241', 'dawdwada@gmail.com', NULL, NULL, NULL, NULL, b'0', '2020-09-14 10:09:59', '2020-09-14 10:09:59', NULL, NULL),
	(40, 'minhzoe', 'minhdeptrai1@minh.com', NULL, NULL, NULL, NULL, b'0', '2020-09-15 19:10:17', '2020-09-15 19:10:17', NULL, NULL),
	(41, 'minhdeptrai', 'minhdeptrai@minh.com', 'minhdeptrai', '1234567890', NULL, NULL, b'1', '2020-09-15 19:14:41', '2020-09-15 19:14:41', NULL, NULL),
	(42, 'loideono', 'loideono@gmail.com', 'loideono', '123123123', NULL, NULL, b'1', '2020-09-21 16:01:31', '2020-09-21 16:01:31', NULL, NULL),
	(43, 'loidethuong', 'minhdeptrai@minh.com', 'loidethuong', '123123123', NULL, NULL, b'1', '2020-09-21 16:01:31', '2020-09-21 16:01:31', NULL, NULL),
	(44, 'cong111', 'congnguyen1496@gmail.com', 'congcong', '0365478954', NULL, NULL, b'0', '2020-09-25 19:32:16', '2020-09-25 19:32:16', NULL, NULL);
/*!40000 ALTER TABLE `account_delete` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `modelid` int(11) DEFAULT NULL,
  `startdate` int(11) DEFAULT NULL,
  `startmonth` int(11) DEFAULT NULL,
  `startyear` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT 'SYSTEM',
  `modifiedby` varchar(255) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `FK_booking_model` (`modelid`),
  CONSTRAINT `FK_booking_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_booking_model` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.booking: ~18 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`id`, `accountid`, `modelid`, `startdate`, `startmonth`, `startyear`, `status`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(399, 1, 15, 24, 8, 2020, b'1', '2020-09-23 17:51:10', '2020-09-23 17:51:10', 'SYSTEM', 'SYSTEM'),
	(400, 1, 15, 24, 9, 2020, b'1', '2020-09-23 17:51:10', '2020-09-23 17:51:10', 'SYSTEM', 'SYSTEM'),
	(401, 1, 15, 26, 8, 2020, b'1', '2020-09-23 17:51:10', '2020-09-23 17:51:10', 'SYSTEM', 'SYSTEM'),
	(402, 1, 15, 27, 8, 2020, b'1', '2020-09-23 17:51:10', '2020-09-23 17:51:10', 'SYSTEM', 'SYSTEM'),
	(408, 90, 2, 28, 9, 2020, b'1', '2020-09-24 19:23:24', '2020-09-24 19:23:24', 'SYSTEM', 'SYSTEM'),
	(409, 90, 2, 29, 9, 2020, b'1', '2020-09-24 19:23:24', '2020-09-24 19:23:24', 'SYSTEM', 'SYSTEM'),
	(410, 90, 2, 30, 9, 2020, b'1', '2020-09-24 19:23:24', '2020-09-24 19:23:24', 'SYSTEM', 'SYSTEM'),
	(411, 1, 1, 26, 9, 2020, b'1', '2020-09-25 08:22:25', '2020-09-25 08:22:25', 'SYSTEM', 'SYSTEM'),
	(412, 1, 1, 27, 9, 2020, b'1', '2020-09-25 08:23:00', '2020-09-25 08:23:00', 'SYSTEM', 'SYSTEM'),
	(413, 80, 15, 27, 7, 2020, b'1', '2020-09-25 08:46:17', '2020-09-25 08:46:17', 'SYSTEM', 'SYSTEM'),
	(414, 80, 15, 28, 8, 2020, b'1', '2020-09-25 08:46:17', '2020-09-25 08:46:17', 'SYSTEM', 'SYSTEM'),
	(415, 80, 15, 29, 8, 2020, b'1', '2020-09-25 08:47:36', '2020-09-25 08:47:36', 'SYSTEM', 'SYSTEM'),
	(416, 80, 15, 30, 8, 2020, b'1', '2020-09-25 08:47:36', '2020-09-25 08:47:36', 'SYSTEM', 'SYSTEM'),
	(417, 1, 1, 28, 9, 2019, b'1', '2020-09-25 09:00:40', '2020-09-25 09:00:40', 'SYSTEM', 'SYSTEM'),
	(419, 1, 29, 26, 9, 2020, b'1', '2020-09-25 10:30:00', '2020-09-25 10:30:00', 'SYSTEM', 'SYSTEM'),
	(420, 1, 15, 26, 9, 2019, b'1', '2020-09-25 11:02:47', '2020-09-25 11:02:47', 'SYSTEM', 'SYSTEM'),
	(424, 1, 13, 30, 9, 2020, b'1', '2020-09-25 16:26:09', '2020-09-25 16:26:09', 'SYSTEM', 'SYSTEM'),
	(425, 85, 29, 27, 9, 2020, b'1', '2020-09-25 18:16:47', '2020-09-25 18:16:47', 'SYSTEM', 'SYSTEM'),
	(426, 1, 1, 28, 9, 2020, b'1', '2020-09-25 18:23:03', '2020-09-25 18:23:03', 'SYSTEM', 'SYSTEM'),
	(427, 1, 1, 29, 9, 2020, b'1', '2020-09-25 18:23:03', '2020-09-25 18:23:03', 'SYSTEM', 'SYSTEM'),
	(428, 1, 1, 30, 9, 2020, b'1', '2020-09-25 18:23:03', '2020-09-25 18:23:03', 'SYSTEM', 'SYSTEM'),
	(429, 1, 10, 1, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(430, 1, 10, 28, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(431, 1, 10, 13, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(432, 1, 10, 14, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(433, 1, 10, 8, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(434, 1, 10, 7, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(435, 1, 10, 15, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(436, 1, 10, 9, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(437, 1, 10, 2, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(438, 1, 10, 3, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(439, 1, 10, 10, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(440, 1, 10, 23, 10, 2020, b'1', '2020-09-25 18:24:58', '2020-09-25 18:24:58', 'SYSTEM', 'SYSTEM'),
	(449, 108, 15, 26, 9, 2020, b'1', '2020-09-25 19:08:04', '2020-09-25 19:08:04', 'SYSTEM', 'SYSTEM'),
	(450, 108, 15, 27, 9, 2020, b'1', '2020-09-25 19:08:56', '2020-09-25 19:08:56', 'SYSTEM', 'SYSTEM'),
	(451, 108, 15, 28, 9, 2020, b'1', '2020-09-25 19:08:56', '2020-09-25 19:08:56', 'SYSTEM', 'SYSTEM'),
	(452, 108, 15, 29, 9, 2020, b'1', '2020-09-25 19:08:56', '2020-09-25 19:08:56', 'SYSTEM', 'SYSTEM'),
	(453, 108, 15, 30, 9, 2020, b'1', '2020-09-25 19:08:56', '2020-09-25 19:08:56', 'SYSTEM', 'SYSTEM'),
	(454, 108, 29, 29, 9, 2020, b'1', '2020-09-25 19:09:58', '2020-09-25 19:09:58', 'SYSTEM', 'SYSTEM'),
	(455, 108, 11, 28, 9, 2020, b'1', '2020-09-25 19:11:06', '2020-09-25 19:11:06', 'SYSTEM', 'SYSTEM'),
	(456, 108, 4, 28, 9, 2020, b'1', '2020-09-25 19:11:24', '2020-09-25 19:11:24', 'SYSTEM', 'SYSTEM'),
	(457, 108, 4, 27, 9, 2020, b'1', '2020-09-25 19:11:24', '2020-09-25 19:11:24', 'SYSTEM', 'SYSTEM'),
	(458, 108, 4, 29, 9, 2020, b'1', '2020-09-25 19:11:24', '2020-09-25 19:11:24', 'SYSTEM', 'SYSTEM'),
	(459, 108, 4, 30, 9, 2020, b'1', '2020-09-25 19:11:24', '2020-09-25 19:11:24', 'SYSTEM', 'SYSTEM'),
	(460, 108, 4, 26, 9, 2020, b'1', '2020-09-25 19:11:24', '2020-09-25 19:11:24', 'SYSTEM', 'SYSTEM'),
	(461, 109, 2, 26, 9, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(462, 109, 2, 1, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(463, 109, 2, 9, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(464, 109, 2, 2, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(465, 109, 2, 3, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(466, 109, 2, 10, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(467, 109, 2, 8, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(468, 109, 2, 7, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(469, 109, 2, 6, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(470, 109, 2, 4, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(471, 109, 2, 5, 10, 2020, b'1', '2020-09-25 19:11:45', '2020-09-25 19:11:45', 'SYSTEM', 'SYSTEM'),
	(472, 108, 31, 1, 10, 2020, b'1', '2020-09-25 19:24:27', '2020-09-25 19:24:27', 'SYSTEM', 'SYSTEM'),
	(473, 1, 11, 29, 9, 2020, b'1', '2020-09-25 19:34:39', '2020-09-25 19:34:39', 'SYSTEM', 'SYSTEM'),
	(474, 110, 15, 1, 10, 2020, b'1', '2020-09-25 19:38:44', '2020-09-25 19:38:44', 'SYSTEM', 'SYSTEM'),
	(475, 110, 2, 11, 10, 2020, b'1', '2020-09-25 19:39:43', '2020-09-25 19:39:43', 'SYSTEM', 'SYSTEM'),
	(476, 110, 3, 26, 9, 2020, b'1', '2020-09-25 19:39:55', '2020-09-25 19:39:55', 'SYSTEM', 'SYSTEM');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cart_modelid_model_id` (`modelid`),
  KEY `FK_cart_accountid_account_id` (`accountid`),
  CONSTRAINT `FK_cart_accountid_account_id` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_cart_modelid_model_id` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `modelid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_account` (`accountid`),
  KEY `FK_comment_model` (`modelid`),
  CONSTRAINT `FK_comment_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_comment_model` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `content`, `accountid`, `modelid`, `parentid`, `commenttime`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(115, 'good chick', 108, 15, 0, '2020-09-25 19:07:23', '2020-09-25 19:07:23', '2020-09-25 19:07:23', 'hoachodien', 'hoachodien'),
	(116, 'i\'m hoachodien', 108, 15, 115, '2020-09-25 19:07:35', '2020-09-25 19:07:35', '2020-09-25 19:07:35', 'hoachodien', 'hoachodien'),
	(117, 'sgfdgfdsfdsd', 109, 2, 0, '2020-09-25 19:12:13', '2020-09-25 19:12:13', '2020-09-25 19:12:13', 'pho123', 'pho123'),
	(118, 'ddsfsfsdfsd', 109, 2, 0, '2020-09-25 19:12:20', '2020-09-25 19:12:20', '2020-09-25 19:12:20', 'pho123', 'pho123'),
	(124, 'kghk', 85, 15, 115, '2020-09-25 19:36:42', '2020-09-25 19:36:42', '2020-09-25 19:36:42', 'loiphung', 'loiphung'),
	(125, '<script>alert(\'asda\')</script>', 85, 15, 115, '2020-09-25 19:37:30', '2020-09-25 19:37:30', '2020-09-25 19:37:30', 'loiphung', 'loiphung'),
	(126, '<script>alert(\'toi la hoa cho dien\')</script>', 85, 15, 115, '2020-09-25 19:41:18', '2020-09-25 19:41:18', '2020-09-25 19:41:18', 'loiphung', 'loiphung'),
	(127, '<script>alert(\'toi la hoa cho dien\')</script>', 85, 15, 115, '2020-09-25 19:41:58', '2020-09-25 19:41:58', '2020-09-25 19:41:58', 'loiphung', 'loiphung'),
	(128, '<script>alert(\'toi la huy cc\')</script>', 85, 15, 0, '2020-09-25 19:43:48', '2020-09-25 19:43:48', '2020-09-25 19:43:48', 'loiphung', 'loiphung'),
	(129, '<script>alert(\'toi la quang\')</script>', 85, 15, 0, '2020-09-25 19:44:45', '2020-09-25 19:44:45', '2020-09-25 19:44:45', 'loiphung', 'loiphung'),
	(132, '<script>alert(\'chan qua di\')</script>', 90, 15, 0, '2020-09-25 19:48:31', '2020-09-25 19:48:31', '2020-09-25 19:48:31', 'bossang', 'bossang'),
	(133, '<script>alert(\'chan qua di\')</script>', 90, 1, 0, '2020-09-25 19:48:47', '2020-09-25 19:48:47', '2020-09-25 19:48:47', 'bossang', 'bossang'),
	(134, '<script>alert(\'chan qua di\')</script>', 90, 2, 0, '2020-09-25 19:49:01', '2020-09-25 19:49:01', '2020-09-25 19:49:01', 'bossang', 'bossang'),
	(135, '<script>alert(\'chan qua di\')</script>\n', 90, 31, 0, '2020-09-25 19:49:11', '2020-09-25 19:49:11', '2020-09-25 19:49:11', 'bossang', 'bossang'),
	(136, '<script>alert(\'chan qua di\')</script>', 90, 4, 0, '2020-09-25 19:49:20', '2020-09-25 19:49:20', '2020-09-25 19:49:20', 'bossang', 'bossang'),
	(137, '<script>alert(\'chan qua di\')</script>', 90, 5, 0, '2020-09-25 19:49:30', '2020-09-25 19:49:30', '2020-09-25 19:49:30', 'bossang', 'bossang'),
	(138, '<script>alert(\'chan qua di\')</script>', 90, 6, 0, '2020-09-25 19:49:38', '2020-09-25 19:49:38', '2020-09-25 19:49:38', 'bossang', 'bossang'),
	(140, '<script>alert(\'chan qua di\')</script>', 90, 8, 0, '2020-09-25 19:50:05', '2020-09-25 19:50:05', '2020-09-25 19:50:05', 'bossang', 'bossang'),
	(141, '<script>alert("hello")</script>', 1, 3, 0, '2020-09-25 19:57:56', '2020-09-25 19:57:56', '2020-09-25 19:57:56', 'quangnguyen', 'quangnguyen');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.contact: ~0 rows (approximately)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`id`, `name`, `email`, `message`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(25, 'congnigga', 'masimnsdvkjinckidsv', 'mmamamamam', '2020-09-25 19:06:22', '2020-09-25 19:06:22', NULL, NULL),
	(26, 'nam', 'vopho112200@gmail.com', '', '2020-09-25 19:09:05', '2020-09-25 19:09:05', NULL, NULL),
	(27, 'Nam', '213213', 'Nam da o day', '2020-09-25 19:34:13', '2020-09-25 19:34:13', NULL, NULL),
	(28, 'Nam', '213213', 'Nam da o day', '2020-09-25 19:34:18', '2020-09-25 19:34:18', NULL, NULL),
	(29, 'Nam', '213213', 'Nam da o day', '2020-09-25 19:34:21', '2020-09-25 19:34:21', NULL, NULL),
	(30, 'Nam', '213213', 'Nam da o day', '2020-09-25 19:34:22', '2020-09-25 19:34:22', NULL, NULL),
	(31, 'Nam', '213213', 'Nam da o day', '2020-09-25 19:34:22', '2020-09-25 19:34:22', NULL, NULL),
	(32, 'nam', '213213', '12232222332342', '2020-09-25 19:40:42', '2020-09-25 19:40:42', NULL, NULL);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.contract
CREATE TABLE IF NOT EXISTS `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `totalprice` decimal(10,2) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `ratingstatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contract_userid_user_id` (`accountid`) USING BTREE,
  CONSTRAINT `FK_contract_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.contract: ~15 rows (approximately)
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` (`id`, `accountid`, `description`, `status`, `totalprice`, `createdate`, `modifieddate`, `createdby`, `modifiedby`, `ratingstatus`) VALUES
	(5, 80, 'dsad', b'1', 20000.00, '2020-09-14 12:59:02', '2020-09-23 15:18:17', 'dungkaka', 'dungdaica', b'0'),
	(55, 80, 'sdsadsa', b'1', 15000.00, '2020-09-14 13:15:46', '2020-09-23 15:19:42', 'dungkaka', 'dungdaica', b'0'),
	(64, 80, 'kid model', b'1', 40000.00, '2020-09-22 19:12:49', '2020-09-23 08:40:50', 'dungdaica', 'dungdaica', b'0'),
	(93, 1, 'dsadsa', b'1', 20.00, '2020-09-23 17:56:28', '2020-09-25 18:15:14', 'Quang Nguyễn', 'asdas', b'0'),
	(94, 1, NULL, b'1', 12.00, '2020-09-24 16:06:40', '2020-09-24 16:48:30', 'quangnguyen', 'dungdaica', b'0'),
	(95, 90, NULL, b'1', 12.00, '2020-09-24 19:25:04', '2020-09-24 19:25:04', 'bossang', 'bossang', b'0'),
	(96, 1, NULL, b'1', 4.00, '2020-09-25 08:22:46', '2020-09-25 08:22:46', 'quangnguyen', 'quangnguyen', b'0'),
	(97, 1, NULL, b'0', 8.00, '2020-09-25 08:28:26', '2020-09-25 08:28:26', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(98, 1, NULL, b'1', 10.00, '2020-09-25 08:48:58', '2020-09-25 08:48:58', 'dungdaica', 'dungdaica', b'0'),
	(99, 1, NULL, b'0', 12.00, '2020-09-25 09:24:54', '2020-09-25 09:24:54', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(100, 1, NULL, b'0', 16.00, '2020-09-25 09:51:08', '2020-09-25 09:51:08', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(101, 1, NULL, b'0', 1.00, '2020-09-25 11:02:06', '2020-09-25 11:02:06', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(102, 1, NULL, b'0', 25.00, '2020-09-25 11:04:34', '2020-09-25 11:04:34', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(103, 1, NULL, b'0', 5.00, '2020-09-25 16:28:05', '2020-09-25 16:28:05', 'Quang Nguyễn', 'Quang Nguyễn', b'0'),
	(104, 85, NULL, b'1', 1.00, '2020-09-25 18:16:56', '2020-09-25 18:16:56', 'loiphung', 'loiphung', b'0'),
	(105, 1, NULL, b'0', 72.00, '2020-09-25 18:25:07', '2020-09-25 18:25:07', 'quangnguyen', 'quangnguyen', b'0'),
	(106, 108, NULL, b'0', 5.00, '2020-09-25 19:08:31', '2020-09-25 19:08:31', 'hoachodien', 'hoachodien', b'0'),
	(107, 108, NULL, b'0', 25.00, '2020-09-25 19:09:02', '2020-09-25 19:09:02', 'hoachodien', 'hoachodien', b'0'),
	(108, 108, NULL, b'0', 1.00, '2020-09-25 19:10:05', '2020-09-25 19:10:05', 'hoachodien', 'hoachodien', b'0'),
	(109, 108, NULL, b'0', 5.00, '2020-09-25 19:11:11', '2020-09-25 19:11:11', 'hoachodien', 'hoachodien', b'0'),
	(110, 108, NULL, b'0', 20.00, '2020-09-25 19:11:28', '2020-09-25 19:11:28', 'hoachodien', 'hoachodien', b'0'),
	(111, 109, NULL, b'0', 44.00, '2020-09-25 19:14:05', '2020-09-25 19:14:05', 'pho123', 'pho123', b'0'),
	(112, 108, NULL, b'0', 1.00, '2020-09-25 19:24:41', '2020-09-25 19:24:41', 'hoachodien', 'hoachodien', b'0'),
	(113, 1, NULL, b'0', 5.00, '2020-09-25 19:34:47', '2020-09-25 19:34:47', 'quangnguyen', 'quangnguyen', b'0'),
	(114, 110, NULL, b'0', 5.00, '2020-09-25 19:39:23', '2020-09-25 19:39:23', 'nam1111', 'nam1111', b'0'),
	(115, 110, NULL, b'0', 4.00, '2020-09-25 19:39:48', '2020-09-25 19:39:48', 'nam1111', 'nam1111', b'0'),
	(116, 110, NULL, b'0', 5.00, '2020-09-25 19:40:07', '2020-09-25 19:40:07', 'nam1111', 'nam1111', b'0');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.detail_contract
CREATE TABLE IF NOT EXISTS `detail_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `detail` text DEFAULT NULL,
  `modelid` int(11) NOT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detail_contract_contractid_contract_id` (`contractid`),
  KEY `FK_detail_contract_modelid_model_id` (`modelid`),
  CONSTRAINT `FK_detail_contract_contractid_contract_id` FOREIGN KEY (`contractid`) REFERENCES `contract` (`id`),
  CONSTRAINT `FK_detail_contract_modelid_model_id` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.detail_contract: ~12 rows (approximately)
/*!40000 ALTER TABLE `detail_contract` DISABLE KEYS */;
INSERT INTO `detail_contract` (`id`, `contractid`, `detail`, `modelid`, `createdate`, `modifieddate`, `createdby`, `modifiedby`, `day`, `price`) VALUES
	(212, 93, NULL, 15, '2020-09-23 17:56:28', '2020-09-23 17:56:28', 'Quang Nguyễn', 'Quang Nguyễn', 4, 20.00),
	(213, 94, NULL, 2, '2020-09-24 16:06:40', '2020-09-24 16:06:40', 'quangnguyen', 'quangnguyen', 3, 12.00),
	(214, 95, NULL, 2, '2020-09-24 19:25:04', '2020-09-24 19:25:04', 'bossang', 'bossang', 3, 12.00),
	(215, 96, NULL, 1, '2020-09-25 08:22:46', '2020-09-25 08:22:46', 'quangnguyen', 'quangnguyen', 1, 4.00),
	(216, 97, NULL, 1, '2020-09-25 08:28:26', '2020-09-25 08:28:26', 'Quang Nguyễn', 'Quang Nguyễn', 2, 8.00),
	(217, 98, NULL, 15, '2020-09-25 08:48:58', '2020-09-25 08:48:58', 'dungdaica', 'dungdaica', 2, 10.00),
	(218, 99, NULL, 1, '2020-09-25 09:24:54', '2020-09-25 09:24:54', 'Quang Nguyễn', 'Quang Nguyễn', 3, 12.00),
	(219, 100, NULL, 2, '2020-09-25 09:51:08', '2020-09-25 09:51:08', 'Quang Nguyễn', 'Quang Nguyễn', 4, 16.00),
	(220, 101, NULL, 29, '2020-09-25 11:02:06', '2020-09-25 11:02:06', 'Quang Nguyễn', 'Quang Nguyễn', 1, 1.00),
	(221, 102, NULL, 15, '2020-09-25 11:04:34', '2020-09-25 11:04:34', 'Quang Nguyễn', 'Quang Nguyễn', 5, 25.00),
	(222, 103, NULL, 13, '2020-09-25 16:28:05', '2020-09-25 16:28:05', 'Quang Nguyễn', 'Quang Nguyễn', 1, 5.00),
	(223, 104, NULL, 29, '2020-09-25 18:16:56', '2020-09-25 18:16:56', 'loiphung', 'loiphung', 1, 1.00),
	(224, 105, NULL, 1, '2020-09-25 18:25:07', '2020-09-25 18:25:07', 'quangnguyen', 'quangnguyen', 6, 24.00),
	(225, 105, NULL, 10, '2020-09-25 18:25:07', '2020-09-25 18:25:07', 'quangnguyen', 'quangnguyen', 12, 48.00),
	(226, 106, NULL, 15, '2020-09-25 19:08:31', '2020-09-25 19:08:31', 'hoachodien', 'hoachodien', 1, 5.00),
	(227, 107, NULL, 15, '2020-09-25 19:09:02', '2020-09-25 19:09:02', 'hoachodien', 'hoachodien', 5, 25.00),
	(228, 108, NULL, 29, '2020-09-25 19:10:05', '2020-09-25 19:10:05', 'hoachodien', 'hoachodien', 1, 1.00),
	(229, 109, NULL, 11, '2020-09-25 19:11:11', '2020-09-25 19:11:11', 'hoachodien', 'hoachodien', 1, 5.00),
	(230, 110, NULL, 4, '2020-09-25 19:11:28', '2020-09-25 19:11:28', 'hoachodien', 'hoachodien', 5, 20.00),
	(231, 111, NULL, 2, '2020-09-25 19:14:05', '2020-09-25 19:14:05', 'pho123', 'pho123', 11, 44.00),
	(232, 112, NULL, 31, '2020-09-25 19:24:41', '2020-09-25 19:24:41', 'hoachodien', 'hoachodien', 1, 1.00),
	(233, 113, NULL, 11, '2020-09-25 19:34:47', '2020-09-25 19:34:47', 'quangnguyen', 'quangnguyen', 1, 5.00),
	(234, 114, NULL, 15, '2020-09-25 19:39:23', '2020-09-25 19:39:23', 'nam1111', 'nam1111', 1, 5.00),
	(235, 115, NULL, 2, '2020-09-25 19:39:48', '2020-09-25 19:39:48', 'nam1111', 'nam1111', 1, 4.00),
	(236, 116, NULL, 3, '2020-09-25 19:40:07', '2020-09-25 19:40:07', 'nam1111', 'nam1111', 1, 5.00);
/*!40000 ALTER TABLE `detail_contract` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NOT NULL,
  `imglink` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_images_modelid_model_id` (`modelid`),
  CONSTRAINT `FK_images_modelid_model_id` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.images: ~136 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `modelid`, `imglink`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 11, 'resources/images/model/female/DTTh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(2, 12, 'resources/images/model/female/DMLh2.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(3, 16, 'resources/images/model/female/BPNh1.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(4, 13, 'resources/images/model/female/MPTh1.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(5, 14, 'resources/images/model/female/NCKDh1.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(6, 15, 'resources/images/model/female/TTVh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(7, 3, 'resources/images/model/male/HGAV5.jpg', '2020-09-14 17:57:41', '2020-09-14 17:57:41', NULL, NULL),
	(8, 17, 'resources/images/model/female/CPh1.jpg', '2020-09-16 11:23:45', '2020-09-16 11:23:45', NULL, NULL),
	(9, 18, 'resources/images/model/female/KNh1.jpg', '2020-09-20 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(10, 22, 'resources/images/model/female/MDh1.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(11, 1, 'resources/images/model/male/congtoan3.jpg', '2020-09-16 16:09:29', '2020-09-16 16:09:29', NULL, NULL),
	(12, 2, 'resources/images/model/male/duyanh5.jpg', '2020-09-16 16:09:56', '2020-09-16 16:09:56', NULL, NULL),
	(13, 4, 'resources/images/model/male/huulong3.jpg', '2020-09-16 16:10:25', '2020-09-16 16:10:25', NULL, NULL),
	(14, 6, 'resources/images/model/male/quangdai1.jpg', '2020-09-16 16:11:05', '2020-09-16 16:11:05', NULL, NULL),
	(15, 7, 'resources/images/model/male/quanghung1.jpg', '2020-09-16 16:11:26', '2020-09-16 16:11:26', NULL, NULL),
	(16, 9, 'resources/images/model/male/thanhan4.jpg', '2020-09-16 16:12:55', '2020-09-16 16:12:55', NULL, NULL),
	(17, 10, 'resources/images/model/male/tuankiet4.jpg', '2020-09-16 16:13:34', '2020-09-16 16:13:34', NULL, NULL),
	(18, 8, 'resources/images/model/male/vocanh2.jpg', '2020-09-16 16:13:55', '2020-09-16 16:13:55', NULL, NULL),
	(19, 5, 'resources/images/model/male/xuantien2.jpg', '2020-09-16 16:14:17', '2020-09-16 16:14:17', NULL, NULL),
	(20, 5, 'resources/images/model/male/xuantien1.jpeg', '2020-09-17 11:08:32', '2020-09-17 11:08:32', NULL, NULL),
	(21, 5, 'resources/images/model/male/xuantien3.jpeg', '2020-09-17 13:21:02', '2020-09-17 13:21:02', NULL, NULL),
	(23, 1, 'resources/images/model/male/congtoan1.jpg', '2020-09-17 13:27:31', '2020-09-17 13:27:31', NULL, NULL),
	(24, 1, 'resources/images/model/male/congtoan2.jpg', '2020-09-17 13:28:00', '2020-09-17 13:28:00', NULL, NULL),
	(25, 1, 'resources/images/model/male/congtoan5.jpg', '2020-09-17 13:28:12', '2020-09-17 13:28:12', NULL, NULL),
	(26, 2, 'resources/images/model/male/duyanh1.jpg', '2020-09-17 13:41:13', '2020-09-17 13:41:13', NULL, NULL),
	(27, 2, 'resources/images/model/male/duyanh2.jpg', '2020-09-17 13:41:27', '2020-09-17 13:41:27', NULL, NULL),
	(28, 2, 'resources/images/model/male/duyanh4.png', '2020-09-17 13:41:42', '2020-09-17 13:41:42', NULL, NULL),
	(29, 3, 'resources/images/model/male/HGAV1.jpg', '2020-09-17 13:46:11', '2020-09-17 13:46:11', NULL, NULL),
	(30, 3, 'resources/images/model/male/HGAV6.jpg', '2020-09-17 13:46:52', '2020-09-17 13:46:52', NULL, NULL),
	(31, 3, 'resources/images/model/male/HGAV4.jpg', '2020-09-17 13:46:52', '2020-09-17 13:46:52', NULL, NULL),
	(32, 4, 'resources/images/model/male/huulong1.jpg', '2020-09-17 13:48:18', '2020-09-17 13:48:18', NULL, NULL),
	(33, 4, 'resources/images/model/male/huulong4.jpg', '2020-09-17 13:48:18', '2020-09-17 13:48:18', NULL, NULL),
	(34, 4, 'resources/images/model/male/huulong5.jpg', '2020-09-17 13:48:18', '2020-09-17 13:48:18', NULL, NULL),
	(35, 6, 'resources/images/model/male/quangdai2.jpg', '2020-09-17 13:51:17', '2020-09-17 13:51:17', NULL, NULL),
	(36, 6, 'resources/images/model/male/quangdai3.jpg', '2020-09-17 13:51:17', '2020-09-17 13:51:17', NULL, NULL),
	(37, 6, 'resources/images/model/male/quangdai4.jpg', '2020-09-17 13:51:17', '2020-09-17 13:51:17', NULL, NULL),
	(38, 7, 'resources/images/model/male/quanghung2.jpg', '2020-09-17 13:53:32', '2020-09-17 13:53:32', NULL, NULL),
	(39, 7, 'resources/images/model/male/quanghung3.jpg', '2020-09-17 13:53:32', '2020-09-17 13:53:32', NULL, NULL),
	(40, 7, 'resources/images/model/male/quanghung4.jpg', '2020-09-17 13:53:32', '2020-09-17 13:53:32', NULL, NULL),
	(41, 8, 'resources/images/model/male/vocanh1.jpg', '2020-09-17 13:54:59', '2020-09-17 13:54:59', NULL, NULL),
	(42, 8, 'resources/images/model/male/vocanh3.jpg', '2020-09-17 13:54:59', '2020-09-17 13:54:59', NULL, NULL),
	(43, 8, 'resources/images/model/male/vocanh4.jpg', '2020-09-17 13:54:59', '2020-09-17 13:54:59', NULL, NULL),
	(44, 9, 'resources/images/model/male/thanhan1.jpg', '2020-09-17 13:56:16', '2020-09-17 13:56:16', NULL, NULL),
	(45, 9, 'resources/images/model/male/thanhan2.jpg', '2020-09-17 13:56:16', '2020-09-17 13:56:16', NULL, NULL),
	(46, 9, 'resources/images/model/male/thanhan3.jpg', '2020-09-17 13:56:16', '2020-09-17 13:56:16', NULL, NULL),
	(47, 10, 'resources/images/model/male/tuankiet1.jpg', '2020-09-17 14:24:43', '2020-09-17 14:24:43', NULL, NULL),
	(48, 10, 'resources/images/model/male/tuankiet2.jpg', '2020-09-17 14:24:43', '2020-09-17 14:24:43', NULL, NULL),
	(49, 10, 'resources/images/model/male/tuankiet3.jpg', '2020-09-17 14:24:43', '2020-09-17 14:24:43', NULL, NULL),
	(51, 11, 'resources/images/model/female/DTTh2.jpg', '2020-09-17 16:30:46', '2020-09-17 16:30:46', NULL, NULL),
	(52, 11, 'resources/images/model/female/DTTh1.jpg', '2020-09-17 16:30:46', '2020-09-17 16:30:46', NULL, NULL),
	(53, 11, 'resources/images/model/female/DTTh4.jpg', '2020-09-17 16:30:46', '2020-09-17 16:30:46', NULL, NULL),
	(54, 12, 'resources/images/model/female/DMLh1.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(55, 12, 'resources/images/model/female/DMLh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(56, 12, 'resources/images/model/female/DMLh4.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(57, 16, 'resources/images/model/female/BPNh2.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(58, 16, 'resources/images/model/female/BPNh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(59, 16, 'resources/images/model/female/BPNh4.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(60, 13, 'resources/images/model/female/MPTh2.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(61, 13, 'resources/images/model/female/MPTh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(62, 13, 'resources/images/model/female/MPTh4.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(63, 14, 'resources/images/model/female/NCKDh2.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(64, 14, 'resources/images/model/female/NCKDh3.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(65, 14, 'resources/images/model/female/NCKDh4.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(66, 15, 'resources/images/model/female/TTVh1.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(67, 15, 'resources/images/model/female/TTVh2.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(68, 15, 'resources/images/model/female/TTVh4.jpg', '2020-09-09 11:54:43', '2020-09-09 11:54:43', NULL, NULL),
	(72, 17, 'resources/images/model/female/CPh2.jpg', '2020-09-16 11:23:45', '2020-09-16 11:23:45', NULL, NULL),
	(73, 17, 'resources/images/model/female/CPh3.jpg', '2020-09-16 11:23:45', '2020-09-16 11:23:45', NULL, NULL),
	(74, 17, 'resources/images/model/female/CPh4.jpg', '2020-09-16 11:23:45', '2020-09-16 11:23:45', NULL, NULL),
	(75, 18, 'resources/images/model/female/KNh2.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(76, 18, 'resources/images/model/female/KNh3.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(77, 18, 'resources/images/model/female/KNh4.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(78, 22, 'resources/images/model/female/MDh2.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(79, 22, 'resources/images/model/female/MDh3.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(80, 22, 'resources/images/model/female/MDh4.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(81, 22, 'resources/images/model/female/MDh2.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(82, 22, 'resources/images/model/female/MDh3.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(83, 22, 'resources/images/model/female/MDh4.jpg', '2020-09-16 11:29:05', '2020-09-16 11:29:05', NULL, NULL),
	(84, 26, 'resources/images/model/kid/AnA1.jpeg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(85, 26, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(88, 29, 'resources/images/model/kid/GiaH1.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(89, 29, 'resources/images/model/kid/GiaH2.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(94, 30, 'resources/images/model/kid/ThienT1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(95, 30, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(98, 37, 'resources/images/model/kid/BaoN1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(99, 37, 'resources/images/model/kid/BaoN2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(102, 33, 'resources/images/model/kid/HongK.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(103, 33, 'resources/images/model/kid/HongK2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(106, 34, 'resources/images/model/kid/HoangTh1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(107, 34, 'resources/images/model/kid/HoangTh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(110, 39, 'resources/images/model/kid/NgoAnna1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(111, 39, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(112, 42, 'resources/images/model/kid/MinhH1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(113, 42, 'resources/images/model/kid/MinhH2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(118, 43, 'resources/images/model/kid/GiaNh1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(119, 43, 'resources/images/model/kid/GiaNh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(120, 44, 'resources/images/model/kid/PhongV2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(121, 44, 'resources/images/model/kid/PhongV1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(124, 45, 'resources/images/model/kid/NhaU1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(125, 45, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(128, 5, 'resources/images/model/male/xuantien5.jpg', '2020-09-18 08:27:56', '2020-09-18 08:27:56', NULL, NULL),
	(129, 21, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(130, 23, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(131, 24, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(132, 25, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(133, 25, 'resources/images/model/kid/NhaU2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(134, 19, 'resources/images/model/female/KNh4.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(135, 19, 'resources/images/model/female/KNh4.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(136, 20, 'resources/images/model/female/KNh4.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(137, 20, 'resources/images/model/female/KNh4.jpg', '2020-09-16 11:27:07', '2020-09-16 11:27:07', NULL, NULL),
	(138, 27, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(139, 27, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(140, 27, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(141, 28, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(142, 28, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(143, 28, 'resources/images/model/kid/AnA2.jpg', '2020-09-17 18:38:59', '2020-09-17 18:38:59', NULL, NULL),
	(144, 31, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(145, 31, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(146, 31, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(147, 32, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(148, 32, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(149, 32, 'resources/images/model/kid/ThienT2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(150, 35, 'resources/images/model/kid/HoangTh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(151, 35, 'resources/images/model/kid/HoangTh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(152, 36, 'resources/images/model/kid/HoangTh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(153, 36, 'resources/images/model/kid/HoangTh2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(154, 38, 'resources/images/model/kid/BaoN2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(155, 38, 'resources/images/model/kid/BaoN2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(156, 38, 'resources/images/model/kid/BaoN2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(157, 40, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(158, 40, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(159, 40, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(160, 41, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(161, 41, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(162, 41, 'resources/images/model/kid/NgoAnna2.jpg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL),
	(163, 45, 'resources/images/model/kid/NhaU1.jpeg', '2020-09-17 18:40:37', '2020-09-17 18:40:37', NULL, NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.model
CREATE TABLE IF NOT EXISTS `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `rankid` int(11) NOT NULL,
  `rating` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `chest` double DEFAULT NULL,
  `hip` double DEFAULT NULL,
  `waist` double DEFAULT NULL,
  `showonhome` bit(1) DEFAULT b'0',
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_model_rankid_rank_model_id` (`rankid`),
  CONSTRAINT `FK_model_rankid_rank_model_id` FOREIGN KEY (`rankid`) REFERENCES `rank_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.model: ~45 rows (approximately)
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` (`id`, `name`, `address`, `email`, `phone`, `rankid`, `rating`, `height`, `weight`, `birthday`, `gender`, `nation`, `description`, `status`, `chest`, `hip`, `waist`, `showonhome`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'CÃ´ng ToÃ n', 'TPHCM', 'congtoan@gmail.com', '90099009', 2, NULL, 1.88, -55, '1991-08-13', b'0', 'VN', 'male model', b'1', 91, 70, 105, b'0', '2020-09-09 16:00:20', '2020-09-25 19:24:29', '', 'quangnguyen'),
	(2, 'Duy Anh ', 'TPHCM', 'duyanh@gmail.com', '0123456789', 2, 5, 1.86, 73, '1997-10-20', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-03 14:58:48', '2020-09-25 20:18:26', '', ''),
	(3, 'HoÃ ng Gia Anh VÅ©', 'TPHCM', 'anhvu@gmail.com', '90099009', 1, NULL, 1.79, -66, '1995-08-23', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:11', '2020-09-25 19:24:51', '', 'quangnguyen'),
	(4, 'Hữu Long', 'TPHCM', 'huulong@gmail.com', '90099009', 2, 0, 1.82, 73, '1998-04-02', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:12', '2020-09-09 16:00:10', NULL, NULL),
	(5, 'Lê Xuân Tiến', 'TPHCM', 'xuantien@gmail.com', '90099009', 1, 0, 1.9, 78, '1996-06-03', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:12', '2020-09-09 16:00:21', NULL, NULL),
	(6, 'Quang Đại', 'TPHCM', 'quangdai@gmail.com', '90099009', 1, 0, 1.87, 75, '1996-06-07', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:13', '2020-09-09 16:00:22', NULL, NULL),
	(7, 'Quang Hùng', 'TPHCM', 'quanghung@gmail.com', '90099009', 2, 1.5, 1.78, 72, '1996-06-07', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:14', '2020-09-09 16:00:22', NULL, NULL),
	(8, 'Võ Cành', 'TPHCM', 'vocanh@gmail.com', '90099009', 2, 0, 1.92, 79, '1994-05-09', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:15', '2020-09-09 16:00:23', NULL, NULL),
	(9, 'Võ Thành An', 'TPHCM', 'thanhan@gmail.com', '90099009', 1, 0, 1.89, 77, '1996-08-05', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:16', '2020-09-09 16:00:24', NULL, NULL),
	(10, 'Vũ Tuấn Kiệt', 'TPHCM', 'tuankiet@gmail.com', '90099009', 2, 0, 1.84, 76, '1996-08-15', b'0', 'VN', 'male model', b'1', 90, 70, 105, b'0', '2020-09-09 16:00:16', '2020-09-09 16:00:24', NULL, NULL),
	(11, 'Đặng Thu Thảo', 'Bac Lieu', 'thao@gmail.com', '90099009', 1, 3, 1.73, 49, '1997-12-04', b'1', 'VN', 'Đặng Thu Thảo là Hoa hậu Việt Nam 2012 và là thí sinh đầu tiên xuất thân từ miền Tây Nam Bộ đăng quang ngôi vị Hoa hậu Việt Nam trong lịch sử của cuộc thi này.', b'1', 83, 60, 90, b'0', '2020-09-09 16:00:17', '2020-09-09 16:00:25', NULL, NULL),
	(12, 'Đỗ Mỹ Linh', 'Ha Noi', 'linh@gmail.com', '90099009', 1, 4.3, 1.71, 52, '1991-01-18', b'1', 'VN', 'Đỗ Mỹ Linh là một hoa hậu người Việt Nam. Cô là Hoa hậu Việt Nam 2016, đại diện Việt Nam thi Hoa hậu Thế giới 2017 tại Trung Quốc lọt Top 40 chung cuộc và nhận giải Hoa Hậu Nhân ái Thế giới.', b'1', 87, 61, 94, b'0', '2020-09-09 16:00:18', '2020-09-25 20:18:26', NULL, NULL),
	(13, 'Mai Phương Thúy', 'Ha Noi', 'thuy@gmail.com', '90099009', 1, 2, 1.8, 60, '1996-10-13', b'1', 'VN', 'Mai Phương Thúy là Hoa hậu Việt Nam 2006. Cô giành vương miện trong cuộc thi Hoa hậu quốc gia được tổ chức vào tháng 8 năm 2006 tại Nha Trang, Khánh Hòa.', b'1', 86, 61.5, 95, b'0', '2020-09-09 16:00:18', '2020-09-09 16:00:26', NULL, NULL),
	(14, 'Nguyễn Cao Kỳ Duyên', 'Nam Dinh', 'duyen@gmail.com', '90099009', 1, 3.5, 1.73, 59, '1988-06-18', b'1', 'VN', 'Nguyễn Cao Kỳ Duyên là hoa hậu Việt Nam năm 2014. Khi đăng quang, cô đang là sinh viên năm thứ nhất khoa Kinh tế đối ngoại, Đại học Ngoại thương Hà Nội.', b'1', 86, 63, 91, b'0', '2020-09-09 16:00:19', '2020-09-09 16:00:27', NULL, NULL),
	(15, 'Trần Tiểu Vy', 'Quang Nam', 'vy@gmail.com', '90099009', 1, 4.5, 1.75, 55, '1996-11-18', b'1', 'VN', 'Trần Tiểu Vy là một hoa hậu người Việt Nam. Cô đăng quang Hoa hậu Việt Nam 2018 và trở thành đại diện Việt Nam tham gia Hoa hậu Thế giới 2018', b'1', 84, 60, 93, b'0', '2020-09-09 15:59:36', '2020-09-25 20:18:26', NULL, NULL),
	(16, 'Bùi Phương Nga', 'Ba Vi', 'nga@gmail.com', '90099009', 2, 3, 1.72, 52, '2000-08-23', b'1', 'VN', 'Bùi Phương Nga là Á hậu 1 của cuộc thi Hoa hậu Việt Nam 2018 và cũng là đại diện Việt Nam tại Hoa hậu Hòa bình Quốc tế 2018. Cô cũng từng là Hoa khôi Gương mặt trang bìa của Báo Sinh viên Việt Nam. Cô đang sinh sống và học tập tại Hà Nội', b'1', 86, 59, 91, b'0', '2020-09-09 15:59:36', '2020-09-09 16:00:28', NULL, NULL),
	(17, 'Chi Pu', 'Ha Noi', 'pu@gmail.com', '90099009', 2, 0, 1.63, 50, '1998-11-16', b'1', 'VN', 'Chi Pu là một nữ Diễn viên, ca sĩ, nhà sản xuất phim, người mẫu ảnh, người dẫn chương trình kiêm Diễn viên lồng tiếng người Việt Nam. Cô được công chúng biết đến sau khi lọt vào top 20 của "Miss Teen Vietnam 2009". Cô là hotgirl Việt Nam có lượng theo dõi và quan tâm nhiều nhất trên mạng xã hội tại thời điểm 2015.', b'1', 84, 59, 91, b'0', '2020-09-09 15:59:37', '2020-09-09 16:00:29', NULL, NULL),
	(18, 'Khả Ngân', 'TPHCM', 'ngan@gmail.com', '90099009', 2, 0, 1.69, 51, '1993-06-14', b'1', 'VN', 'Khả Ngân hay Ngân Shushi là một diễn viên điện ảnh, người mẫu ảnh người Việt Nam.', b'1', 85, 60, 90, b'0', '2020-09-20 20:12:56', '2020-09-09 16:00:31', NULL, NULL),
	(19, 'Nguyễn Thanh Thanh Tú', 'Ha Noi', 'tu@gmail.com', '90099009', 2, 0, 1.81, 60, '1997-07-31', b'1', 'VN', 'Ngô Thanh Thanh Tú là Á hậu 1 - Hoa hậu Việt Nam 2016.', b'1', 86, 60, 90, b'0', '2020-09-09 15:59:38', '2020-09-09 16:00:33', NULL, NULL),
	(20, 'Nguyễn Trần Huyền My', 'Ha Noi', 'my@gmail.com', '90099009', 2, 0, 1.74, 54, '1994-04-22', b'1', 'VN', 'Nguyễn Trần Huyền My là Á hậu cuộc thi Hoa hậu Việt Nam lần thứ XIV năm 2014. Ngoài ra, cô còn là Gương mặt ăn ảnh của cuộc thi Người mẫu Châu Á năm 2011 tổ chức tại Trung Quốc. Cô đại diện Việt Nam đi thi Hoa hậu Hòa bình Quốc tế 2017 được tổ chức tại Việt Nam và lọt vào Top 10 chung cuộc.', b'1', 83, 62, 93, b'0', '2020-09-09 15:59:39', '2020-09-09 16:00:33', NULL, NULL),
	(21, 'JunVu', 'Ha Noi', 'vu@gmail.com', '90099009', 3, 0, 1.62, 50, '1995-12-11', b'1', 'VN', 'female model', b'1', 83, 62, 93, b'0', '2020-09-09 15:59:40', '2020-09-09 16:00:34', NULL, NULL),
	(22, 'Đặng Thị Mỹ Dung', 'TPHCM', 'dung@gmail.com', '90099009', 3, 0, 1.6, 48, '1995-06-04', b'1', 'VN', 'Đặng Thị Mỹ Dung hay còn được biết đến với nghệ danh Midu là một nữ diễn viên, người mẫu ảnh kiêm doanh nhân người Việt Nam. Cô từng tham gia phim điện ảnh Thiên mệnh anh hùng của đạo diễn Victor Vũ.', b'1', 80, 60, 90, b'0', '2020-09-09 15:59:41', '2020-09-09 16:00:35', NULL, NULL),
	(23, 'Ngọc Trinh', 'TPHCM', 'trinh@gmail.com', '90099009', 3, 0, 1.68, 45, '1989-05-10', b'1', 'VN', 'female model', b'1', 85, 56, 90, b'0', '2020-09-09 15:59:41', '2020-09-09 16:00:36', NULL, NULL),
	(24, 'Nhã Phương', 'Dak Lak', 'phuong@gmail.com', '90099009', 3, 0, 1.63, 45, '1989-09-27', b'1', 'VN', 'female model', b'1', 85, 61, 90, b'0', '2020-09-09 15:59:42', '2020-09-09 16:00:37', NULL, NULL),
	(25, 'Ninh Dương Lan Ngọc', 'TPHCM', 'ngoc@gmail.com', '90099009', 3, 0, 1.68, 47, '1990-05-20', b'1', 'VN', 'female model', b'1', 85, 61, 90, b'0', '2020-09-09 15:59:43', '2020-09-09 16:00:38', NULL, NULL),
	(26, 'Võ An An', 'TPHCM', 'anan@gmail.com', '707000441', 4, 0, 1.12, 25, '2010-10-05', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:44', '2020-09-09 16:00:38', NULL, NULL),
	(27, 'Võ An An1', 'TPHCM', 'anan@gmail.com', '707000441', 4, 0, 1.12, 25, '2010-10-05', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:44', '2020-09-09 16:00:38', NULL, NULL),
	(28, 'Nguyễn Ngọc Hà Linh', 'Ha Noi', 'halinh@gmail.com', '707000443', 4, 0, 1.15, 25, '2012-05-17', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:45', '2020-09-17 18:41:25', NULL, NULL),
	(29, 'Trần Gia Hân', 'TPHCM', 'giahan@gmail.com', '707000444', 4, 5, 1.26, 30, '2010-05-09', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:46', '2020-09-25 20:18:26', NULL, NULL),
	(30, 'Hà Thiên Trang', 'Ha Noi', 'thientrang@gmail.com', '707000445', 4, 0, 1.16, 25, '2007-06-04', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:47', '2020-09-09 16:00:43', NULL, NULL),
	(31, 'Phan Nguyễn Bảo Ngọc', 'TPHCM', 'baongoc@gmail.com', '707000446', 4, 0, 1.13, 25, '2012-07-16', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:48', '2020-09-17 18:50:28', NULL, NULL),
	(32, 'Phan Nguyễn Bảo Ngọc1', 'TPHCM', 'baongoc@gmail.com', '707000446', 4, 0, 1.13, 25, '2012-07-16', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:48', '2020-09-17 18:50:28', NULL, NULL),
	(33, 'Võ Phan Hồng Khánh', 'TPHCM', 'hongkhanh@gmail.com', '707000448', 4, 0, 1.1, 24, '2012-07-06', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:49', '2020-09-09 16:03:11', NULL, NULL),
	(34, 'Lê Văn Hoàng Thái', 'Dong Nai', 'hoangthai@gmail.com', '707000449', 4, 0, 1.23, 30, '2008-12-03', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:50', '2020-09-09 16:03:11', NULL, NULL),
	(35, 'Lê Văn Hoàng Thái1', 'Dong Nai', 'hoangthai@gmail.com', '707000449', 4, 0, 1.23, 30, '2008-12-03', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:50', '2020-09-09 16:03:11', NULL, NULL),
	(36, 'Lê Văn Hoàng Thái2', 'Dong Nai', 'hoangthai@gmail.com', '707000449', 4, 0, 1.23, 30, '2008-12-03', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:50', '2020-09-09 16:03:11', NULL, NULL),
	(37, 'Nguyễn Hoàng Bảo Nam', 'Ha Noi', 'baonam@gmail.com', '707000452', 4, 0, 1.17, 22, '2012-03-07', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:55', '2020-09-09 16:03:13', NULL, NULL),
	(38, 'Đoàn Đức Tiến Trà', 'Ha Noi', 'tientra@gmail.com', '707000453', 4, 0, 1.22, 29, '2010-03-04', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:56', '2020-09-17 18:52:07', NULL, NULL),
	(39, 'Ngô Anna', 'TPHCM', 'ngoanna@gmail.com', '707000454', 4, 0, 1.17, 26, '2011-09-06', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:56', '2020-09-09 16:03:15', NULL, NULL),
	(40, 'Ngô Anna1', 'TPHCM', 'ngoanna@gmail.com', '707000454', 4, 0, 1.17, 26, '2011-09-06', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:56', '2020-09-09 16:03:15', NULL, NULL),
	(41, 'Ngô Anna2', 'TPHCM', 'ngoanna@gmail.com', '707000454', 4, 0, 1.17, 26, '2011-09-06', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:56', '2020-09-09 16:03:15', NULL, NULL),
	(42, 'Đào Minh Hải', 'Nghe An', 'minhhai@gmail.com', '707000457', 4, 0, 1.16, 24, '2012-05-06', b'0', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:58', '2020-09-09 16:03:17', NULL, NULL),
	(43, 'Phạm Ngô Gia Nhi', 'Ha Noi', 'gianhi@gmail.com', '707000458', 4, 0, 1.25, 29, '2009-09-14', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 15:59:59', '2020-09-09 16:03:17', NULL, NULL),
	(44, 'Huỳnh Phong Vinh', 'TPHCM', 'phongvinh@gmail.com', '707000459', 4, 0, 1.13, 22, '2010-07-08', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 16:00:06', '2020-09-09 16:03:18', NULL, NULL),
	(45, 'Nguyễn Nhã Uyên', 'Ha Noi', 'nhauyen@gmail.com', '707000460', 4, 0, 1.11, 22, '2012-10-20', b'1', 'VN', 'kid model', b'1', 0, 0, 0, b'0', '2020-09-09 16:00:06', NULL, NULL, NULL);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.model_talent
CREATE TABLE IF NOT EXISTS `model_talent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NOT NULL,
  `talentid` int(11) NOT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_model_talent_talentid_talent_id` (`talentid`),
  KEY `FK_model_talent_modelid_model_id` (`modelid`),
  CONSTRAINT `FK_model_talent_modelid_model_id` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_model_talent_talentid_talent_id` FOREIGN KEY (`talentid`) REFERENCES `talent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.model_talent: ~91 rows (approximately)
/*!40000 ALTER TABLE `model_talent` DISABLE KEYS */;
INSERT INTO `model_talent` (`id`, `modelid`, `talentid`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 1, 1, NULL, NULL, NULL, NULL),
	(2, 1, 2, NULL, NULL, NULL, NULL),
	(3, 2, 3, NULL, NULL, NULL, NULL),
	(4, 2, 4, NULL, NULL, NULL, NULL),
	(5, 3, 5, NULL, NULL, NULL, NULL),
	(6, 3, 1, NULL, NULL, NULL, NULL),
	(7, 4, 2, NULL, NULL, NULL, NULL),
	(8, 4, 3, NULL, NULL, NULL, NULL),
	(9, 5, 4, NULL, NULL, NULL, NULL),
	(10, 5, 5, NULL, NULL, NULL, NULL),
	(11, 6, 1, NULL, NULL, NULL, NULL),
	(12, 6, 2, NULL, NULL, NULL, NULL),
	(13, 7, 3, NULL, NULL, NULL, NULL),
	(14, 7, 4, NULL, NULL, NULL, NULL),
	(15, 8, 5, NULL, NULL, NULL, NULL),
	(16, 8, 1, NULL, NULL, NULL, NULL),
	(17, 9, 2, NULL, NULL, NULL, NULL),
	(18, 9, 3, NULL, NULL, NULL, NULL),
	(19, 10, 4, NULL, NULL, NULL, NULL),
	(20, 10, 5, NULL, NULL, NULL, NULL),
	(21, 11, 1, NULL, NULL, NULL, NULL),
	(22, 11, 2, NULL, NULL, NULL, NULL),
	(23, 12, 3, NULL, NULL, NULL, NULL),
	(24, 12, 4, NULL, NULL, NULL, NULL),
	(25, 13, 5, NULL, NULL, NULL, NULL),
	(26, 13, 1, NULL, NULL, NULL, NULL),
	(27, 14, 2, NULL, NULL, NULL, NULL),
	(28, 14, 3, NULL, NULL, NULL, NULL),
	(29, 15, 4, NULL, NULL, NULL, NULL),
	(30, 15, 5, NULL, NULL, NULL, NULL),
	(31, 16, 1, NULL, NULL, NULL, NULL),
	(32, 16, 2, NULL, NULL, NULL, NULL),
	(33, 17, 3, NULL, NULL, NULL, NULL),
	(34, 17, 4, NULL, NULL, NULL, NULL),
	(35, 18, 5, NULL, NULL, NULL, NULL),
	(36, 18, 1, NULL, NULL, NULL, NULL),
	(37, 19, 2, NULL, NULL, NULL, NULL),
	(38, 19, 3, NULL, NULL, NULL, NULL),
	(39, 20, 4, NULL, NULL, NULL, NULL),
	(40, 20, 5, NULL, NULL, NULL, NULL),
	(41, 21, 1, NULL, NULL, NULL, NULL),
	(42, 21, 2, NULL, NULL, NULL, NULL),
	(43, 22, 3, NULL, NULL, NULL, NULL),
	(44, 22, 4, NULL, NULL, NULL, NULL),
	(45, 23, 5, NULL, NULL, NULL, NULL),
	(46, 23, 1, NULL, NULL, NULL, NULL),
	(47, 24, 2, NULL, NULL, NULL, NULL),
	(48, 24, 3, NULL, NULL, NULL, NULL),
	(49, 25, 4, NULL, NULL, NULL, NULL),
	(50, 25, 5, NULL, NULL, NULL, NULL),
	(51, 26, 1, NULL, NULL, NULL, NULL),
	(52, 26, 2, NULL, NULL, NULL, NULL),
	(55, 28, 5, NULL, NULL, NULL, NULL),
	(56, 28, 1, NULL, NULL, NULL, NULL),
	(57, 29, 2, NULL, NULL, NULL, NULL),
	(58, 29, 3, NULL, NULL, NULL, NULL),
	(59, 30, 4, NULL, NULL, NULL, NULL),
	(60, 30, 5, NULL, NULL, NULL, NULL),
	(61, 31, 1, NULL, NULL, NULL, NULL),
	(62, 31, 2, NULL, NULL, NULL, NULL),
	(65, 33, 5, NULL, NULL, NULL, NULL),
	(66, 33, 1, NULL, NULL, NULL, NULL),
	(67, 34, 2, NULL, NULL, NULL, NULL),
	(68, 34, 3, NULL, NULL, NULL, NULL),
	(73, 37, 3, NULL, NULL, NULL, NULL),
	(74, 37, 4, NULL, NULL, NULL, NULL),
	(75, 38, 5, NULL, NULL, NULL, NULL),
	(76, 38, 1, NULL, NULL, NULL, NULL),
	(77, 39, 2, NULL, NULL, NULL, NULL),
	(78, 39, 3, NULL, NULL, NULL, NULL),
	(83, 42, 3, NULL, NULL, NULL, NULL),
	(84, 42, 4, NULL, NULL, NULL, NULL),
	(85, 43, 5, NULL, NULL, NULL, NULL),
	(86, 43, 1, NULL, NULL, NULL, NULL),
	(87, 44, 2, NULL, NULL, NULL, NULL),
	(88, 44, 3, NULL, NULL, NULL, NULL),
	(89, 45, 4, NULL, NULL, NULL, NULL),
	(90, 45, 5, NULL, NULL, NULL, NULL),
	(91, 27, 2, NULL, NULL, NULL, NULL),
	(92, 27, 5, NULL, NULL, NULL, NULL),
	(93, 32, 2, NULL, NULL, NULL, NULL),
	(94, 35, 1, NULL, NULL, NULL, NULL),
	(95, 35, 3, NULL, NULL, NULL, NULL),
	(96, 36, 5, '2020-09-18 20:17:20', '2020-09-18 20:17:20', NULL, NULL),
	(97, 36, 3, '2020-09-18 20:17:20', '2020-09-18 20:17:20', NULL, NULL),
	(98, 40, 5, '2020-09-18 20:17:47', '2020-09-18 20:17:47', NULL, NULL),
	(99, 40, 2, '2020-09-18 20:17:47', '2020-09-18 20:17:47', NULL, NULL),
	(100, 41, 1, '2020-09-18 20:17:47', '2020-09-18 20:17:47', NULL, NULL),
	(101, 41, 4, '2020-09-18 20:17:47', '2020-09-18 20:17:47', NULL, NULL),
	(103, 32, 5, NULL, NULL, NULL, NULL),
	(104, 1, 4, '2020-09-24 09:54:15', '2020-09-24 09:54:15', NULL, NULL);
/*!40000 ALTER TABLE `model_talent` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.rank_model
CREATE TABLE IF NOT EXISTS `rank_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.rank_model: ~4 rows (approximately)
/*!40000 ALTER TABLE `rank_model` DISABLE KEYS */;
INSERT INTO `rank_model` (`id`, `name`, `price`, `salary`, `status`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'Rank A', 5.00, 4.00, b'1', '2020-08-27 08:54:35', '2020-08-27 08:54:36', NULL, NULL),
	(2, 'Rank B', 4.00, 3.00, b'1', '2020-08-27 08:54:50', '2020-08-27 08:54:51', NULL, NULL),
	(3, 'Rank C', 3.00, 2.00, b'1', NULL, NULL, NULL, NULL),
	(4, 'Rank D', 1.00, 1.00, b'1', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `rank_model` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.rating
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `contractid` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rating_modelid_model_id` (`modelid`),
  KEY `FK_rating_userid_user_id` (`accountid`) USING BTREE,
  CONSTRAINT `FK_rating_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_rating_modelid_model_id` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.rating: ~16 rows (approximately)
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` (`id`, `accountid`, `modelid`, `contractid`, `star`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 100, 12, 1, 3, '2020-09-18 19:57:50', '2020-09-21 09:36:40', NULL, NULL),
	(2, 84, 12, 0, 5, '2020-09-18 19:58:53', '2020-09-18 19:58:53', NULL, NULL),
	(3, 101, 12, 0, 5, '2020-09-18 19:59:35', '2020-09-18 19:59:35', NULL, NULL),
	(4, 101, 29, 0, 5, '2020-09-18 20:06:50', '2020-09-18 20:06:50', NULL, NULL),
	(5, 102, 12, 2, 0, '2020-09-21 10:55:19', '2020-09-21 10:55:19', NULL, NULL),
	(6, 102, 2, 0, 5, '2020-09-23 14:27:24', '2020-09-23 14:27:24', NULL, NULL),
	(7, 100, 15, 0, 5, '2020-09-23 14:48:36', '2020-09-23 14:48:36', NULL, NULL),
	(8, 100, 15, 0, 5, '2020-09-23 14:48:38', '2020-09-23 14:48:38', NULL, NULL),
	(14, 1, 15, 93, 4, '2020-09-25 14:17:52', '2020-09-25 14:17:52', NULL, NULL),
	(15, 1, 15, 93, 5, '2020-09-25 15:05:21', '2020-09-25 15:05:21', NULL, NULL),
	(16, 1, 15, 93, 4, '2020-09-25 15:45:33', '2020-09-25 15:45:33', NULL, NULL),
	(17, 1, 15, 93, 5, '2020-09-25 16:26:40', '2020-09-25 16:26:40', NULL, NULL),
	(18, 1, 15, 93, 5, '2020-09-25 16:29:05', '2020-09-25 16:29:05', NULL, NULL),
	(19, 1, 15, 93, 5, '2020-09-25 16:38:31', '2020-09-25 16:38:31', NULL, NULL),
	(20, 1, 15, 93, 3, '2020-09-25 17:03:12', '2020-09-25 17:03:12', NULL, NULL),
	(21, 1, 15, 93, 4, '2020-09-25 18:15:14', '2020-09-25 18:15:14', NULL, NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.report
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spending` decimal(10,2) DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT 'SYSTEM',
  `modifiedby` varchar(255) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.report: ~8 rows (approximately)
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`id`, `spending`, `income`, `profit`, `month`, `year`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 100000.00, 120000.00, 20000.00, 1, 2020, '2020-09-14 13:09:00', '2020-09-14 13:09:00', 'SYSTEM', 'SYSTEM'),
	(2, 120000.00, 140000.00, -20000.00, 2, 2020, '2020-09-14 13:09:13', '2020-09-14 13:09:13', 'SYSTEM', 'SYSTEM'),
	(3, 100000.00, 150000.00, 0.00, 3, 2020, '2020-09-14 14:43:13', '2020-09-14 14:43:13', 'SYSTEM', 'SYSTEM'),
	(4, 150000.00, 160000.00, 100.00, 4, 2020, '2020-09-14 15:26:06', '2020-09-14 15:26:06', 'SYSTEM', 'SYSTEM'),
	(5, 200000.00, 270000.00, -200.00, 5, 2020, '2020-09-14 15:26:45', '2020-09-14 15:26:45', 'SYSTEM', 'SYSTEM'),
	(6, 220000.00, 260000.00, 400.00, 6, 2020, '2020-09-14 15:32:36', '2020-09-14 15:32:36', 'SYSTEM', 'SYSTEM'),
	(7, 250000.00, 300000.00, -500.00, 7, 2020, '2020-09-14 15:32:49', '2020-09-14 15:32:49', 'SYSTEM', 'SYSTEM'),
	(8, 350000.00, 470000.00, -800.00, 8, 2020, '2020-09-14 15:33:17', '2020-09-14 15:33:17', 'SYSTEM', 'SYSTEM');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.role: ~4 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `description`, `salary`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'ADMIN', 'lorem', 3.00, NULL, NULL, NULL, NULL),
	(2, 'MANAGEMENT', 'lorem', 2.00, NULL, NULL, NULL, NULL),
	(3, 'STAFF', 'lorem', 1.00, NULL, NULL, NULL, NULL),
	(4, 'USER', 'lorem', 0.00, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.role_account
CREATE TABLE IF NOT EXISTS `role_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL DEFAULT 4,
  `accountid` int(11) NOT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT 'ADMIN',
  `modifiedby` varchar(255) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `FK_role_user_roleid_role_id` (`roleid`),
  KEY `FK_role_user_userid_account_id` (`accountid`) USING BTREE,
  CONSTRAINT `FK_role_user_roleid_role_id` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_role_user_userid_account_id` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.role_account: ~29 rows (approximately)
/*!40000 ALTER TABLE `role_account` DISABLE KEYS */;
INSERT INTO `role_account` (`id`, `roleid`, `accountid`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 1, 1, '2020-09-10 20:15:12', '2020-09-10 20:15:13', 'ADMIN', 'SYSTEM'),
	(2, 2, 1, '2020-09-10 20:15:35', '2020-09-10 20:15:36', 'ADMIN', 'SYSTEM'),
	(3, 3, 1, '2020-09-10 20:15:48', '2020-09-10 20:15:49', 'ADMIN', 'SYSTEM'),
	(4, 4, 1, '2020-09-10 20:15:54', '2020-09-10 20:15:55', 'ADMIN', 'SYSTEM'),
	(72, 1, 80, '2020-09-14 10:46:39', '2020-09-14 10:46:39', 'ADMIN', 'SYSTEM'),
	(73, 4, 81, '2020-09-14 19:32:34', '2020-09-14 19:32:34', 'ADMIN', 'SYSTEM'),
	(74, 4, 82, '2020-09-15 08:41:34', '2020-09-15 08:41:34', 'ADMIN', 'SYSTEM'),
	(75, 4, 83, '2020-09-15 16:15:10', '2020-09-15 16:15:10', 'ADMIN', 'SYSTEM'),
	(76, 4, 84, '2020-09-15 18:30:49', '2020-09-15 18:30:49', 'ADMIN', 'SYSTEM'),
	(77, 4, 85, '2020-09-15 18:33:51', '2020-09-15 18:33:51', 'ADMIN', 'SYSTEM'),
	(79, 4, 87, '2020-09-15 19:06:45', '2020-09-15 19:06:45', 'ADMIN', 'SYSTEM'),
	(80, 4, 89, '2020-09-15 19:10:32', '2020-09-15 19:10:32', 'ADMIN', 'SYSTEM'),
	(81, 4, 90, '2020-09-15 19:12:41', '2020-09-15 19:12:41', 'ADMIN', 'SYSTEM'),
	(82, 4, 91, '2020-09-15 19:13:55', '2020-09-15 19:13:55', 'ADMIN', 'SYSTEM'),
	(83, 4, 92, '2020-09-15 19:14:59', '2020-09-15 19:14:59', 'ADMIN', 'SYSTEM'),
	(84, 3, 93, '2020-09-16 19:42:44', '2020-09-16 19:42:44', 'ADMIN', 'SYSTEM'),
	(85, 2, 93, '2020-09-16 19:42:44', '2020-09-16 19:42:44', 'ADMIN', 'SYSTEM'),
	(86, 1, 93, '2020-09-16 19:42:44', '2020-09-16 19:42:44', 'ADMIN', 'SYSTEM'),
	(87, 4, 94, '2020-09-17 13:25:57', '2020-09-17 13:25:57', 'ADMIN', 'SYSTEM'),
	(88, 4, 95, '2020-09-18 08:20:30', '2020-09-18 08:20:30', 'ADMIN', 'SYSTEM'),
	(89, 1, 90, '2020-09-18 17:21:24', '2020-09-18 17:21:24', 'ADMIN', 'SYSTEM'),
	(90, 1, 89, '2020-09-18 18:45:00', '2020-09-18 18:45:00', 'ADMIN', 'SYSTEM'),
	(91, 4, 98, '2020-09-18 18:46:53', '2020-09-18 18:46:53', 'ADMIN', 'SYSTEM'),
	(92, 4, 99, '2020-09-18 18:49:51', '2020-09-18 18:49:51', 'ADMIN', 'SYSTEM'),
	(93, 4, 100, '2020-09-18 18:51:35', '2020-09-18 18:51:35', 'ADMIN', 'SYSTEM'),
	(94, 4, 101, '2020-09-18 18:53:35', '2020-09-18 18:53:35', 'ADMIN', 'SYSTEM'),
	(95, 4, 102, '2020-09-18 18:59:20', '2020-09-18 18:59:20', 'ADMIN', 'SYSTEM'),
	(96, 4, 103, '2020-09-21 15:57:40', '2020-09-21 15:57:40', 'ADMIN', 'SYSTEM'),
	(99, 4, 106, '2020-09-22 09:28:17', '2020-09-22 09:28:17', 'ADMIN', 'SYSTEM'),
	(101, 4, 108, '2020-09-25 18:58:57', '2020-09-25 18:58:57', 'ADMIN', 'SYSTEM'),
	(102, 4, 109, '2020-09-25 19:10:51', '2020-09-25 19:10:51', 'ADMIN', 'SYSTEM'),
	(103, 4, 110, '2020-09-25 19:33:30', '2020-09-25 19:33:30', 'ADMIN', 'SYSTEM'),
	(104, 4, 111, '2020-09-25 19:48:18', '2020-09-25 19:48:18', 'ADMIN', 'SYSTEM'),
	(105, 4, 112, '2020-09-25 19:52:57', '2020-09-25 19:52:57', 'ADMIN', 'SYSTEM');
/*!40000 ALTER TABLE `role_account` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.salary_model
CREATE TABLE IF NOT EXISTS `salary_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NOT NULL DEFAULT 0,
  `month` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modelid` (`modelid`),
  CONSTRAINT `FK_salary_model_model` FOREIGN KEY (`modelid`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=892 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.salary_model: ~0 rows (approximately)
/*!40000 ALTER TABLE `salary_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_model` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.salary_staff
CREATE TABLE IF NOT EXISTS `salary_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT 'SYSTEM',
  `modifiedby` varchar(255) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  CONSTRAINT `FK_salary_staff_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.salary_staff: ~0 rows (approximately)
/*!40000 ALTER TABLE `salary_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_staff` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.slide
CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.slide: ~3 rows (approximately)
/*!40000 ALTER TABLE `slide` DISABLE KEYS */;
INSERT INTO `slide` (`id`, `img`, `description`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'resources/web/images/slide3.jpg', 'image slide', '2020-09-01 10:07:55', '2020-09-08 16:09:33', 'admin', 'admin'),
	(2, 'resources/web/images/slide1.jpg', 'image slide', '2020-09-01 10:08:05', '2020-09-01 10:08:05', 'admin', 'admin'),
	(3, 'resources/web/images/slide2.jpg', 'image slide', '2020-09-01 10:08:20', '2020-09-01 10:08:20', 'admin', 'admin');
/*!40000 ALTER TABLE `slide` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.social
CREATE TABLE IF NOT EXISTS `social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `social` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_social_contactid_contact_id` (`contactid`),
  CONSTRAINT `FK_social_contactid_contact_id` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.social: ~0 rows (approximately)
/*!40000 ALTER TABLE `social` DISABLE KEYS */;
/*!40000 ALTER TABLE `social` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT 'KITS3',
  `idcard` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `accountid` int(11) NOT NULL,
  `coefficients_salary` double(22,0) DEFAULT 1,
  `birthday` date DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_accountid_account_id` (`accountid`),
  CONSTRAINT `FK_staff_accountid_account_id` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.staff: ~3 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`id`, `name`, `address`, `phone`, `company`, `idcard`, `gender`, `avatar`, `accountid`, `coefficients_salary`, `birthday`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'Quang Nguyễn', 'Số 1. Võ Văn Ngân', '123456789', 'KITS3', '123456789', b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 1, 1, '2020-09-11', '2020-09-11 08:20:33', '2020-09-11 08:20:34', 'quangnguyen', 'quangnguyen'),
	(16, 'dungdeptrai', '3213', '1', 'KITS3', '1', b'1', NULL, 80, 1, NULL, '2020-09-14 11:05:40', '2020-09-14 11:05:40', NULL, NULL),
	(17, 'loiciiiii', '4324234', '1234421421', '423432423', '1234421421', b'1', 'resources/images/avatar/staff/93_43242342.jpg', 93, 1, '2018-07-22', '2020-09-16 19:42:44', '2020-09-16 19:42:44', 'quangnguyen', 'quangnguyen');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.talent
CREATE TABLE IF NOT EXISTS `talent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.talent: ~5 rows (approximately)
/*!40000 ALTER TABLE `talent` DISABLE KEYS */;
INSERT INTO `talent` (`id`, `name`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(1, 'Look Book', '2020-09-03 14:56:39', '2020-09-04 19:25:03', 'admin', 'admin'),
	(2, 'KOL', '2020-08-27 09:14:51', '2020-08-27 09:14:51', 'admin', 'admin'),
	(3, 'Street Style', '2020-08-27 09:15:02', '2020-08-27 09:15:02', 'admin', 'admin'),
	(4, 'Sporty', '2020-08-27 09:15:17', '2020-08-27 09:15:17', 'admin', 'admin'),
	(5, 'Art', '2020-08-27 09:22:23', '2020-09-07 20:14:47', 'admin', 'admin');
/*!40000 ALTER TABLE `talent` ENABLE KEYS */;

-- Dumping structure for table modelmanagement.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `accountid` int(11) NOT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp(),
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_accountid_account_id` (`accountid`),
  CONSTRAINT `FK_user_accountid_account_id` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- Dumping data for table modelmanagement.user: ~22 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `address`, `phone`, `company`, `idcard`, `gender`, `avatar`, `accountid`, `createdate`, `modifieddate`, `createdby`, `modifiedby`) VALUES
	(53, 'dungkaka', 'q12', '0909090909', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_3.jpg', 80, '2020-09-14 10:46:39', '2020-09-14 10:46:39', 'dungdaica', 'dungdaica'),
	(54, 'Khach Hang', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_2.jpg', 81, '2020-09-14 19:32:34', '2020-09-14 19:32:34', 'khachhang1', 'khachhang1'),
	(55, 'Khach Hang 2', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 82, '2020-09-15 08:41:34', '2020-09-15 08:41:34', 'khachhang2', 'khachhang2'),
	(56, 'LLLLLLL', NULL, '01234564556', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 83, '2020-09-15 16:15:10', '2020-09-15 16:15:10', 'khachhang3', 'khachhang3'),
	(57, 'Giang Há»', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 84, '2020-09-15 18:30:49', '2020-09-15 18:30:49', 'gianglatao', 'gianglatao'),
	(58, 'LoiPhung', 'HM', '0386054546', 'KITS3', NULL, b'1', 'resources/images/system/avatar/system_avatar_1.jpg', 85, '2020-09-15 18:33:51', '2020-09-15 18:33:51', 'loiphung', 'loiphung'),
	(60, 'dungkaka', NULL, '0909090909', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 87, '2020-09-15 19:06:45', '2020-09-15 19:06:45', 'dungdaica1', 'dungdaica1'),
	(61, 'sangca', NULL, '11565151454', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_2.jpg', 89, '2020-09-15 19:10:32', '2020-09-15 19:10:32', 'sangdaica', 'sangdaica'),
	(62, 'boss sang', NULL, '51212111211', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_2.jpg', 90, '2020-09-15 19:12:41', '2020-09-15 19:12:41', 'bossang', 'bossang'),
	(63, 'minhdeptrai1', NULL, '0123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_3.jpg', 91, '2020-09-15 19:13:55', '2020-09-15 19:13:55', 'minhdeptrai1', 'minhdeptrai1'),
	(64, 'quangK', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 92, '2020-09-15 19:14:59', '2020-09-15 19:14:59', 'quangka', 'quangka'),
	(65, 'dungkaka', NULL, '0909090909', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_1.jpg', 94, '2020-09-17 13:25:57', '2020-09-17 13:25:57', 'dungkhachhang', 'dungkhachhang'),
	(66, 'dasdassadas', NULL, '121212121', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_4.jpg', 95, '2020-09-18 08:20:30', '2020-09-18 08:20:30', 'sangdaicaca', 'sangdaicaca'),
	(67, 'Ducccc', NULL, '0123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 96, '2020-09-18 17:21:24', '2020-09-18 17:21:24', 'vmd211099', 'vmd211099'),
	(68, 'thienhandsome', NULL, '0123456788', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_2.jpg', 97, '2020-09-18 18:45:00', '2020-09-18 18:45:00', 'thienhandsome', 'thienhandsome'),
	(69, 'quangdeptrai', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 98, '2020-09-18 18:46:53', '2020-09-18 18:46:53', 'quangdeptrai', 'quangdeptrai'),
	(70, 'dungdai', NULL, '0909090909', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_4.jpg', 99, '2020-09-18 18:49:51', '2020-09-18 18:49:51', 'dungyeuvo', 'dungyeuvo'),
	(71, 'deptraisang', NULL, '123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_3.jpg', 100, '2020-09-18 18:51:35', '2020-09-18 18:51:35', 'deptraisang', 'deptraisang'),
	(72, 'depsangtrai', NULL, '25132123213', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 101, '2020-09-18 18:53:35', '2020-09-18 18:53:35', 'depsangtrai', 'depsangtrai'),
	(73, 'ducabcd', NULL, '0123456789', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_4.jpg', 102, '2020-09-18 18:59:20', '2020-09-18 18:59:20', 'ducdeptrai', 'ducdeptrai'),
	(74, 'liendethuong', NULL, '01324564758', NULL, NULL, b'0', 'resources/images/system/avatar/system_avatar_1.jpg', 103, '2020-09-21 15:57:40', '2020-09-21 15:57:40', 'liendethuong', 'liendethuong'),
	(77, 'Đức Cớp', '', '0123456789', '', NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 106, '2020-09-22 09:28:17', '2020-09-22 09:28:17', 'ducdethuong', 'ducdethuong'),
	(79, 'hoachodien', '', 'jihin', '', NULL, b'0', 'resources/images/system/avatar/system_avatar_3.jpg', 108, '2020-09-25 18:58:57', '2020-09-25 18:58:57', 'hoachodien', 'hoachodien'),
	(80, 'pho123', 'cho lon', '03125601235', 'cong ty lon', NULL, b'1', 'resources/images/system/avatar/system_avatar_3.jpg', 109, '2020-09-25 19:10:51', '2020-09-25 19:10:51', 'pho123', 'pho123'),
	(81, 'Nam 22222', NULL, '2132132132', NULL, NULL, b'0', 'resources/images/system/avatar/system_avatar_3.jpg', 110, '2020-09-25 19:33:30', '2020-09-25 19:33:30', 'nam1111', 'nam1111'),
	(82, 'quangnguyen', NULL, '-456132156', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 111, '2020-09-25 19:48:18', '2020-09-25 19:48:18', 'loi123', 'loi123'),
	(83, 'loicccccccc', NULL, '1234567893', NULL, NULL, b'1', 'resources/images/system/avatar/system_avatar_6.jpg', 112, '2020-09-25 19:52:57', '2020-09-25 19:52:57', 'loiccccccccc', 'loiccccccccc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
