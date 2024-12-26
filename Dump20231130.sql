-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: milk_tea
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `symbol` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Trà Đài Loan','<i class=\"fa fa-coffee fa-2x text-primary\"></i>'),(2,'Trà Sữa','<i class=\"fa fa-hamburger fa-2x text-primary\"></i>'),(3,'Trà Chanh',' <i class=\"fa fa-utensils fa-2x text-primary\"></i>'),(4,'Trà Yakult',' <i class=\"fa fa-utensils fa-2x text-primary\"></i>'),(5,'Trà Latte','<i class=\"fa fa-hamburger fa-2x text-primary\"></i>');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product.js`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `image` text,
  `price` decimal(10,0) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_product_cat` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product.js`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product.js` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'Trà Đài Loan','https://wujiateavn.com/files/product.js/tra-sua-tran-chau-duong-den-8ke6swxe.jpg',20000,'Ngon Bổ Rẻ'),(2,2,'Trà Sữa Sương Sáo','https://wujiateavn.com/files/product.js/tra-sua-suong-sao-laessvwl.png',20000,'Ngon Bổ Rẻ'),(3,2,'Trà Sữa Trân Châu Đường Đen','https://wujiateavn.com/files/product.js/tra-sua-tran-chau-duong-den-8ke6swxe.jpg',20000,'Ngon Bổ Rẻ'),(4,2,'Trà Xanh Sữa','https://wujiateavn.com/files/product.js/tra-xanh-sua-efbubhnb.jpg',20000,'Ngon Bổ Rẻ'),(5,2,'Trà Xanh Sữa','https://wujiateavn.com/files/product.js/tra-xanh-sua-efbubhnb.jpg',20000,'Ngon Bổ Rẻ'),(6,2,'Trà Xanh Sữa','https://wujiateavn.com/files/product.js/tra-xanh-sua-efbubhnb.jpg',20000,'Ngon Bổ Rẻ'),(7,2,'Trà Xanh Sữa','https://wujiateavn.com/files/product.js/tra-xanh-sua-efbubhnb.jpg',20000,'Ngon Bổ Rẻ'),(8,1,'Hồng trà bí đao','https://wujiateavn.com/files/product.js/hong-tra-bi-dao-sccrscoa.jpg',20000,'Ngon Bổ Rẻ'),(9,1,'Hồng trà bí đao','https://wujiateavn.com/files/product.js/hong-tra-bi-dao-sccrscoa.jpg',20000,'Ngon Bổ Rẻ'),(10,1,'Hồng trà bí đao','https://wujiateavn.com/files/product.js/hong-tra-bi-dao-sccrscoa.jpg',20000,'Ngon Bổ Rẻ'),(11,1,'Hồng trà bí đao','https://wujiateavn.com/files/product.js/hong-tra-bi-dao-sccrscoa.jpg',20000,'Ngon Bổ Rẻ');
/*!40000 ALTER TABLE `product.js` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'Anh','Lan','21130275@st.hcmuaf.edu.vn','anh','123456','03996285741'),(12,'Xuong','Luong','xuong@gmail.com','xuongggg','123456','0236598741'),(17,'dattt2','Dat','dattt2@gmail.com','dattt2','123456',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 15:15:53
