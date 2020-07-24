-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: pharmalocal
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `concentracao`
--
CREATE Database pharmalocal;
use pharmalocal;

DROP TABLE IF EXISTS `concentracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concentracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concentracao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concentracao`
--

LOCK TABLES `concentracao` WRITE;
/*!40000 ALTER TABLE `concentracao` DISABLE KEYS */;
INSERT INTO `concentracao` VALUES (1,'5mg/mL'),(2,'10mg/mL'),(3,'100mg'),(4,'250mg'),(5,'50mg');
/*!40000 ALTER TABLE `concentracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_farmaceutica`
--

DROP TABLE IF EXISTS `forma_farmaceutica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_farmaceutica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_farmaceutica`
--

LOCK TABLES `forma_farmaceutica` WRITE;
/*!40000 ALTER TABLE `forma_farmaceutica` DISABLE KEYS */;
INSERT INTO `forma_farmaceutica` VALUES (1,'Solução oftálmica'),(2,'Comprimido Revestido'),(3,'Pomada'),(4,'Xarope'),(5,'Cápsula Dura'),(6,'Solução Tópica'),(7,'Comprimido');
/*!40000 ALTER TABLE `forma_farmaceutica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'Genom'),(2,'Johnson & Johnson'),(3,'Aché'),(4,'Brainfarma'),(5,'Cimed'),(6,'EMS S/A '),(7,'EMS Sigma Pharma'),(8,'Eurofarma'),(9,'Geolab'),(10,'Prati Donaduzzi'),(11,'Medley'),(12,'Mantecorp Farmasa'),(13,'GSK'),(14,'Sanofi'),(15,'Biosintética'),(16,'Germed'),(17,'Neo Química'),(18,'Apsen Farmacêutica S/A');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_comercial` varchar(255) NOT NULL,
  `principio_ativo` int(11) NOT NULL,
  `composicao` varchar(255) NOT NULL,
  `laboratorio` int(11) NOT NULL,
  `forma` int(11) NOT NULL,
  `generico` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principio_ativo` (`principio_ativo`),
  KEY `laboratorio` (`laboratorio`),
  KEY `forma` (`forma`),
  CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`principio_ativo`) REFERENCES `principio_ativo` (`id`),
  CONSTRAINT `medicamento_ibfk_2` FOREIGN KEY (`laboratorio`) REFERENCES `laboratorio` (`id`),
  CONSTRAINT `medicamento_ibfk_3` FOREIGN KEY (`forma`) REFERENCES `forma_farmaceutica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Amoxicilina',4,'Amoxicilina',10,5,1),(2,'Miosan',7,'Cloridrato de Ciclobenzeprina',15,2,1),(3,'Miosan',7,'Cloridrato de Ciclobenzeprina',18,2,0);
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento_concentracao`
--

DROP TABLE IF EXISTS `medicamento_concentracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_concentracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicamento` int(11) NOT NULL,
  `concentracao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medicamento` (`medicamento`),
  KEY `concentracao` (`concentracao`),
  CONSTRAINT `medicamento_concentracao_ibfk_1` FOREIGN KEY (`medicamento`) REFERENCES `medicamento` (`id`),
  CONSTRAINT `medicamento_concentracao_ibfk_2` FOREIGN KEY (`concentracao`) REFERENCES `concentracao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_concentracao`
--

LOCK TABLES `medicamento_concentracao` WRITE;
/*!40000 ALTER TABLE `medicamento_concentracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_concentracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento_uso`
--

DROP TABLE IF EXISTS `medicamento_uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_uso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicamento` int(11) NOT NULL,
  `uso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medicamento` (`medicamento`),
  KEY `uso` (`uso`),
  CONSTRAINT `medicamento_uso_ibfk_1` FOREIGN KEY (`medicamento`) REFERENCES `medicamento` (`id`),
  CONSTRAINT `medicamento_uso_ibfk_2` FOREIGN KEY (`uso`) REFERENCES `uso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_uso`
--

LOCK TABLES `medicamento_uso` WRITE;
/*!40000 ALTER TABLE `medicamento_uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principio_ativo`
--

DROP TABLE IF EXISTS `principio_ativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principio_ativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principio_ativo`
--

LOCK TABLES `principio_ativo` WRITE;
/*!40000 ALTER TABLE `principio_ativo` DISABLE KEYS */;
INSERT INTO `principio_ativo` VALUES (1,'acebrofilina'),(2,'aceclofenaco'),(3,'paracetamol'),(4,'amoxicilina'),(5,'ácido acetilsalicílico'),(6,'acetato de abiraterona'),(7,'cloridrato de ciclobenzeprina');
/*!40000 ALTER TABLE `principio_ativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uso`
--

DROP TABLE IF EXISTS `uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uso`
--

LOCK TABLES `uso` WRITE;
/*!40000 ALTER TABLE `uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `uso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 23:52:41
