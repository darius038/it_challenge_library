-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteka
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `darbuotojai`
--

DROP TABLE IF EXISTS `darbuotojai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `darbuotojai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vardas` varchar(45) NOT NULL,
  `pavarde` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `darbuotojai`
--

LOCK TABLES `darbuotojai` WRITE;
/*!40000 ALTER TABLE `darbuotojai` DISABLE KEYS */;
/*!40000 ALTER TABLE `darbuotojai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isdavimas_grazinimas`
--

DROP TABLE IF EXISTS `isdavimas_grazinimas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isdavimas_grazinimas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isduota` date NOT NULL,
  `grazinta` date DEFAULT NULL,
  `darbuotojai_id` int(11) NOT NULL,
  `knygos_isbn` varchar(45) NOT NULL,
  `skaitytojai_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_isdavimas_grazinimas_darbuotojai1_idx` (`darbuotojai_id`),
  KEY `fk_isdavimas_grazinimas_knygos1_idx` (`knygos_isbn`),
  KEY `fk_isdavimas_grazinimas_skaitytojai1_idx` (`skaitytojai_id`),
  CONSTRAINT `fk_isdavimas_grazinimas_darbuotojai1` FOREIGN KEY (`darbuotojai_id`) REFERENCES `darbuotojai` (`id`),
  CONSTRAINT `fk_isdavimas_grazinimas_knygos1` FOREIGN KEY (`knygos_isbn`) REFERENCES `knygos` (`isbn`),
  CONSTRAINT `fk_isdavimas_grazinimas_skaitytojai1` FOREIGN KEY (`skaitytojai_id`) REFERENCES `skaitytojai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isdavimas_grazinimas`
--

LOCK TABLES `isdavimas_grazinimas` WRITE;
/*!40000 ALTER TABLE `isdavimas_grazinimas` DISABLE KEYS */;
/*!40000 ALTER TABLE `isdavimas_grazinimas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knygos`
--

DROP TABLE IF EXISTS `knygos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knygos` (
  `isbn` varchar(45) NOT NULL,
  `pavadinimas` varchar(45) NOT NULL,
  `autorius` varchar(45) NOT NULL,
  PRIMARY KEY (`isbn`),
  UNIQUE KEY `id_UNIQUE` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knygos`
--

LOCK TABLES `knygos` WRITE;
/*!40000 ALTER TABLE `knygos` DISABLE KEYS */;
/*!40000 ALTER TABLE `knygos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negrazintos_knygos`
--

DROP TABLE IF EXISTS `negrazintos_knygos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negrazintos_knygos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `velavimo_registravimas` date NOT NULL,
  `bauda` varchar(45) NOT NULL,
  `velavimo_trukme` varchar(45) NOT NULL,
  `darbuotojai_id` int(11) NOT NULL,
  `isdavimas_grazinimas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_negrazintos_knygos_darbuotojai1_idx` (`darbuotojai_id`),
  KEY `fk_negrazintos_knygos_isdavimas_grazinimas1_idx` (`isdavimas_grazinimas_id`),
  CONSTRAINT `fk_negrazintos_knygos_darbuotojai1` FOREIGN KEY (`darbuotojai_id`) REFERENCES `darbuotojai` (`id`),
  CONSTRAINT `fk_negrazintos_knygos_isdavimas_grazinimas1` FOREIGN KEY (`isdavimas_grazinimas_id`) REFERENCES `isdavimas_grazinimas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negrazintos_knygos`
--

LOCK TABLES `negrazintos_knygos` WRITE;
/*!40000 ALTER TABLE `negrazintos_knygos` DISABLE KEYS */;
/*!40000 ALTER TABLE `negrazintos_knygos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skaitytojai`
--

DROP TABLE IF EXISTS `skaitytojai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skaitytojai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vardas` varchar(45) NOT NULL,
  `pavarde` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skaitytojai`
--

LOCK TABLES `skaitytojai` WRITE;
/*!40000 ALTER TABLE `skaitytojai` DISABLE KEYS */;
/*!40000 ALTER TABLE `skaitytojai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-21 18:01:02
