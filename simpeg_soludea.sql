-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Des 2018 pada 05.11
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpeg_soludea`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen`
--

CREATE TABLE `absen` (
  `id_absen` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tanggal` datetime(6) NOT NULL,
  `timezone` datetime(6) NOT NULL,
  `jam_masuk` datetime(6) NOT NULL,
  `jam_keluar` datetime(6) NOT NULL,
  `lembur` datetime(6) NOT NULL,
  `telat` datetime(6) NOT NULL,
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` varchar(50) NOT NULL,
  `keperluan_cuti` varchar(50) NOT NULL,
  `dari_tanggal` datetime(6) NOT NULL,
  `sampai_tanggal` datetime(6) NOT NULL,
  `kt_tambahan` tinytext NOT NULL,
  `validasi_cuti` enum('tidak_dikonfirmasi','terkonfirmasi') NOT NULL DEFAULT 'tidak_dikonfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `bulan_gaji` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `gaji_pokok` int(20) NOT NULL,
  `tunjangan` int(20) NOT NULL,
  `klaim` int(20) NOT NULL,
  `transport` int(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nik` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL DEFAULT 'laki-laki',
  `jabatan` varchar(50) NOT NULL,
  `foto_pegawai` varchar(50) NOT NULL,
  `id_gaji` varchar(50) NOT NULL,
  `id_cuti` varchar(50) NOT NULL,
  `id_reimburse` varchar(50) NOT NULL,
  `id_absen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reimburse`
--

CREATE TABLE `reimburse` (
  `id_reimburse` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `tanggal` datetime(6) NOT NULL,
  `bukti_reimburse` varchar(50) NOT NULL,
  `keperluan_reimburse` tinytext NOT NULL,
  `validasi_reimburse` enum('tidak_dikonfirmasi','terkonfirmasi') NOT NULL DEFAULT 'tidak_dikonfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` enum('hrd','pegawai','pimpinan') NOT NULL DEFAULT 'pegawai',
  `blokir` enum('N','Y') NOT NULL DEFAULT 'N',
  `id_sessions` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `level`, `blokir`, `id_sessions`) VALUES
('2017010001', 'e10adc3949ba59abbe56e057f20f883e', 'bima@gmail.com', 'pegawai', 'N', 'e10adc3949ba59abbe56e057f20f883e'),
('tess', '202CB962AC59075B964B07152D234B70', 'cs@soludea.co.id', 'pegawai', 'N', ''),
('kiki', 'b3100763cd70897d49c462addd81e32c', 'mrizkyfadil@gmail.com', 'hrd', 'N', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indeks untuk tabel `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `FK` (`id_gaji`,`id_cuti`,`id_reimburse`,`id_absen`);

--
-- Indeks untuk tabel `reimburse`
--
ALTER TABLE `reimburse`
  ADD PRIMARY KEY (`id_reimburse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
