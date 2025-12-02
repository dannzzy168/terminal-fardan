-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2025 at 04:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `terminal`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_bus`
--

CREATE TABLE `daftar_bus` (
  `id_bus` int(11) NOT NULL,
  `nama_bus` varchar(50) DEFAULT NULL,
  `kelas_bus` varchar(20) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_bus`
--

INSERT INTO `daftar_bus` (`id_bus`, `nama_bus`, `kelas_bus`, `kapasitas`) VALUES
(1, 'TransPrima', 'AC', 45),
(2, 'MegaTrans', 'AC', 50),
(3, 'SariJaya', 'Non-AC', 35),
(4, 'Nusantara', 'AC', 40),
(5, 'BinaRahayu', 'AC', 30),
(6, 'PutraSelatan', 'Non-AC', 28),
(7, 'LintasUtama', 'AC', 60),
(8, 'Krida', 'AC', 36),
(9, 'Harmoni', 'Non-AC', 20),
(10, 'PrimaJaya', 'AC', 55);

-- --------------------------------------------------------

--
-- Table structure for table `info_bus`
--

CREATE TABLE `info_bus` (
  `id_info` int(11) NOT NULL,
  `id_bus` int(11) DEFAULT NULL,
  `tujuan` varchar(50) DEFAULT NULL,
  `jadwal` time DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info_bus`
--

INSERT INTO `info_bus` (`id_info`, `id_bus`, `tujuan`, `jadwal`, `harga`) VALUES
(1, 1, 'Jakarta', '18:00:00', 80000),
(2, 2, 'Jakarta', '19:00:00', 120000),
(3, 3, 'Cirebon', '07:30:00', 45000),
(4, 4, 'Jakarta', '17:00:00', 90000),
(5, 5, 'Jakarta', '16:30:00', 48000),
(6, 6, 'Tasikmalaya', '09:00:00', 40000),
(7, 7, 'Jakarta', '20:00:00', 150000),
(8, 8, 'Jakarta', '15:00:00', 85000),
(9, 9, 'Bekasi', '10:00:00', 30000),
(10, 10, 'Jakarta', '13:00:00', 110000);

-- --------------------------------------------------------

--
-- Table structure for table `keberangkatan`
--

CREATE TABLE `keberangkatan` (
  `id_berangkat` int(11) NOT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `stasiun_keberangkatan` varchar(50) DEFAULT NULL,
  `kedatangan` varchar(50) DEFAULT NULL,
  `boarding` time DEFAULT NULL,
  `sampai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keberangkatan`
--

INSERT INTO `keberangkatan` (`id_berangkat`, `nama_depan`, `nama_belakang`, `stasiun_keberangkatan`, `kedatangan`, `boarding`, `sampai`) VALUES
(1, 'Maria', 'Rizma', 'Bandung', 'Jakarta', '18:30:00', '21:20:00'),
(2, 'Defanty', 'Veninda', 'Cimahi', 'Jakarta', '18:30:00', '21:20:00'),
(4, 'Yunita', 'Priatna', 'Purwakarta', 'Jakarta', '18:30:00', '21:20:00'),
(5, 'Hanifa', 'Supartiwi', 'Bekasi', 'Jakarta', '18:30:00', '21:20:00'),
(6, 'Sri', 'Ayu', 'Bandung', 'Jakarta', '18:30:00', '21:20:00'),
(7, 'Galuh', 'Suparman', 'Cimahi', 'Jakarta Pusat', '19:00:00', '22:00:00'),
(8, 'Dewi', 'Lestari', 'Bandung', 'Jakarta', '18:30:00', '21:20:00'),
(9, 'Fajar', 'Pratama', 'Cimahi', 'Jakarta', '18:30:00', '21:20:00'),
(10, 'Rina', 'Maheswari', 'Bekasi', 'Jakarta', '18:30:00', '21:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `penumpang`
--

CREATE TABLE `penumpang` (
  `id` int(11) NOT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `stasiun_keberangkatan` varchar(50) DEFAULT NULL,
  `kedatangan` varchar(50) DEFAULT NULL,
  `boarding` time DEFAULT NULL,
  `sampai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `penumpang`
--
DELIMITER $$
CREATE TRIGGER `sinkron_keberangkatan_lengkap` AFTER UPDATE ON `penumpang` FOR EACH ROW BEGIN
    UPDATE keberangkatan
    SET
        stasiun_keberangkatan = NEW.stasiun_keberangkatan,
        kedatangan = NEW.kedatangan,
        boarding = NEW.boarding,
        sampai = NEW.sampai
    WHERE
        nama_depan = NEW.nama_depan
        AND nama_belakang = NEW.nama_belakang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_keberangkatan_otomatis` AFTER UPDATE ON `penumpang` FOR EACH ROW BEGIN
    UPDATE keberangkatan
    SET stasiun_keberangkatan = NEW.stasiun_keberangkatan
    WHERE nama_depan = NEW.nama_depan
    AND nama_belakang = NEW.nama_belakang;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_bus`
--
ALTER TABLE `daftar_bus`
  ADD PRIMARY KEY (`id_bus`);

--
-- Indexes for table `info_bus`
--
ALTER TABLE `info_bus`
  ADD PRIMARY KEY (`id_info`),
  ADD KEY `id_bus` (`id_bus`);

--
-- Indexes for table `keberangkatan`
--
ALTER TABLE `keberangkatan`
  ADD PRIMARY KEY (`id_berangkat`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_bus`
--
ALTER TABLE `daftar_bus`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info_bus`
--
ALTER TABLE `info_bus`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `keberangkatan`
--
ALTER TABLE `keberangkatan`
  MODIFY `id_berangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `info_bus`
--
ALTER TABLE `info_bus`
  ADD CONSTRAINT `info_bus_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `daftar_bus` (`id_bus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
