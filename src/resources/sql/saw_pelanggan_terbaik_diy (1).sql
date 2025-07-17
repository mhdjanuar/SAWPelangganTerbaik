-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2025 at 08:16 AM
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
-- Database: `saw_pelanggan_terbaik_diy`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_sub_kreteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id`, `id_pelanggan`, `id_sub_kreteria`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 1, 11),
(4, 1, 16),
(5, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `nama`, `type`, `bobot`) VALUES
(1, 'Jumlah Transaksi', 'benefit', 25.00),
(2, 'Total Pembelian', 'benefit', 25.00),
(3, 'Frekuensi Kunjungan', 'benefit', 20.00),
(4, 'Loyalitas', 'benefit', 20.00),
(5, 'Jumlah Komplain', 'cost', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `telepon`, `alamat`, `email`) VALUES
(1, 'Andi Wijaya', '081234567891', 'Jl. Merdeka No. 1', 'andi@example.com'),
(2, 'Siti Lestari', '082234567892', 'Jl. Sudirman No. 2', 'siti@example.com'),
(3, 'Budi Santoso', '083234567893', 'Jl. Diponegoro No. 3', 'budi@example.com'),
(4, 'Dewi Ayu', '084234567894', 'Jl. Gatot Subroto No. 4', 'dewi@example.com'),
(5, 'Rizky Ramadhan', '085234567895', 'Jl. Soekarno-Hatta No. 5', 'rizky@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

CREATE TABLE `sub_criteria` (
  `id` int(11) NOT NULL,
  `id_kreteria` int(11) NOT NULL,
  `jumlah_bobot` decimal(5,2) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`id`, `id_kreteria`, `jumlah_bobot`, `deskripsi`) VALUES
(1, 1, 5.00, '≥ 30 transaksi'),
(2, 1, 4.00, '20–29 transaksi'),
(3, 1, 3.00, '10–19 transaksi'),
(4, 1, 2.00, '5–9 transaksi'),
(5, 1, 1.00, '< 5 transaksi'),
(6, 2, 5.00, '≥ Rp 5.000.000'),
(7, 2, 4.00, 'Rp 3.000.000 – 4.999.999'),
(8, 2, 3.00, 'Rp 1.500.000 – 2.999.999'),
(9, 2, 2.00, 'Rp 500.000 – 1.499.999'),
(10, 2, 1.00, '< Rp 500.000'),
(11, 3, 5.00, '≥ 8 kali'),
(12, 3, 4.00, '6–7 kali'),
(13, 3, 3.00, '4–5 kali'),
(14, 3, 2.00, '2–3 kali'),
(15, 3, 1.00, '≤ 1 kali'),
(16, 4, 5.00, '≥ 3 tahun'),
(17, 4, 4.00, '2–3 tahun'),
(18, 4, 3.00, '1–2 tahun'),
(19, 4, 2.00, '6–12 bulan'),
(20, 4, 1.00, '< 6 bulan'),
(21, 5, 5.00, '0 kali'),
(22, 5, 4.00, '1 kali'),
(23, 5, 3.00, '2–3 kali'),
(24, 5, 2.00, '4–5 kali'),
(25, 5, 1.00, '> 5 kali');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `alamat`, `username`, `password`, `email`) VALUES
(1, 'Administrator', 'Jl. Pusat MR.DIY No.1', 'admin', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_sub_kreteria` (`id_sub_kreteria`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kreteria` (`id_kreteria`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD CONSTRAINT `alternatif_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alternatif_ibfk_2` FOREIGN KEY (`id_sub_kreteria`) REFERENCES `sub_criteria` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD CONSTRAINT `sub_criteria_ibfk_1` FOREIGN KEY (`id_kreteria`) REFERENCES `criteria` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
