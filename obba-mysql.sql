-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: obba
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime NOT NULL,
  `booking_status` enum('CONFIRMED','CANCELLED') NOT NULL,
  `number_of_seats` int NOT NULL,
  `bus_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bus_id` (`bus_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `arrival_time` time(6) NOT NULL,
  `available_seats` int NOT NULL,
  `bus_number` varchar(255) NOT NULL,
  `departure_time` time(6) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bus_number` (`bus_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'08:00:00.000000',40,'BUS123','06:00:00.000000','CityB',500,'CityA'),(2,'14:00:00.000000',60,'KA-01-1234','08:00:00.000000','Mysuru',500,'Bangalore'),(3,'12:00:00.000000',50,'KA05AR1234','08:00:00.000000','Bengaluru',400,'Dharvada'),(4,'02:00:00.000000',40,'KA05AR1345','10:00:00.000000','Bengaluru',600,'Davangere');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ROLE_USER','ROLE_ADMIN') NOT NULL,
  `account_non_expired` tinyint(1) DEFAULT '1',
  `account_non_locked` tinyint(1) DEFAULT '1',
  `credentials_non_expired` tinyint(1) DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'amu@gmail.com','amu','$2a$10$WOQuxXpORVql.bMD2jHU7OWBhHmwocUfw3znq1lLet.jh5JX5uFzi','ROLE_USER',1,1,1,1),(3,'amudha@gmail.com','amudha','$2a$10$p2DhpSiHjDCc4.rB0Ig6lOWEwHhsIpnyIP7SwNj4VIfGedWJ5wQma','ROLE_USER',1,1,1,1),(4,'abc@gmail.com','abc','$2a$10$Wm.n5yNnQJ5Gp9D/T6j89.TRukJOuwLgTfKuWufT6AG1brfSjAWwe','ROLE_USER',1,1,1,1),(5,'ammu@gmail.com','ammu','$2a$10$w7gtktkTBPe1NbsWqaV90.9awJGF/01W99coQGj6/ZMnaYV7BheZu','ROLE_USER',1,1,1,1),(6,'ajinkya@gmail.com','ajinkya','$2a$10$EMbdtkjPOUsyI.l2yqG3AeBzHbsYbqsIvq350ieEOtLzdNSTNnDIO','ROLE_USER',1,1,1,1),(13,'admin@gmail.com','Admin User','$2a$10$zbD7vH5lEswJFI691HifL.bAuqOzOEn88rcNIt7TIOZwv7ZmxBDTG','ROLE_ADMIN',1,1,1,1),(14,'Nesara@gmail.com','Nesara','$2a$10$xypNz/ce0Mg0Bs1zU1D22umSHXBwi54iyc1MulPrdZ3hcIphy6ySy','ROLE_USER',1,1,1,1),(15,'abcd@gmail.com','abcd','$2a$10$W4hyT3GJtQwx8EfM0bqPIeGd9GSNECRIxKGiNofnpCsiqjmjyMQqq','ROLE_USER',1,1,1,1);
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

-- Dump completed on 2025-03-19 22:35:05
