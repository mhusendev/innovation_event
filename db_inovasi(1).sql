-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2023 pada 06.01
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
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `contact`
--

INSERT INTO `contact` (`id`, `telp`, `email`, `alamat`) VALUES
(1, '(021) 88961767', 'suport@rubikda.com', 'Jl. Jendral Ahmad Yani No. 1 Gd Perkantoran Lt Dasar, Bekasi');

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
(12, 'FIFA Matchday INDONESIA VS ARGENTINA', '1 June 2023', 'files/1687114741643--Para-pemain-Timnas-Indonesia-vs-Argentina-agenda-FIFA-Matchday-2023.jpg', '<p>Saksikan FIFA Match DAy Indonesia Melawan Argentina yang akan diselengarakan di Stadion Glora Bung Karno Pada tanggal 19 Juni 2023.</p><p>daftar harga tiket sebagai berikut :</p><ul><li>1. Set 1 350k</li><li>2. Set 2 650k</li><li>3. Set 3 850k</li><li>4. Set 4 1050k</li><li>5. Set 5 2350k</li></ul><p><br></p><p>Demikian harga tiket FIFA Matchday , untuk penukaran tiket akan dilaksanakan dihari pertandingan 3 jam sebelum kick of</p><p>untuk pembelian tiket bisa klik link berikut:</p><p><a href=\"https://ticket.com/fifamatchday\" rel=\"noopener noreferrer\" target=\"_blank\">https://ticket.com/fifamatchday</a></p>', '2023-06-19', '2023-06-19', 'admin@gmail.com', 'admin@gmail.com'),
(13, 'Sakura Matsuri', '19 June 2023', 'files/1687114854830--maxresdefault.jpg', '<p>A <strong>cherry blossom</strong>, also known as a <strong>Japanese cherry</strong> or <strong>sakura</strong>, is a <a href=\"https://en.wikipedia.org/wiki/Flower\" rel=\"noopener noreferrer\" target=\"_blank\">flower</a> of many trees of <a href=\"https://en.wikipedia.org/wiki/Prunus\" rel=\"noopener noreferrer\" target=\"_blank\">genus <em>Prunus</em></a> or <a href=\"https://en.wikipedia.org/wiki/Prunus_subg._Cerasus\" rel=\"noopener noreferrer\" target=\"_blank\"><em>Prunus</em> subgenus. <em>Cerasus</em></a>. Wild <a href=\"https://en.wikipedia.org/wiki/Species\" rel=\"noopener noreferrer\" target=\"_blank\">species</a> of the cherry tree are widely distributed, mainly in the Northern hemisphere.<a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-4\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[4]</sup></a><a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-sakuranokai-5\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[5]</sup></a><a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-6\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[6]</sup></a> They are common in East Asia, including China, Korea and especially in Japan. They generally refer to ornamental cherry trees, and not <a href=\"https://en.wikipedia.org/wiki/Cherry_tree\" rel=\"noopener noreferrer\" target=\"_blank\">cherry trees that produce fruit for eating</a>.<a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-katsuki201514-7\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[7]</sup></a><a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-8\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[8]</sup></a> The cherry blossom is considered the <a href=\"https://en.wikipedia.org/wiki/National_flower\" rel=\"noopener noreferrer\" target=\"_blank\">national flower</a> of Japan.<a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-9\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[9]</sup></a></p><p><strong>In </strong><a href=\"https://en.wikipedia.org/wiki/Europe\" rel=\"noopener noreferrer\" target=\"_blank\">Europe</a>, from the late 19th century to the early 20th century, <a href=\"https://en.wikipedia.org/wiki/Collingwood_Ingram\" rel=\"noopener noreferrer\" target=\"_blank\">Collingwood Ingram</a>, an Englishman, collected and studied Japanese cherry blossoms, and created various ornamental cultivars, and the culture of cherry blossom viewing began to be spread. In the <a href=\"https://en.wikipedia.org/wiki/United_States\" rel=\"noopener noreferrer\" target=\"_blank\">United States</a>, cherry blossom viewing began to spread after Japan presented cherry blossoms as a token of friendship in 1912.<a href=\"https://en.wikipedia.org/wiki/Cherry_blossom#cite_note-katsuki2015119-10\" rel=\"noopener noreferrer\" target=\"_blank\"><sup>[10]</sup></a> Cherry blossoms have been described to have a beautiful smell and have been the inspiration for many candles and incense for household use.</p>', '2023-11-20', '2023-06-22', 'admin@gmail.com', '');

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
  `keterangan` text DEFAULT NULL,
  `acc` varchar(255) DEFAULT NULL,
  `act_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(6, 'Muhammad Husen', 'mhusendev@gmail.com', '$2b$10$z5Wn4nZyF/6bpwRSazCWl.ufK2hN0cRIbFaSvBE562s3xZ5oLgZpq', '+6289528995437', 'kecamatan', 0, '2023-05-24 14:10:09', '2023-07-02 18:37:02'),
(10, 'awang', 'awangdidit123@gmail.com', '$2b$10$iX80.D8/I/8Q/XgpadLzJOiO6b70h7i/y4UylSFOyd/3Z27EQkQNi', '081214775272', 'balitbang', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `winners`
--

CREATE TABLE `winners` (
  `id` int(11) NOT NULL,
  `nama_inovasi` varchar(255) NOT NULL,
  `nm_perangkat_daerah` varchar(255) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  `tanggal_inovasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bentuk_inovasi`
--
ALTER TABLE `bentuk_inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
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
-- Indeks untuk tabel `winners`
--
ALTER TABLE `winners`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bentuk_inovasi`
--
ALTER TABLE `bentuk_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `inisiator_inovasi`
--
ALTER TABLE `inisiator_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `innovations`
--
ALTER TABLE `innovations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `inovasi_covid`
--
ALTER TABLE `inovasi_covid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_inovasi`
--
ALTER TABLE `jenis_inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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

--
-- AUTO_INCREMENT untuk tabel `winners`
--
ALTER TABLE `winners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
