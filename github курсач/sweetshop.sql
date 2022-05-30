-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sweetshop
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `desk`
--

DROP TABLE IF EXISTS `desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Количество_мест` int NOT NULL,
  `Описание` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desk`
--

LOCK TABLES `desk` WRITE;
/*!40000 ALTER TABLE `desk` DISABLE KEYS */;
INSERT INTO `desk` VALUES (1,2,'У окна'),(2,4,'В центре'),(3,2,'У входа'),(4,3,'Диван у окна');
/*!40000 ALTER TABLE `desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Имя` varchar(255) NOT NULL,
  `Количество` int NOT NULL,
  `Menu_id` int NOT NULL,
  `Orders_id` int NOT NULL,
  `Desk_id` int NOT NULL,
  `Employers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuid3_idx` (`Menu_id`),
  KEY `ordersid_idx` (`Orders_id`),
  KEY `deskid1_idx` (`Desk_id`),
  KEY `employersid1_idx` (`Employers_id`),
  CONSTRAINT `deskid1` FOREIGN KEY (`Desk_id`) REFERENCES `desk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employersid1` FOREIGN KEY (`Employers_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menuid3` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordersid` FOREIGN KEY (`Orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'Чизкейк',1,1,2,1,2),(2,'Тирамису',1,2,1,1,2),(3,'Мороженое',10,3,3,3,2),(4,'Картошка',1,4,4,4,1);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employers`
--

DROP TABLE IF EXISTS `employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(255) NOT NULL,
  `Паспорт` varchar(255) NOT NULL,
  `Санитарная_книжка` datetime NOT NULL,
  `Ставка` decimal(10,0) NOT NULL,
  `Должность` varchar(255) NOT NULL,
  `Адрес` varchar(255) NOT NULL,
  `Телефон` varchar(255) NOT NULL,
  `Дата_рождения` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES (1,'Гречкин Петр Сергеевич','435435','2020-03-25 00:00:00',250,'Официант','г.Москва','79108331212','1998-10-10 00:00:00'),(2,'Александров Алексей Викторович','28 25 332567','2019-03-25 00:00:00',250,'Официант','г.Москва','79106331717','1958-10-10 00:00:00'),(3,'Викторов Евгений Александрович','30 12 146546','2015-10-15 00:00:00',350,'Повар','г.Москва','79108337878','1978-01-10 00:00:00'),(4,'Рогозин Павел Сергеевич','19 27 366890','2010-04-17 00:00:00',500,'Старший Повар','г.Москва','79103338978','1982-02-20 00:00:00');
/*!40000 ALTER TABLE `employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Имя` varchar(255) NOT NULL,
  `Вес_кг` int NOT NULL,
  `Состав` varchar(255) NOT NULL,
  `Цена_за_кг` int NOT NULL,
  `Цена_в_меню` int NOT NULL,
  `Вес_в_меню` decimal(10,3) NOT NULL,
  `Код_основного_продукта` int NOT NULL,
  `Код_заказа` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Чизкейк',1,'Творог',1000,100,0.100,1,1),(2,'Тирамису',1,'сыр маскарпоне, кофе, куриные яйца, сахар и печенье савоярди',1700,340,0.200,2,2),(3,'Мороженое',1,'Молоко',800,80,0.100,3,3),(4,'Картошка',1,'Какао',2000,200,0.200,4,4);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Дата_и_время` datetime NOT NULL,
  `Код_официанта` int NOT NULL,
  `Код_кондитера` int NOT NULL,
  `Выполнен` varchar(255) NOT NULL,
  `Сумма_заказа` decimal(10,0) NOT NULL,
  `Оплачено` varchar(255) NOT NULL,
  `Menu_id` int NOT NULL,
  `Desk_id` int NOT NULL,
  `Employers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuid2_idx` (`Menu_id`),
  KEY `deskid_idx` (`Desk_id`),
  KEY `employersid_idx` (`Employers_id`),
  CONSTRAINT `deskid` FOREIGN KEY (`Desk_id`) REFERENCES `desk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employersid` FOREIGN KEY (`Employers_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menuid2` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-05-10 00:00:00',2,3,'Выполнен',340,'Да',2,1,2),(2,'2022-05-10 00:00:00',2,3,'Выполнен',100,'Да',1,1,2),(3,'2022-05-11 00:00:00',1,3,'Выполнен',800,'Да',3,4,1),(4,'2022-06-11 00:00:00',1,3,'Выполнен',200,'Да',4,4,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Имя_продукта` varchar(255) NOT NULL,
  `Срок_годности` varchar(255) NOT NULL,
  `Особенность` varchar(255) NOT NULL,
  `Menu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuid1_idx` (`Menu_id`),
  CONSTRAINT `menuid1` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Творог','14 дней','Хранить в холодильнике',1),(2,'Маскарпоне','до 4 месяцев','Маскарпоне содержит в сухом остатке около 75 % жира',2),(3,'Мороженое','до 2 месяцев','хранить в холодильнике',3),(4,'Молоко','1 неделя, после вскрытия упаковки 4 дня','Кисломолочные продукты стоит употребить в течение 72 часов.',4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(255) NOT NULL,
  `Адрес` varchar(255) NOT NULL,
  `Телефон` varchar(255) NOT NULL,
  `Условия` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'H2O','г.Москва, Новоясеневский проспект,д6','74957924016','Поставка воды'),(2,'Старо-Мытищинский источник','г.Москва, Мытищи, улица Фабричная,17В','7495730155','Поставка воды'),(3,'ООО КАЛИНА','г.Москва, ул. Ижорская 7','89262757655','Поставка молока'),(4,'ООО Шоколад','г.Москва, ул. Профсоюзная, 45а','74957187910','Поставка шоколада'),(5,'ТворМир','г.Москва','79993318921','Творог'),(6,'МилкМир','г.Москва, ','79993218921','Молоко');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Дата_поставки` datetime NOT NULL,
  `Цена_за_кг` int NOT NULL,
  `Вес_кг` int NOT NULL,
  `Код_поставщика` varchar(255) NOT NULL,
  `ИТОГО` decimal(10,0) NOT NULL,
  `Provider_id` int NOT NULL,
  `Products_id` int NOT NULL,
  `Menu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `providerid_idx` (`Provider_id`),
  KEY `productsid_idx` (`Products_id`),
  KEY `menuid_idx` (`Menu_id`),
  CONSTRAINT `menuid` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productsid` FOREIGN KEY (`Products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `providerid` FOREIGN KEY (`Provider_id`) REFERENCES `provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'2022-05-10 00:00:00',350,10,'5',3500,5,1,1),(2,'2025-05-20 00:00:00',60,20,'6',1200,6,4,3);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sweetshop'
--

--
-- Dumping routines for database 'sweetshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc`()
BEGIN
	SELECT id, Имя_продукта, Срок_годности From products;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 10:38:49
