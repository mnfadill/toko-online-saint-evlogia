-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2023 pada 22.19
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `id_invoice` varchar(30) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`) VALUES
(27, '11', 'INV-5333227', 4, 'Baju Kemeja Wanita', 1, 150000),
(28, '11', 'INV-65984757', 6, 'T-shirt kupu kupu', 1, 90000),
(29, '11', 'INV-76314079', 6, 'T-shirt kupu kupu', 1, 90000),
(30, '11', 'INV-60204207', 6, 'T-shirt kupu kupu', 1, 90000),
(31, '11', 'INV-10477120', 6, 'T-shirt kupu kupu', 1, 90000),
(32, '11', 'INV-90212736', 2, 'Sepatu New Era', 1, 300000),
(33, '11', 'INV-68943519', 11, 'blessing in every curse', 1, 95000),
(34, '11', 'INV-68943519', 6, 'T-shirt kupu kupu', 1, 90000);

--
-- Trigger `cart`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
	UPDATE product SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `ukuran` varchar(10) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `ukuran`, `harga`, `stok`, `gambar`) VALUES
(6, 'T-shirt kupu kupu', 'Warna Cream', 'T-Shirt', NULL, 90000, 7, 'Cream_Depan_2.jpg'),
(11, 'blessing in every curse', 'Warna putih', 'T-Shirt', 'M/L/XL', 95000, 11, '9.png'),
(12, 'Blessing in every curse', 'Warna Hitam', 'T-Shirt', 'M/L/XL', 85000, 12, '12.png'),
(13, 'Lonely But Fabulous', 'Warna Cream', 'T-Shirt', 'M/L/XL', 120000, 12, 'Cream_Belakang_1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `order_id` char(30) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `city` varchar(255) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ekspedisi` varchar(100) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `payment_limit` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-10477120', '11', 'fadil', 'fadil@gmail.com', '413', '3123123', 'Cimahi', '123123123', 'Direct Bank Transfer', 'SICEPAT', '175346685002', '2023-08-14 14:14:08', '2023-08-15 14:14:08', '0', NULL),
('INV-5333227', '11', 'fadil', 'fadil@gmail.com', 'subang', '08948123128', 'Subang', '412312', 'Direct Bank Transfer', 'J&T Express', '7242763693', '2023-06-28 01:12:35', '2023-06-29 01:12:35', '1', 'contoh1.jpg'),
('INV-60204207', '11', 'fadil', 'fadil@gmail.com', 'subang', '08953123123', 'Bandung', '1231234', 'Direct Bank Transfer', 'J&T Express', '881433355993', '2023-07-31 19:54:33', '2023-08-01 19:54:33', '1', 'depan-untuk-kaos-warna-Hitam.jpg'),
('INV-68943519', '11', 'fadil', 'fadil@gmail.com', 'pagadeng', '08921313112', 'Malinau', '31231', 'Direct Bank Transfer', 'GRAB-SEND', '782081781929', '2023-08-21 23:44:29', '2023-08-22 23:44:29', '0', NULL),
('INV-76314079', '11', 'fadil', 'fadil@gmail.com', 'subang', '089542394513', 'Subang', '41213', 'Direct Bank Transfer', 'J&T Express', '881785899750', '2023-07-31 19:00:15', '2023-08-01 19:00:15', '1', 'WhatsApp_Image_2023-06-23_at_23_24_44.jpg'),
('INV-90212736', '11', 'fadil', 'fadil@gmail.com', 'subang', '0898674634', 'Gunung Kidul', '41232', 'Direct Bank Transfer', 'J&T Express', '1018249866446', '2023-08-21 19:35:26', '2023-08-22 19:35:26', '1', 'WhatsApp_Image_2023-06-23_at_23_24_441.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Helpdesk Saint Evlogia', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(11, 'fadil', 'fadil@gmail.com', 'd0503276f86a627d6c29bc963106570e', '2', 'user.png'),
(12, 'joni', 'joni@gmail.com', '1281d0ac7a74eb91550ff52a02862cda', '2', 'user.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
