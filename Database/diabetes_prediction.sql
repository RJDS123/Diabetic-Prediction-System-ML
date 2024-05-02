-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 02, 2024 at 05:44 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabetes_prediction`
--

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

DROP TABLE IF EXISTS `predictions`;
CREATE TABLE IF NOT EXISTS `predictions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pregnancies` varchar(255) NOT NULL,
  `glucose` varchar(255) NOT NULL,
  `blood_pressure` varchar(255) NOT NULL,
  `skin_thickness` varchar(255) NOT NULL,
  `insulin` varchar(255) NOT NULL,
  `bmi` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `prediction_result` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `predictions`
--

INSERT INTO `predictions` (`id`, `pregnancies`, `glucose`, `blood_pressure`, `skin_thickness`, `insulin`, `bmi`, `age`, `prediction_result`, `created_at`) VALUES
(1, 'MQ==', 'MTAw', 'MTAw', 'MTUw', 'MTQw', 'NTA=', 'NTE=', 'Tm90IERpYWJldGlj', '2024-04-19 21:55:00'),
(2, 'MQ==', 'MTIw', 'NDA=', 'NTI=', 'MTY1', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:23:27'),
(3, 'MQ==', 'MTIw', 'NDA=', 'NTI=', 'MTY1', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:23:37'),
(4, 'MQ==', 'MTIw', 'NDA=', 'NTI=', 'MTY1', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:24:17'),
(5, 'MQ==', 'MTIw', 'NDA=', 'NTI=', 'MzAw', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:28:03'),
(6, 'MQ==', 'MTIw', 'NDA=', 'NjA=', 'MzAw', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:28:10'),
(7, 'MQ==', 'MTIw', 'NDA=', 'MjA=', 'MzAw', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:28:12'),
(8, 'MQ==', 'MTIw', 'NDAw', 'MjA=', 'MzAw', 'NDI=', 'MjM=', 'Tm90IERpYWJldGlj', '2024-04-21 20:28:17'),
(9, 'MQ==', 'MTIwMA==', 'NDAw', 'MjA=', 'MzAw', 'NDI=', 'MjM=', 'RGlhYmV0aWM=', '2024-04-21 20:28:19'),
(10, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-21 20:36:32'),
(11, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-22 09:08:06'),
(12, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-22 09:08:50'),
(13, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-22 09:09:44'),
(14, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-22 09:10:08'),
(15, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-22 09:11:06'),
(16, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 13:52:29'),
(17, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 13:52:44'),
(18, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 13:52:45'),
(19, 'MQ==', 'MTI=', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'Tm90IERpYWJldGlj', '2024-04-27 13:52:50'),
(20, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 13:55:12'),
(21, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 13:55:42'),
(22, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:00:31'),
(23, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:06:41'),
(24, 'MQ==', 'MTIw', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:06:48'),
(25, 'MQ==', 'MTIw', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:06:50'),
(26, 'MQ==', 'MTIw', 'NTA=', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:06:53'),
(27, 'MQ==', 'MTIw', 'NTA=', 'NjA=', 'MjA=', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-27 14:06:55'),
(28, 'MQ==', 'MTI=', 'NTA=', 'NjA=', 'MjA=', 'NTA=', 'MzU=', 'Tm90IERpYWJldGlj', '2024-04-27 14:06:58'),
(29, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-28 19:37:42'),
(30, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 11:26:32'),
(31, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 11:27:36'),
(32, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 19:00:45'),
(33, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 19:22:48'),
(34, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 19:35:23'),
(35, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 19:41:54'),
(36, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 20:27:09'),
(37, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 20:40:53'),
(38, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 20:48:59'),
(39, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 21:10:30'),
(40, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 21:26:50'),
(41, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 23:14:43'),
(42, 'Mg==', 'MTIw', 'NzA=', 'MzU=', 'ODA=', 'MzMuNg==', 'NTA=', 'Tm90IERpYWJldGlj', '2024-04-29 23:15:42'),
(43, 'MQ==', 'MTIwMA==', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'RGlhYmV0aWM=', '2024-04-29 23:44:09'),
(44, 'MQ==', 'MTI=', 'NTAw', 'NjA=', 'MjAw', 'NTA=', 'MzU=', 'Tm90IERpYWJldGlj', '2024-04-29 23:44:16'),
(45, 'Mg==', 'MTIwMA==', 'MjAw', 'NTA=', 'MjEw', 'Mjg=', 'MjQ=', 'RGlhYmV0aWM=', '2024-04-30 00:24:23'),
(46, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:08:47'),
(47, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:10:54'),
(48, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:18:22'),
(49, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:39:08'),
(50, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:42:21'),
(51, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 09:46:17'),
(52, 'Mg==', 'MTIw', 'ODA=', 'MzM=', 'MTUw', 'MjQuNQ==', 'NDU=', 'Tm90IERpYWJldGlj', '2024-05-01 10:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `contact_number`) VALUES
(2, 'dGVzdEBnbWFpbC5jb20=', 'scrypt:32768:8:1$fl2ig6DVOzeNcyem$3152000a997b451ce6fb1e810481d978cbece43e2e7a1d8b1284015723b499f316e4cff45fae1eb7d693a49b19e9c4c86c201dce451df7e49470b1f634f3719c', 'test1234', '0714578123'),
(3, 'cGVwQGdhbWlsLmNvbQ==', 'scrypt:32768:8:1$vHYePJs1VKGTXfrw$5d6f25e2be6b92f71d533b30cb120573934077ca7a70d1ce9918a9c268d6670d26099733a89677b7d19ecdca1880a687d31135e2aa1d7bc0920f095acfaef292', 'pepe', '0175423147'),
(7, 'bmV3dXNlckBleGFtcGxlLmNvbQ==', 'scrypt:32768:8:1$30WSgqx4TYTzSpwX$2ee8d59d4825b183964a6ffd0ef56b41e50a8f1d6224d5c4e490042c333d0cda5009fb9ef11a415be36a14ec534cf6f6cdff45fde75a69e649aea47cf4df94b6', 'New User', '1234567890'),
(8, 'dGVzdDFAZ21haWwuY29t', 'scrypt:32768:8:1$Gz9Zlxl6a8VdvORu$4635fcebd447dc087b500c14c443a8c3fca6776598ac29cca833dc5aa58e12a1e8400429d7d20cba093f16eda3441683d922327474895bf8dbe22dec1020ba15', 'G.K.R.J.De Silva', '0778321153'),
(9, 'cmFqaXRoYUB5bWFpbC5jb20=', 'scrypt:32768:8:1$z1ZJo5qMHc3sFpbP$4594c615946ae3239e2aef2fd163a2d4bee84cae94555944260c99731d9ff3c0872c1dfa6a0faec73c475b416c24b4ce8e4a39bc7c094b071e6016da7e430639', 'rajitha', '0714562153'),
(11, 'bmV3dXNlcjAxQGV4YW1wbGUuY29t', 'scrypt:32768:8:1$SJ7dszu7UdN2SiKr$4d29464b9d453468470ccc0d79ca6b049214de90848e783f7244c56432f45e25b99aef043effb7361225bbdfee43f746b17796c6f94f5a1ee70eb9ed96931395', 'New User', '1234567890');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
