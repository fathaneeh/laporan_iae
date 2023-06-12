-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 10:49 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laporan_rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `laporan_keuangan`
--

CREATE TABLE `laporan_keuangan` (
  `id_laporan` int(10) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `nama_kendaraan` varchar(50) NOT NULL,
  `harga_satuan` int(10) NOT NULL,
  `potongan_harga` int(10) NOT NULL,
  `nett` bigint(20) NOT NULL,
  `total_pemasukan` bigint(20) NOT NULL,
  `tanggal` int(10) NOT NULL,
  `bulan` int(10) NOT NULL,
  `tahun` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_keuangan`
--

INSERT INTO `laporan_keuangan` (`id_laporan`, `tipe`, `jenis`, `nama_kendaraan`, `harga_satuan`, `potongan_harga`, `nett`, `total_pemasukan`, `tanggal`, `bulan`, `tahun`) VALUES
(1, 'Motor', 'Yamaha', 'Mio', 17000000, 500000, 260000000, 254000000, 23, 5, 2023),
(2, 'Mobil', 'Honda', 'CR-V', 500000000, 100000, 4025000000, 4000000000, 24, 5, 2023),
(3, 'Motor', 'Yamaha', 'NMAX', 32000000, 800000, 31200000, 320000000, 2, 7, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_showroom`
--

CREATE TABLE `laporan_showroom` (
  `id_laporan` int(10) NOT NULL,
  `nama_laporan` varchar(30) NOT NULL,
  `item_sold` int(30) NOT NULL,
  `income` int(20) NOT NULL,
  `total_kas` int(10) NOT NULL,
  `date` int(5) DEFAULT NULL,
  `month` int(5) DEFAULT NULL,
  `year` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_showroom`
--

INSERT INTO `laporan_showroom` (`id_laporan`, `nama_laporan`, `item_sold`, `income`, `total_kas`, `date`, `month`, `year`) VALUES
(1001, 'Laporan Keuangan Bulan Januari', 250, 4000000, 23000000, NULL, NULL, NULL),
(1002, 'Laporan Keuangan Bulan Februar', 180, 1500000, 25000000, NULL, NULL, NULL),
(1003, 'Laporan Keuangan Bulan Maret', 230, 3000000, 28000000, NULL, NULL, NULL),
(1004, 'Laporan Keuangan Bulan April', 100, 5000000, 30000000, NULL, NULL, NULL),
(1005, 'Laporan Keuangan Bulan Mei', 85, 500000, 31000000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAYMENT_TYPE_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(64) NOT NULL,
  `VA` bigint(20) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `TIME` datetime NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `EXPIRE_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAYMENT_ID`, `PAYMENT_TYPE_ID`, `TITLE`, `VA`, `STATUS`, `TIME`, `UPDATE_TIME`, `EXPIRE_TIME`) VALUES
(1, 1, 'Pembayaran Mobil', 3201081278345612, 'W', '2023-05-23 09:15:00', '2023-05-23 09:15:00', '2023-05-23 15:35:00'),
(2, 2, 'Pembayaran Mobil', 3202081226537914, 'S', '2023-05-23 10:30:00', '2023-05-23 10:30:00', '2023-05-23 16:30:00'),
(3, 3, 'Pembayaran Mobil', 3203081263745189, 'C', '2023-05-23 11:45:00', '2023-05-23 11:45:00', '2023-05-23 17:45:00'),
(4, 4, 'Pembayaran Mobil', 3204081297563214, 'W', '2023-05-23 13:00:00', '2023-05-23 13:00:00', '2023-05-23 20:00:00'),
(5, 1, 'Pembayaran Mobil', 3201081288765490, 'W', '2023-05-23 14:15:00', '2023-05-23 14:15:00', '2023-05-23 20:15:00'),
(6, 2, 'Pembayaran Mobil', 3202081234567841, 'S', '2023-05-23 15:30:00', '2023-05-23 15:30:00', '2023-05-23 21:30:00'),
(7, 3, 'Pembayaran Mobil', 3203081259764823, 'C', '2023-05-23 16:45:00', '2023-05-23 16:45:00', '2023-05-23 22:45:00'),
(8, 4, 'Pembayaran Mobil', 3204081268345611, 'W', '2023-05-23 18:00:00', '2023-05-23 18:00:00', '2023-05-23 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `PAYMENT_DETAIL_ID` bigint(20) NOT NULL,
  `PAYMENT_ID` bigint(20) DEFAULT NULL,
  `TRANS_ID` bigint(20) NOT NULL,
  `AMOUNT` bigint(20) NOT NULL,
  `TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_detail`
--

INSERT INTO `payment_detail` (`PAYMENT_DETAIL_ID`, `PAYMENT_ID`, `TRANS_ID`, `AMOUNT`, `TIME`) VALUES
(1, 1, 12345, 200000000, '2023-05-23 09:15:00'),
(2, 2, 67890, 350000000, '2023-05-23 10:30:00'),
(3, 3, 24680, 500000000, '2023-05-23 11:45:00'),
(4, 4, 13579, 750000000, '2023-05-23 13:00:00'),
(5, 5, 98765, 400000000, '2023-05-23 14:15:00'),
(6, 6, 54321, 600000000, '2023-05-23 15:30:00'),
(7, 7, 12121, 700000000, '2023-05-23 16:45:00'),
(8, 8, 51222, 300000000, '2023-05-23 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `PAYMENT_TYPE_ID` bigint(20) NOT NULL,
  `PAYMENT_TYPE` varchar(64) NOT NULL,
  `PAYMENT_TYPE_CODE` varchar(6) NOT NULL,
  `ADMIN_FEE` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`PAYMENT_TYPE_ID`, `PAYMENT_TYPE`, `PAYMENT_TYPE_CODE`, `ADMIN_FEE`) VALUES
(1, 'BRI', '3201', 1000),
(2, 'BNI', '3202', 1000),
(3, 'BCA', '3203', 1000),
(4, 'MANDIRI', '3204', 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAYMENT_ID`),
  ADD KEY `FK_PAYMENT_RELATIONS_PAYMENT_` (`PAYMENT_TYPE_ID`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`PAYMENT_DETAIL_ID`),
  ADD KEY `FK_PAYMENT__RELATIONS_PAYMENT` (`PAYMENT_ID`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`PAYMENT_TYPE_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  MODIFY `id_laporan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_PAYMENT_RELATIONS_PAYMENT_` FOREIGN KEY (`PAYMENT_TYPE_ID`) REFERENCES `payment_type` (`PAYMENT_TYPE_ID`);

--
-- Constraints for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `FK_PAYMENT__RELATIONS_PAYMENT` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `payment` (`PAYMENT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
