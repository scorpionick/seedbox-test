-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2020 at 09:18 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SeedBoxServer`
--

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `domain`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Server 0', '192.168.100.222', 'monserdsadsate86', '$2y$10$gu.O.JLF596NtA.mfZD.heGOlQ8bHjSkoN3mR2.PueRjANoLa2i9O', 0, '2020-03-29 23:46:04', '2020-04-01 00:41:07'),
(2, 'Server 1', '192.168.32.31', 'rachel.legros', '$2y$10$xUb3YBDjQPnwB/nriuRmo.ff.OUjr0G/YRRCtx8Zlfl4TIrCEdNG2', 1, '2020-03-29 23:46:04', '2020-04-01 00:45:44'),
(3, 'Server 2', '192.168.245.9', 'celia46', '$2y$10$.kTaiMA3nSRybx3f3Pq6Hu6nM2PFdqSO9bEy7kX5ZtFB8agf1fCc.', 0, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(4, 'Server 3', '192.168.139.14', 'lang.camylle', '$2y$10$snydhez253e7oYYk3DE9ueB2rwcve/JisIPrMSBhBNklW4b3uxEhS', 1, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(5, 'Server 4', '192.168.29.106', 'mann.genoveva', '$2y$10$p2Ml0CvyYhkodOL/vLTjrOikbeakhpBpY6aGeevs.Zwph9Xt5y5jO', 0, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(6, 'Server 5', '192.168.46.85', 'lueilwitz.jonathon', '$2y$10$oxJMPYYrVTWwpd71EFzhW.RrnzTfotAE0mr6ZXsgjKAvjliuidcDS', 1, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(7, 'Server 6', '192.168.49.214', 'schuster.forrest', '$2y$10$YzRxsZjnM3V2mzk3lpg9Y.NiWyANEsCbifxjm8csqj99KQfhytMWy', 1, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(8, 'Server 7', '10.186.185.3', 'raina00', '$2y$10$wWjcbTwnyRoPnVvK6/uIM.7nlVkEgFIEPMMtQSi11p5PfwFsVgqqC', 1, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(9, 'Server 8', '192.168.223.199', 'ckertzmann', '$2y$10$bdZZ4rlKp.ClkBlzGMEY1u.ZO9MADM920jQ41kmN9ViDIgNpd/gGm', 0, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(10, 'Server 9', '192.168.180.60', 'jan43', '$2y$10$KzLTWotV0yT0LUzqM1f2jOjtIIFa2lN/0HH7muiS9SqKRHmG/EK.K', 1, '2020-03-29 23:46:04', '2020-03-29 23:46:04'),
(11, 'Server 10', '10.39.34.50', 'lew59', '$2y$10$23jhB/R3SuLgNHKkU2w2LOMmc/bkdIBscmYOsjapPUhGliEuvCYNS', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(12, 'Server 11', '10.224.130.198', 'elijah65', '$2y$10$7R7faOevA.Rgnw63X2lp.eF6.HfH8RHGqFUYVzRSBPBplwXhcsYW.', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(13, 'Server 12', '10.77.5.72', 'gfisher', '$2y$10$CfuFruPDs20zQqLvq.n6POvYCcWkDm6ZHhQh0RmEtfY9jBl5/GMru', 0, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(14, 'Server 13', '10.185.180.168', 'awill', '$2y$10$WEc.eq69tB2hw2769CIRQe041VG5HNHzhqfUv9lJK49sriTzVxl0q', 0, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(15, 'Server 14', '192.168.122.29', 'ryley79', '$2y$10$uPbzMjcx0p7SDZB878aLzeThT9BtAUvGqeY3iePOKF/te7f5dqCle', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(16, 'Server 15', '10.135.145.179', 'price.malachi', '$2y$10$LI2TZSsVvO4aQkO7wr3ICui9YprcnhyAbnh01oE3rqIcc.DOuunde', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(17, 'Server 16', '10.37.216.101', 'schuster.rashad', '$2y$10$TV5vsnLYAuznOFCDsH08/eFykWMy4nYWknRWqtPh.zCt05dwa9nri', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(18, 'Server 17', '192.168.222.115', 'leuschke.michel', '$2y$10$kdKF1pWy4oLFXkGEHcXAVOhlIrS1IN/8wStRZ39MvvI44XC2HJXDy', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(19, 'Server 18', '192.168.86.222', 'zemlak.darrin', '$2y$10$9Fy5QCYchgdda/bWBlHEru.3G0qg3vbpKWQIIVXfvcl8TU0QF336y', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(20, 'Server 19', '10.187.155.147', 'balistreri.victoria', '$2y$10$Ob6M0rt3kmZuOf938nCTiOk8pV4dpkUKaMonsCEXszkK4vADZ.guu', 0, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(21, 'Server 20', '10.82.195.30', 'schuster.robb', '$2y$10$xwRNpLI44zaEbuAgdUhqluLD.t5nfbwjCsjHE/1jxP7mOBK6L8LTq', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(22, 'Server 21', '192.168.22.56', 'deborah.stark', '$2y$10$2EiqDQNcWKWKnDwAFI.p5OnvIw5yElm9trUmhBwivMv9kXwCbeu86', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(23, 'Server 22', '192.168.64.250', 'bins.jason', '$2y$10$CvFbaXKhcpL6Gla4HEGPNOI6QoFL9nJkafTEMIwCsWMwD2lX/BLA2', 1, '2020-03-29 23:46:05', '2020-03-29 23:46:05'),
(24, 'Server 23', '10.69.142.96', 'nettie.kozey', '$2y$10$HB51cOVWFrhWuw28IQ9HnOgX/VEhhU49Dt.JnM6RaljCmJ3OtB/Ye', 0, '2020-03-29 23:46:06', '2020-03-29 23:46:06'),
(25, 'Server 24', '192.168.153.226', 'jessyca.little', '$2y$10$/Rd9MqAY49dA14ST0LkNkOfjYAgfrLgPLda6Ul5R6BEbzEIPHowUa', 0, '2020-03-29 23:46:06', '2020-03-29 23:46:06'),
(26, 'Server 25', '192.168.250.21', 'ada70', '$2y$10$XQxSmIkI/ttrz3i1C7OxFelXP0A1jeIg6AFgQ2Ochi70SCif/lfby', 0, '2020-03-29 23:46:06', '2020-03-29 23:46:06'),
(27, 'Test Post', '11.111.11.111', 'blabla', '$2y$10$14b20ZgMVUWR6o94t8U6cua3qgzQ2fQGtEhd6kaQjt/tNcLOv37Di', 1, '2020-03-31 01:19:30', '2020-03-31 01:19:30'),
(28, 'Serveur Test Post 2', '21.222.12.41', 'Test Test', '$2y$10$MW29lWd/kkK9a8jdRpNUH.ZZ32iMtXOhH2IWSOS4RKnZD/07mhMlm', 1, '2020-04-01 00:45:04', '2020-04-01 00:45:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
