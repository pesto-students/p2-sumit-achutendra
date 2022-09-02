CREATE DATABASE  IF NOT EXISTS `warehouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `warehouse`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: warehouse
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city` char(20) DEFAULT NULL,
  `state` char(20) DEFAULT NULL,
  `c_id` int NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('Pune','Maharastra',1),('Mumbai','Maharastra',2),('Lucknow','UP',3),('maihar','MP',19);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cno` int NOT NULL,
  `cname` char(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `cu_city` char(20) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mr. Patil','xyz','Pune'),(2,'Mr. Shayam','ahf','Mumbai'),(3,'Mr. Singh','ajkgf','Lucknow'),(19,'Mr. Shayam','abc','maihar');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemno` int NOT NULL,
  `description` text,
  `weight` decimal(5,2) DEFAULT NULL,
  `cost` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`itemno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'it a matchbox',0.50,1.00),(2,'it\'s an AC',5.20,900.00),(3,'it\'s a Fan',3.20,400.00);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_quantity`
--

DROP TABLE IF EXISTS `ordered_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_quantity` (
  `itemno` int DEFAULT NULL,
  `ono` int DEFAULT NULL,
  UNIQUE KEY `itemno` (`itemno`,`ono`),
  KEY `ono` (`ono`),
  CONSTRAINT `ordered_quantity_ibfk_1` FOREIGN KEY (`itemno`) REFERENCES `items` (`itemno`),
  CONSTRAINT `ordered_quantity_ibfk_2` FOREIGN KEY (`ono`) REFERENCES `orders` (`ono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_quantity`
--

LOCK TABLES `ordered_quantity` WRITE;
/*!40000 ALTER TABLE `ordered_quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ono` int NOT NULL,
  `odate` date DEFAULT NULL,
  PRIMARY KEY (`ono`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ono`) REFERENCES `customer` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-08-15'),(2,'2022-07-15'),(3,'2022-07-07');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantity`
--

DROP TABLE IF EXISTS `quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantity` (
  `sid` int DEFAULT NULL,
  `itemno` int DEFAULT NULL,
  UNIQUE KEY `sid` (`sid`,`itemno`),
  KEY `itemno` (`itemno`),
  CONSTRAINT `quantity_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `stores` (`sid`),
  CONSTRAINT `quantity_ibfk_2` FOREIGN KEY (`itemno`) REFERENCES `items` (`itemno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantity`
--

LOCK TABLES `quantity` WRITE;
/*!40000 ALTER TABLE `quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `sid` int NOT NULL,
  `store_name` char(20) DEFAULT NULL,
  `location_city` char(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'vanu','Pune'),(2,'xyz','Mumbai'),(3,'abc','Lucknow');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `wid` int NOT NULL,
  `wname` char(30) DEFAULT NULL,
  `location` char(20) DEFAULT NULL,
  `extra_content` json DEFAULT NULL,
  KEY `wid` (`wid`),
  CONSTRAINT `warehouses_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `cities` (`c_id`),
  CONSTRAINT `warehouses_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `stores` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'xyz','Pune','[\"asa\", \"sd\"]'),(2,'abc','Mumbai','[\"jg\", \"sk\"]'),(3,'hdrf','Lucknow','[\"jjgbg\", \"sk\"]');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 15:12:41

select min(weight) from items;
select * from warehouses where location = "Pune";
select * from items join customer on customer.cno = items.itemno;
select * from items join customer on customer.cno = items.itemno where customer.cname = "Mr. Patil";
select * from orders join customer on customer.cno = orders.ono;