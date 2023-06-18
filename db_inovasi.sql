-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2023 pada 13.25
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inovasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bentuk_inovasi`
--

CREATE TABLE `bentuk_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bentuk_inovasi`
--

INSERT INTO `bentuk_inovasi` (`id`, `nama`) VALUES
(1, 'inovasi daerah lainya sesuai dengan urusan pemerintahan yang menjadi kewenangan daerah'),
(2, 'Inovasi pelayanan Publik'),
(3, 'Inovasi tata kelola Pemerintahan Daerah'),
(4, 'Inovasi bertema teknologi lainya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `docs`
--

CREATE TABLE `docs` (
  `id` int(11) NOT NULL,
  `no_dokumentasi` varchar(255) DEFAULT NULL,
  `url_dokumen` varchar(255) DEFAULT NULL,
  `jenis_docs` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `docs`
--

INSERT INTO `docs` (`id`, `no_dokumentasi`, `url_dokumen`, `jenis_docs`, `createdAt`, `updatedAt`) VALUES
(34, '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'files/1686412588506--pemrograman-dasar.pdf', 'surat', '2023-06-10 15:57:16', '2023-06-10 15:57:16'),
(35, '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'files/1686412590485--826-Article Text-1123-1-10-20200513.pdf', 'proposal', '2023-06-10 15:57:16', '2023-06-10 15:57:16'),
(36, '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'files/1686412591579--IMG-20230610-WA0001.jpg', 'foto dokumentasi', '2023-06-10 15:57:16', '2023-06-10 15:57:16'),
(37, '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'files/1686412591862--IMG-20230608-WA0017.jpg', 'foto cover', '2023-06-10 15:57:16', '2023-06-10 15:57:16'),
(38, '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'files/1686412592289--VID_20230607_113230.mp4', 'vidio dokumentasi', '2023-06-10 15:57:16', '2023-06-10 15:57:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `edited_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `judul`, `tanggal`, `poster`, `deskripsi`, `start`, `end`, `create_by`, `edited_by`) VALUES
(8, 'FIFA Match Day', '0/5/2023', 'files/1687086428035--Para-pemain-Timnas-Indonesia-vs-Argentina-agenda-FIFA-Matchday-2023.jpg', '<p>	Saksikan FIFA Match DAy Indonesia Melawan Argentina yang akan diselengarakan di Stadion Glora Bung Karno Pada tanggal 19 Juni 2023.</p><p>daftar harga tiket sebagai berikut :</p><ul><li>1. Set 1 350k</li><li>2. Set 2 650k</li><li>3. Set 3 850k</li><li>4. Set 4 1050k</li><li>5. Set 5 2350k</li></ul><p><br></p><p>Demikian harga tiket FIFA Matchday  ,  untuk penukaran tiket akan dilaksanakan dihari pertandingan 3 jam sebelum kick of</p><p>untuk pembelian tiket bisa klik link berikut: </p><p><a href=\"https://ticket.com/fifamatchday\" rel=\"noopener noreferrer\" target=\"_blank\">https://ticket.com/fifamatchday</a></p>', '2023-06-19', '2023-06-19', 'admin@gmail.com', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inisiator_inovasi`
--

CREATE TABLE `inisiator_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inisiator_inovasi`
--

INSERT INTO `inisiator_inovasi` (`id`, `nama`) VALUES
(1, 'Kepala Daerah'),
(2, 'Anggota DPRD'),
(3, 'Perangkat Daerah'),
(4, 'ASN'),
(5, 'Masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `innovations`
--

CREATE TABLE `innovations` (
  `id` int(11) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `nama_inovasi` varchar(255) DEFAULT NULL,
  `inovator` varchar(255) DEFAULT NULL,
  `nama_perangkat_daerah` varchar(255) DEFAULT NULL,
  `tahapan` varchar(255) DEFAULT NULL,
  `inisiator` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `bentuk` varchar(255) DEFAULT NULL,
  `inovasi_thdp_covid` varchar(255) DEFAULT NULL,
  `jenis_urusan_inovasi` varchar(255) DEFAULT NULL,
  `tema` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `no_dokumentasi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `acc` varchar(255) DEFAULT NULL,
  `act_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `innovations`
--

INSERT INTO `innovations` (`id`, `email_user`, `nama_inovasi`, `inovator`, `nama_perangkat_daerah`, `tahapan`, `inisiator`, `jenis`, `bentuk`, `inovasi_thdp_covid`, `jenis_urusan_inovasi`, `tema`, `tanggal`, `no_dokumentasi`, `keterangan`, `acc`, `act_by`, `createdAt`, `updatedAt`) VALUES
(16, 'mhusendev@gmail.com', 'design logo', 'mhusen', 'kabupaten', 'inisiatif', 'Perangkat Daerah', 'digital', 'Inovasi pelayanan Publik', 'non covid', 'pendidikan', 'penanganan tata kelola smart city', '6/5/2023', '6d7c4e10-f7c2-4329-b1fe-bde8fe35228a', 'membuat design untuk ulang tahun kabupaten bekasi, tema design harus menggunakan bahan formal', 'sudah', 'admin@gmail.com', '2023-06-10 15:57:16', '2023-06-10 15:58:12'),
(17, 'awangdidit123@gmail.com', 'Pendataan warga menggunakan QrCode', 'Awang', 'Balitbangda', 'inisiatif', 'Perangkat Daerah', 'digital', 'Inovasi pelayanan Publik', 'non covid', 'pendidikan', 'penanganan tata kelola smart city', '6/5/2023', '21887e66-8605-4a28-942c-e5a317441e5b', 'Test', '0', NULL, '2023-06-10 16:18:50', '2023-06-10 16:18:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inovasi_covid`
--

CREATE TABLE `inovasi_covid` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inovasi_covid`
--

INSERT INTO `inovasi_covid` (`id`, `nama`) VALUES
(1, 'non covid'),
(2, 'covid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_inovasi`
--

CREATE TABLE `jenis_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_inovasi`
--

INSERT INTO `jenis_inovasi` (`id`, `nama`) VALUES
(1, 'digital'),
(2, 'non digital');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_urusan_inovasi`
--

CREATE TABLE `jenis_urusan_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_urusan_inovasi`
--

INSERT INTO `jenis_urusan_inovasi` (`id`, `nama`) VALUES
(1, 'pendidikan'),
(2, 'kesehatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230520081248-create-users.js'),
('20230520133620-create-docs.js'),
('20230520133744-create-innovations.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahapan_inovasi`
--

CREATE TABLE `tahapan_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tahapan_inovasi`
--

INSERT INTO `tahapan_inovasi` (`id`, `nama`) VALUES
(1, 'inisiatif'),
(2, 'uji coba'),
(3, 'penerapan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tema_inovasi`
--

CREATE TABLE `tema_inovasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tema_inovasi`
--

INSERT INTO `tema_inovasi` (`id`, `nama`) VALUES
(1, 'panggulanang covid19'),
(2, 'penanganan tata kelola smart city');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `instansi`, `level`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin@gmail.com', '$2b$10$2Wg/hOmDzuloAol9TTIaAucsf6CXgnz9MSH8nA.Mk0hEC0b7WmJ8.', '021888888', 'all', 1, '2023-05-21 12:23:50', '2023-05-21 12:23:50'),
(6, 'Muhammad Husen', 'mhusendev@gmail.com', '$2b$10$LuWPU9bocX/P7z41ANLbju3sLycI9XmXd3zvSVCv3lo5sI.uWumXa', '+6289528995437', 'kecamatan', 0, '2023-05-24 14:10:09', '2023-05-24 14:10:09'),
(10, 'awang', 'awangdidit123@gmail.com', '$2b$10$iX80.D8/I/8Q/XgpadLzJOiO6b70h7i/y4UylSFOyd/3Z27EQkQNi', '081214775272', 'balitbang', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bentuk_inovasi`
--
ALTER TABLE `bentuk_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inisiator_inovasi`
--
ALTER TABLE `inisiator_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `innovations`
--
ALTER TABLE `innovations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inovasi_covid`
--
ALTER TABLE `inovasi_covid`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_inovasi`
--
ALTER TABLE `jenis_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_urusan_inovasi`
--
ALTER TABLE `jenis_urusan_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `tahapan_inovasi`
--
ALTER TABLE `tahapan_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tema_inovasi`
--
ALTER TABLE `tema_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bentuk_inovasi`
--
ALTER TABLE `bentuk_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `inisiator_inovasi`
--
ALTER TABLE `inisiator_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `innovations`
--
ALTER TABLE `innovations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `inovasi_covid`
--
ALTER TABLE `inovasi_covid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_inovasi`
--
ALTER TABLE `jenis_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_urusan_inovasi`
--
ALTER TABLE `jenis_urusan_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tahapan_inovasi`
--
ALTER TABLE `tahapan_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tema_inovasi`
--
ALTER TABLE `tema_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
