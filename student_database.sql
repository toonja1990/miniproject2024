-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 10:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `subject`, `message`, `email`) VALUES
(1, 'Toon', 'ประเมินราคารับจ้างทำเว็บ', 'ต้องการทำเว็บที่มีลูกเล่น โปรดติดต่อกลับ', 'toon@gmail.com'),
(2, 'Toon', 'ทดสอบสั่งของ', 'test', 'phakkhawat@gmail.com'),
(3, 'Toon', 'ทดสอบสั่งของ', 'test', 'phakkhawat@gmail.com'),
(4, 'Phakhawat Sarakit', 'สนใจครับ โปรดติดต่อกลับ', 'สนใจ อยากคุยเพิ่มเติม รบกวนโทรกลับด้วยครับ 0322655778', 'toonja1990@gmail.com'),
(5, 'Toon', 'ทดสอบสั่งของ', 'test', 'phakkhawat@gmail.com'),
(6, 'Phakhawat Sarakit', 'สนใจครับ โปรดติดต่อกลับ', 'สนใจ อยากคุยเพิ่มเติม รบกวนโทรกลับด้วยครับ 0322655778', 'toonja1990@gmail.com'),
(7, 'Toon', 'ทดสอบสั่งของ', 'test', 'phakkhawat@gmail.com'),
(8, 'Phakhawat Sarakit', 'asdsadasd', 'asdsadsaadsadsadsad12134', 'toonja1990@gmail.com'),
(9, 'Phakhawat Sarakit2', 'asdsadasd2', 'asdsadsaadsadsadsad12134', 'toonja1990@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` mediumint(9) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `phone`, `email`) VALUES
(1, 'Katelyn Beck', 23, '092-148-0544', 'mauris.quis@outlook.edu'),
(3, 'Matthew Woodard', 26, '051-432-6639', 'adipiscing.lacus@outlook.edu'),
(5, 'Keiko Hartman', 20, '027-732-8144', 'est@icloud.com'),
(7, 'Oak', 22, '555', 'oak@email.com'),
(8, 'Oak', 22, '555', 'oak@email.com'),
(9, 'Chanakarn Kingkaew', 22, '555', 'oak@gmail.comn'),
(10, 'Toon', 0, '25672016', 'toon@gmail.com'),
(11, 'Toon', 0, '25672016', 'toon@gmail.com'),
(12, 'test', 0, '555', 'toon@hotmail.com'),
(13, 'Phakkhawat', 33, '972364073', 'phakkhawatsar@gosoft.co.th'),
(14, 'John', 11, '12345', 'john@gmail.com'),
(15, 'Gary Rakthai', 30, '-6108', 'gary.rakthai@gmail.com'),
(16, 'tt', 22, '2313123', 'tt@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`) VALUES
(1, 'test@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
