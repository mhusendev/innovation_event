-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_inovasi
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bentuk_inovasi`
--

DROP TABLE IF EXISTS `bentuk_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bentuk_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bentuk_inovasi`
--

LOCK TABLES `bentuk_inovasi` WRITE;
/*!40000 ALTER TABLE `bentuk_inovasi` DISABLE KEYS */;
INSERT INTO `bentuk_inovasi` VALUES (1,'inovasi daerah lainya sesuai dengan urusan pemerintahan yang menjadi kewenangan daerah'),(2,'Inovasi pelayanan Publik'),(3,'Inovasi tata kelola Pemerintahan Daerah'),(4,'Inovasi bertema teknologi lainya');
/*!40000 ALTER TABLE `bentuk_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs`
--

DROP TABLE IF EXISTS `docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_dokumentasi` varchar(255) DEFAULT NULL,
  `url_dokumen` varchar(255) DEFAULT NULL,
  `jenis_docs` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs`
--

LOCK TABLES `docs` WRITE;
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
INSERT INTO `docs` VALUES (19,'6202888a-e53c-4b58-8893-acaa261cb3fa','files/1686152814042--3.jpg','surat','2023-06-07 15:46:56','2023-06-07 15:46:56'),(20,'6202888a-e53c-4b58-8893-acaa261cb3fa','files/1686152814568--7.jpg','proposal','2023-06-07 15:46:56','2023-06-07 15:46:56'),(21,'6202888a-e53c-4b58-8893-acaa261cb3fa','files/1686152814888--4.jpg','foto cover','2023-06-07 15:46:56','2023-06-07 15:46:56'),(22,'6202888a-e53c-4b58-8893-acaa261cb3fa','files/1686152815194--5.jpg','foto dokumentasi','2023-06-07 15:46:56','2023-06-07 15:46:56'),(23,'6202888a-e53c-4b58-8893-acaa261cb3fa','files/1686152815394--2023-05-28 21-08-57.mp4','vidio dokumentasi','2023-06-07 15:46:56','2023-06-07 15:46:56'),(24,'937b797b-aea7-40fb-adfe-fc524ad11527','files/1686157021538--62a34ea434af3.jpg','foto cover','2023-06-07 16:57:04','2023-06-07 16:57:04'),(25,'937b797b-aea7-40fb-adfe-fc524ad11527','files/1686157022153--2023-05-28 21-08-57.mp4','vidio dokumentasi','2023-06-07 16:57:04','2023-06-07 16:57:04');
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inisiator_inovasi`
--

DROP TABLE IF EXISTS `inisiator_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inisiator_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inisiator_inovasi`
--

LOCK TABLES `inisiator_inovasi` WRITE;
/*!40000 ALTER TABLE `inisiator_inovasi` DISABLE KEYS */;
INSERT INTO `inisiator_inovasi` VALUES (1,'Kepala Daerah'),(2,'Anggota DPRD'),(3,'Perangkat Daerah'),(4,'ASN'),(5,'Masyarakat');
/*!40000 ALTER TABLE `inisiator_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innovations`
--

DROP TABLE IF EXISTS `innovations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innovations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `acc` tinyint(1) DEFAULT NULL,
  `acc_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innovations`
--

LOCK TABLES `innovations` WRITE;
/*!40000 ALTER TABLE `innovations` DISABLE KEYS */;
INSERT INTO `innovations` VALUES (12,'mhusendev@gmail.com','Absensi Digital','mhusen','balitbang','inisiatif','Perangkat Daerah','digital','Inovasi bertema teknologi lainya','non covid','pendidikan','penanganan tata kelola smart city','3/5/2023','6202888a-e53c-4b58-8893-acaa261cb3fa','Absensi digital memudahkan pegawai untuk melakukan absensi dan memudahkan bagian administrasi dalam pendataan data pegawai',1,'admin@gmail.com','2023-06-07 15:46:56','2023-06-07 15:50:33'),(13,'mhusendev@gmail.com','mobil rubicon','yanto','kesra','inisiatif','Anggota DPRD','non digital','Inovasi pelayanan Publik','non covid','kesehatan','penanganan tata kelola smart city','3/5/2023','937b797b-aea7-40fb-adfe-fc524ad11527','mobil rubicon untuk para pegawai daerah , untuk memaksimalkan kinerja agar dapat fokus mengelola urusan masyarakat',1,'admin@gmail.com','2023-06-07 16:57:04','2023-06-07 16:57:38');
/*!40000 ALTER TABLE `innovations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inovasi_covid`
--

DROP TABLE IF EXISTS `inovasi_covid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inovasi_covid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inovasi_covid`
--

LOCK TABLES `inovasi_covid` WRITE;
/*!40000 ALTER TABLE `inovasi_covid` DISABLE KEYS */;
INSERT INTO `inovasi_covid` VALUES (1,'non covid'),(2,'covid');
/*!40000 ALTER TABLE `inovasi_covid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_inovasi`
--

DROP TABLE IF EXISTS `jenis_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_inovasi`
--

LOCK TABLES `jenis_inovasi` WRITE;
/*!40000 ALTER TABLE `jenis_inovasi` DISABLE KEYS */;
INSERT INTO `jenis_inovasi` VALUES (1,'digital'),(2,'non digital');
/*!40000 ALTER TABLE `jenis_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_urusan_inovasi`
--

DROP TABLE IF EXISTS `jenis_urusan_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_urusan_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_urusan_inovasi`
--

LOCK TABLES `jenis_urusan_inovasi` WRITE;
/*!40000 ALTER TABLE `jenis_urusan_inovasi` DISABLE KEYS */;
INSERT INTO `jenis_urusan_inovasi` VALUES (1,'pendidikan'),(2,'kesehatan');
/*!40000 ALTER TABLE `jenis_urusan_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20230520081248-create-users.js'),('20230520133620-create-docs.js'),('20230520133744-create-innovations.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tahapan_inovasi`
--

DROP TABLE IF EXISTS `tahapan_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahapan_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahapan_inovasi`
--

LOCK TABLES `tahapan_inovasi` WRITE;
/*!40000 ALTER TABLE `tahapan_inovasi` DISABLE KEYS */;
INSERT INTO `tahapan_inovasi` VALUES (1,'inisiatif'),(2,'uji coba'),(3,'penerapan');
/*!40000 ALTER TABLE `tahapan_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema_inovasi`
--

DROP TABLE IF EXISTS `tema_inovasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema_inovasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema_inovasi`
--

LOCK TABLES `tema_inovasi` WRITE;
/*!40000 ALTER TABLE `tema_inovasi` DISABLE KEYS */;
INSERT INTO `tema_inovasi` VALUES (1,'panggulanang covid19'),(2,'penanganan tata kelola smart city');
/*!40000 ALTER TABLE `tema_inovasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com','$2b$10$2Wg/hOmDzuloAol9TTIaAucsf6CXgnz9MSH8nA.Mk0hEC0b7WmJ8.','021888888','all',1,'2023-05-21 12:23:50','2023-05-21 12:23:50'),(6,'Muhammad Husen','mhusendev@gmail.com','$2b$10$LuWPU9bocX/P7z41ANLbju3sLycI9XmXd3zvSVCv3lo5sI.uWumXa','+6289528995437','kecamatan',0,'2023-05-24 14:10:09','2023-05-24 14:10:09'),(10,'awang','awangdidit123@gmail.com','$2b$10$iX80.D8/I/8Q/XgpadLzJOiO6b70h7i/y4UylSFOyd/3Z27EQkQNi','081214775272','balitbang',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 12:37:01
