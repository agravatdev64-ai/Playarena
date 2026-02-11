-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2026 at 08:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `con`
--

CREATE TABLE `con` (
  `id` int(11) NOT NULL,
  `nm` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f1`
--

CREATE TABLE `f1` (
  `id` int(11) NOT NULL,
  `bnm` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `st` varchar(100) DEFAULT NULL,
  `et` varchar(100) DEFAULT NULL,
  `hu` varbinary(100) DEFAULT NULL,
  `snm` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `f1`
--

INSERT INTO `f1` (`id`, `bnm`, `date`, `st`, `et`, `hu`, `snm`, `price`) VALUES
(2, 'Dev Agravat', '2026-02-02', '13:00', '15:00', 0x32, 'Carrom', '₹300'),
(3, 'Dev Agravat', '2026-02-03', '13:00', '15:00', 0x32, 'Carrom', '₹300'),
(4, 'Agravat Dev ', '2026-10-02', '20:00', '22:00', 0x32, 'Volleyball', '₹800');

-- --------------------------------------------------------

--
-- Table structure for table `fd`
--

CREATE TABLE `fd` (
  `id` int(11) NOT NULL,
  `nm` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ros` varchar(100) DEFAULT NULL,
  `com` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `name`, `price`, `description`, `img`) VALUES
(1, 'Box Cricket', '₹1600', 'Fast-paced Box Cricket on a premium enclosed turf. Perfect for quick matches and team fun.', 'img/1769777254639_img1.jpeg'),
(2, 'Pickleball', '₹900', 'Play fast and fun Pickleball on a smooth professional court. Perfect for all ages and quick matches.', 'img/1769777291077_img4.jpeg'),
(3, 'Volleyball', '₹800', 'Enjoy energetic Volleyball matches on a well-maintained court. Perfect for teams, fitness, and fun play.', 'img/1769777319626_img6.jpg'),
(4, 'Carrom', '₹300', 'Enjoy classic Carrom on a smooth professional board. Perfect for indoor fun and friendly matches.', 'img/1769777345883_img5.jpg'),
(5, 'Table Tennis', '₹700', 'Play fast-paced Table Tennis on a professional indoor table. Perfect for practice, competition, and fun games.', 'img/1769777400627_img2.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `con`
--
ALTER TABLE `con`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f1`
--
ALTER TABLE `f1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd`
--
ALTER TABLE `fd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `con`
--
ALTER TABLE `con`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `f1`
--
ALTER TABLE `f1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fd`
--
ALTER TABLE `fd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
