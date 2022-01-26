-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2021 at 05:07 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_now`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsitek`
--

CREATE TABLE `arsitek` (
  `id_arsitek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `alamat` text NOT NULL,
  `dokumen` varchar(255) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `imb`
--

CREATE TABLE `imb` (
  `id_imb` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `dokumen` varchar(255) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `komen`
--

CREATE TABLE `komen` (
  `id_komen` int(11) NOT NULL,
  `id_reply_komen` int(11) DEFAULT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `komen` text NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `nomor_transaksi` bigint(20) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `nomor_pembayaran` varchar(50) NOT NULL,
  `total_dibayar` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user_from` int(11) NOT NULL,
  `id_user_to` int(11) NOT NULL,
  `tipe` tinyint(1) NOT NULL,
  `pesan` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `komen` varchar(250) NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diperbaharui_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `level`, `nama_lengkap`, `telepon`, `foto`, `status`, `dibuat_pada`, `diperbaharui_pada`) VALUES
(1, 'admin@gmail.com', '5c90b96a75d4f9d5a1cfaa6f532afdc8', 2, 'Super Admin', '085156055277', NULL, 1, '2021-11-19 10:02:06', '2021-11-19 10:04:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsitek`
--
ALTER TABLE `arsitek`
  ADD PRIMARY KEY (`id_arsitek`),
  ADD UNIQUE KEY `id_user_2` (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `imb`
--
ALTER TABLE `imb`
  ADD PRIMARY KEY (`id_imb`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `komen`
--
ALTER TABLE `komen`
  ADD PRIMARY KEY (`id_komen`),
  ADD KEY `id_reply_komen` (`id_reply_komen`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `nomor_transaksi` (`nomor_transaksi`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_user_from` (`id_user_from`),
  ADD KEY `id_user_to` (`id_user_to`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telepon` (`telepon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsitek`
--
ALTER TABLE `arsitek`
  MODIFY `id_arsitek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `imb`
--
ALTER TABLE `imb`
  MODIFY `id_imb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `komen`
--
ALTER TABLE `komen`
  MODIFY `id_komen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsitek`
--
ALTER TABLE `arsitek`
  ADD CONSTRAINT `arsitek_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imb`
--
ALTER TABLE `imb`
  ADD CONSTRAINT `imb_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komen`
--
ALTER TABLE `komen`
  ADD CONSTRAINT `komen_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komen_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE;

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`id_user_from`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`id_user_to`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
