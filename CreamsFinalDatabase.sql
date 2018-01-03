-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: creamsncrumbs
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `contact` char(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `status` varchar(45) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Samuel','Miguel','09218386123','Sasa Dona Pilar',1409,0,'Active'),(2,'Ferdinand','Polpol','09274933382','Indangan',2020,0,'Active'),(3,'John Carlos','Ochave','09817263871','Maa Ochave Compound',45,0,'Active'),(4,'Dennis Duey','Guevarra','09091237891','Puan Davao City',1792,0,'Active'),(5,'June Bryan','Belleza','09218736871','Sasa 12 Panacan ',4890,0,'Active'),(6,'Bryan pogi','Belleza','09123131231','Sasa 13 panacan warf',697,0,'Active'),(7,'James','Licarte','01923618732','Robinsons Highlands',0,0,'Active');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `deliveryid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `deliveryaddress` varchar(255) NOT NULL,
  `deliverydate` date NOT NULL,
  `productionstatus` varchar(45) DEFAULT 'In Progress',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deliveryid`),
  KEY `delivery_orderid_idx` (`orderid`),
  CONSTRAINT `delivery_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,10,1,'Sasa Dona Pilar','2017-03-24','Finished','2017-03-15 07:47:14'),(2,11,1,'Sasa Dona Pilar','2017-03-29','Finished','2017-03-15 08:31:51'),(3,14,1,'Sasa Dona Pilar','2017-03-20','Finished','2017-03-17 10:06:23'),(4,30,5,'Sasa 12 Panacan ','2017-03-31','In Progress','2017-03-21 22:50:21'),(5,46,4,'Puan Davao City','2017-03-31','In Progress','2017-03-22 13:02:59'),(6,55,6,'Sasa 13 panacan warf','2017-03-27','Finished','2017-03-23 21:05:40'),(7,64,6,'Sasa 13 panacan warf','2017-03-30','In Progress','2017-03-24 08:37:58'),(8,68,7,'Robinsons Highlands','2017-03-27','Finished','2017-03-24 13:40:08');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `ingredientid` int(11) NOT NULL AUTO_INCREMENT,
  `foodid` int(11) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`ingredientid`),
  KEY `ingredients_foodid_idx` (`foodid`),
  CONSTRAINT `ingredients_foodid` FOREIGN KEY (`foodid`) REFERENCES `product` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,5,'Butter',5,'Tbsps'),(2,5,'Flour',2,'Cups'),(3,5,'Sugar',1,'Cups'),(4,13,'Butter',50,'grams'),(5,13,'Chocolate Powder',2,'Cups'),(6,13,'Sugar',1,'Cups'),(7,13,'Flour',2,'Cups'),(8,13,'Cream',100,'grams'),(9,16,'Corn Starch',1,'Cups'),(10,16,'Flour',1,'Cups'),(11,16,'Chocolate Powder',1,'Cups'),(12,16,'Cream',100,'grams');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderline` (
  `orderlineid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `saleid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `selling_price` double NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `subtotal` double NOT NULL,
  PRIMARY KEY (`orderlineid`,`orderid`),
  KEY `ol_orderid_idx` (`orderid`),
  KEY `orderline_productid_idx` (`productid`),
  CONSTRAINT `orderline_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderline_productid` FOREIGN KEY (`productid`) REFERENCES `saleinventory` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
INSERT INTO `orderline` VALUES (1,1,1,1,'Beater',0,45,10,450),(2,2,2,1,'Beater',0,45,10,450),(3,3,2,1,'Beater',0,45,10,450),(4,4,2,1,'Beater',0,45,10,450),(5,5,4,1,'Beater',0,45,10,450),(6,6,5,1,'Beater',0,45,10,450),(7,6,5,1,'Beater',0,45,10,450),(8,6,5,1,'Beater',0,45,10,450),(9,7,8,1,'Beater',0,45,10,450),(10,8,8,1,'Beater',0,45,5,225),(11,8,8,1,'Beater',0,45,10,450),(12,8,8,1,'Beater',0,45,1,45),(13,10,0,5,'Chiffon Cake',0,299,1,299),(14,11,0,5,'Chiffon Cake',0,299,1,299),(16,12,17,4,'Butter',0,45,13,585),(17,12,15,3,'Flour',0,50,15,750),(18,13,0,5,'Chiffon Cake',0,299,1,299),(19,14,0,5,'Chiffon Cake',0,299,5,1495),(20,15,16,2,'Sugar',0,45,3,135),(21,15,17,4,'Butter',0,45,2,90),(22,15,11,1,'Beater',0,45,1,45),(23,16,25,1,'Beater',0,45,5,225),(24,16,15,3,'Flour',0,50,3,150),(25,17,28,7,'Cream',0,65,1,65),(26,18,28,7,'Cream',0,65,3,195),(27,18,29,8,'Strawberry Powder',0,45,3,135),(28,19,0,13,'Chocolate Moist Cake',0,599,2,1198),(29,20,0,13,'Chocolate Moist Cake',0,599,3,1797),(30,21,0,13,'Chocolate Moist Cake',0,599,2,1198),(31,22,0,13,'Chocolate Moist Cake',0,599,3,1797),(32,23,0,13,'Chocolate Moist Cake',0,599,4,2396),(33,24,0,13,'Chocolate Moist Cake',0,599,3,1797),(34,24,0,5,'Chiffon Cake',0,299,2,598),(35,25,0,5,'Chiffon Cake',0,299,2,598),(36,25,0,13,'Chocolate Moist Cake',0,599,3,1797),(37,26,29,8,'Strawberry Powder',0,45,4,180),(38,26,28,7,'Cream',0,65,4,260),(39,27,29,8,'Strawberry Powder',0,45,1,45),(40,28,29,8,'Strawberry Powder',0,45,10,450),(41,29,28,7,'Cream',0,65,19,1235),(42,29,28,7,'Cream',0,65,10,650),(43,29,28,7,'Cream',0,65,1,65),(44,30,0,13,'Chocolate Moist Cake',0,599,10,5990),(45,32,34,7,'Cream',0,65,1,65),(46,34,29,8,'Strawberry Powder',0,45,1,45),(47,35,29,8,'Strawberry Powder',0,45,3,135),(48,36,29,8,'Strawberry Powder',0,45,2,90),(49,37,34,7,'Cream',0,65,1,65),(50,38,29,8,'Strawberry Powder',0,45,1,45),(51,39,29,8,'Strawberry Powder',0,45,1,45),(52,40,29,8,'Strawberry Powder',0,45,1,45),(53,41,29,8,'Strawberry Powder',0,45,1,45),(54,42,29,8,'Strawberry Powder',0,45,1,45),(55,43,29,8,'Strawberry Powder',0,45,1,45),(56,44,29,8,'Strawberry Powder',0,45,1,45),(57,45,29,8,'Strawberry Powder',0,45,1,45),(58,46,0,5,'Chiffon Cake',0,299,3,897),(59,46,0,13,'Chocolate Moist Cake',0,599,5,2995),(60,47,29,8,'Strawberry Powder',0,45,3,135),(61,48,25,1,'Beater',0,45,2,90),(62,49,25,1,'Beater',0,45,3,135),(63,50,27,1,'Beater',0,45,1,45),(64,51,41,7,'Cream',0,65,1,65),(66,52,0,5,'Chiffon Cake',0,299,1,299),(67,52,0,13,'Chocolate Moist Cake',0,599,1,599),(68,54,44,14,'Corn Starch',0,30,39,1170),(69,54,44,14,'Corn Starch',0,30,1,30),(70,55,0,16,'Chocolate moist',0,399,3,1197),(71,56,36,1,'Beater',0,45,1,45),(72,57,36,1,'Beater',0,45,1,45),(73,58,47,9,'Chocolate Powder',0,50,3,150),(74,59,47,9,'Chocolate Powder',0,50,1,50),(75,60,47,9,'Chocolate Powder',0,50,1,50),(76,61,47,9,'Chocolate Powder',0,50,1,50),(77,62,0,16,'Chocolate moist',0,399,3,1197),(78,63,0,16,'Chocolate moist',0,399,3,1197),(79,64,0,16,'Chocolate moist',0,399,3,1197),(81,66,39,1,'Beater',0,45,1,45),(82,66,39,1,'Beater',0,45,1,45),(83,66,39,1,'Beater',0,45,1,45),(84,66,39,1,'Beater',0,45,1,45),(85,67,51,1,'Beater',0,45,3,135),(86,68,0,5,'Chiffon Cake',0,299,2,598),(87,69,47,9,'Chocolate Powder',0,50,2,100),(88,69,56,4,'Butter',0,45,1,45),(89,69,51,1,'Beater',0,45,1,45);
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL DEFAULT '1',
  `staffid` int(11) NOT NULL,
  `total` double NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` double NOT NULL DEFAULT '0',
  `type` varchar(45) NOT NULL DEFAULT 'Sale',
  PRIMARY KEY (`orderid`),
  KEY `orders_cutomerid_idx` (`customerid`),
  KEY `orders_staffid_idx` (`staffid`),
  CONSTRAINT `orders_cutomerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orders_staffid` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,450,'2017-03-14 19:18:32',0,'Returned'),(2,1,1,450,'2017-03-14 19:25:17',0,'Returned'),(3,1,1,450,'2017-03-14 19:26:32',0,'Returned'),(4,1,1,450,'2017-03-14 19:31:52',0,'Returned'),(5,1,1,450,'2017-03-14 19:36:02',0,'Returned'),(6,0,1,1350,'2017-03-14 19:42:55',0,'Sales'),(7,1,1,450,'2017-03-14 19:54:14',0,'Returned'),(8,1,1,720,'2017-03-14 20:01:56',0,'Returned'),(9,0,1,0,'2017-03-15 07:35:08',0,'Sale'),(10,1,1,299,'2017-03-15 07:47:14',0,'Delivery'),(11,1,1,299,'2017-03-15 08:31:51',0,'Delivery'),(12,0,1,1335,'2017-03-15 17:02:00',0,'Sales'),(13,0,1,0,'2017-03-17 10:04:34',0,'Sale'),(14,1,1,1495,'2017-03-17 10:06:23',0,'Delivery'),(15,2,1,270,'2017-03-17 14:10:40',0,'Returned'),(16,5,1,375,'2017-03-19 20:48:21',0,'Returned'),(17,0,1,65,'2017-03-19 21:18:06',0,'Returned'),(18,0,1,330,'2017-03-19 21:20:21',0,'Returned'),(19,0,1,0,'2017-03-19 23:00:12',0,'Sale'),(20,0,1,0,'2017-03-19 23:04:01',0,'Sale'),(21,0,1,0,'2017-03-19 23:04:49',0,'Sale'),(22,0,1,0,'2017-03-19 23:06:34',0,'Sale'),(23,0,1,0,'2017-03-19 23:10:26',0,'Sale'),(24,0,1,0,'2017-03-19 23:16:01',0,'Sale'),(25,0,1,0,'2017-03-19 23:18:44',0,'Sale'),(26,0,1,440,'2017-03-19 23:27:11',0,'Sales'),(27,0,1,45,'2017-03-19 23:42:26',0,'Sales'),(28,0,1,350,'2017-03-19 23:44:28',100,'Sales'),(29,2,1,1950,'2017-03-21 09:29:00',0,'Sales'),(30,5,1,5890,'2017-03-21 22:50:21',100,'Delivery'),(31,0,1,0,'2017-03-21 23:50:47',0,'Sales'),(32,0,1,65,'2017-03-21 23:55:00',0,'Sales'),(33,0,1,0,'2017-03-21 23:55:24',0,'Sales'),(34,0,1,45,'2017-03-22 00:01:27',0,'Returned'),(35,0,1,135,'2017-03-22 00:04:33',0,'Sales'),(36,0,1,90,'2017-03-22 00:05:22',0,'Sales'),(37,0,1,65,'2017-03-22 00:09:59',0,'Sales'),(38,0,1,45,'2017-03-22 00:12:47',0,'Sales'),(39,1,1,45,'2017-03-22 08:22:33',0,'Sales'),(40,0,1,45,'2017-03-22 08:25:09',0,'Sales'),(41,3,1,45,'2017-03-22 08:30:11',0,'Sales'),(42,0,1,45,'2017-03-22 08:51:59',0,'Sales'),(43,0,1,45,'2017-03-22 08:53:11',0,'Sales'),(44,0,1,45,'2017-03-22 08:54:10',0,'Sales'),(45,0,1,45,'2017-03-22 08:58:04',0,'Sales'),(46,4,1,3792,'2017-03-22 13:02:59',100,'Delivery'),(47,0,1,135,'2017-03-22 13:07:32',0,'Sales'),(48,0,1,90,'2017-05-02 16:06:16',0,'Sales'),(49,0,1,135,'2017-03-23 09:59:17',0,'Sales'),(50,0,1,45,'2017-03-23 10:02:33',0,'Returned'),(51,0,1,65,'2017-03-23 15:00:20',0,'Sales'),(52,0,1,0,'2017-03-23 16:42:10',0,'Sale'),(53,0,1,0,'2017-03-23 16:51:11',0,'Sale'),(54,0,1,1200,'2017-03-23 21:01:54',0,'Returned'),(55,6,1,1097,'2017-03-23 21:05:40',100,'Delivery'),(56,0,1,45,'2017-03-23 21:18:36',0,'Returned'),(57,0,1,45,'2017-03-23 21:19:26',0,'Returned'),(58,0,1,150,'2017-03-24 08:19:18',0,'Sales'),(59,0,1,50,'2017-03-24 08:24:58',0,'Sales'),(60,0,1,50,'2017-03-24 08:31:15',0,'Sales'),(61,0,1,50,'2017-03-24 08:32:07',0,'Sales'),(62,0,1,1197,'2017-03-24 08:33:40',0,'Sale'),(63,0,1,1197,'2017-03-24 08:35:17',0,'Sale'),(64,6,1,1197,'2017-03-24 08:37:58',0,'Delivery'),(65,0,1,0,'2017-03-24 08:46:31',0,'Sales'),(66,0,1,180,'2017-03-24 12:13:14',0,'Returned'),(67,0,1,135,'2017-03-24 12:30:10',0,'Refund'),(68,7,1,598,'2017-03-24 13:40:08',0,'Delivery'),(69,0,1,190,'2017-03-24 13:57:08',0,'Refund');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentline`
--

DROP TABLE IF EXISTS `paymentline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentline` (
  `paymenlinetid` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL,
  `paymentid` int(11) NOT NULL,
  `balance` double NOT NULL,
  `payment` double NOT NULL,
  `paychange` double NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paymenlinetid`),
  KEY `p;_paymentid_idx` (`paymentid`),
  CONSTRAINT `p;_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `payments` (`paymentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentline`
--

LOCK TABLES `paymentline` WRITE;
/*!40000 ALTER TABLE `paymentline` DISABLE KEYS */;
INSERT INTO `paymentline` VALUES (1,1,1,450,0,0,'2017-03-14 19:18:32'),(2,1,1,450,50,0,'2017-03-14 19:22:23'),(3,1,1,400,100,0,'2017-03-14 19:22:29'),(4,1,1,300,50,0,'2017-03-14 19:22:33'),(5,1,2,450,0,0,'2017-03-14 19:25:17'),(6,1,3,450,0,0,'2017-03-14 19:26:32'),(7,1,4,350,100,0,'2017-03-14 19:31:52'),(8,1,5,350,100,0,'2017-03-14 19:36:02'),(9,0,6,650,2000,650,'2017-03-14 19:42:55'),(10,1,7,150,300,0,'2017-03-14 19:54:14'),(11,1,8,280,1000,280,'2017-03-14 20:01:55'),(12,1,9,1,300,1,'2017-03-15 07:47:14'),(13,1,1,250,300,50,'2017-03-15 08:11:24'),(14,1,2,450,2000,1550,'2017-03-15 08:11:43'),(15,1,3,450,1550,1100,'2017-03-15 08:11:43'),(16,1,4,350,1100,750,'2017-03-15 08:11:43'),(17,1,5,350,750,400,'2017-03-15 08:11:43'),(18,1,7,150,400,250,'2017-03-15 08:11:43'),(19,1,10,299,0,0,'2017-03-15 08:31:50'),(20,0,11,165,1500,165,'2017-03-15 17:02:00'),(21,1,10,299,500,201,'2017-03-17 09:58:00'),(22,1,12,5,1500,5,'2017-03-17 10:06:23'),(23,2,13,70,200,0,'2017-03-17 14:10:40'),(24,5,14,25,400,25,'2017-03-19 20:48:21'),(25,0,15,35,100,35,'2017-03-19 21:18:06'),(26,0,16,70,400,70,'2017-03-19 21:20:21'),(27,0,17,10,350,10,'2017-03-19 23:27:11'),(28,0,18,5,40,5,'2017-03-19 23:42:26'),(29,0,19,50,400,50,'2017-03-19 23:44:28'),(30,2,20,1950,0,0,'2017-03-21 09:29:00'),(31,5,21,4890,1000,0,'2017-03-21 22:50:21'),(32,0,22,5,70,5,'2017-03-21 23:55:00'),(33,0,23,5,50,5,'2017-03-22 00:01:27'),(34,0,24,65,200,65,'2017-03-22 00:04:33'),(35,0,25,10,100,10,'2017-03-22 00:05:22'),(36,0,26,5,70,5,'2017-03-22 00:09:59'),(37,0,27,5,50,5,'2017-03-22 00:12:47'),(38,1,28,45,0,0,'2017-03-22 08:22:33'),(39,0,29,5,50,5,'2017-03-22 08:25:09'),(40,3,30,45,0,0,'2017-03-22 08:30:11'),(41,0,31,5,50,5,'2017-03-22 08:51:59'),(42,0,32,5,50,5,'2017-03-22 08:53:11'),(43,0,33,55,100,55,'2017-03-22 08:54:10'),(44,0,34,5,50,5,'2017-03-22 08:58:04'),(45,4,35,1792,2000,0,'2017-03-22 13:02:59'),(46,0,36,65,200,65,'2017-03-22 13:07:32'),(47,0,37,10,100,10,'2017-05-02 16:06:16'),(48,0,38,65,200,65,'2017-03-23 09:59:17'),(49,0,39,5,50,5,'2017-03-23 10:02:33'),(50,0,40,5,70,5,'2017-03-23 15:00:20'),(51,1,28,45,0,0,'2017-03-23 16:22:21'),(52,1,28,45,0,0,'2017-03-23 16:22:26'),(53,1,28,45,30,0,'2017-03-23 18:21:20'),(54,0,41,100,1300,100,'2017-03-23 21:01:53'),(55,6,42,597,500,0,'2017-03-23 21:05:40'),(56,0,43,5,50,5,'2017-03-23 21:18:36'),(57,0,44,5,50,5,'2017-03-23 21:19:26'),(58,6,42,597,100,0,'2017-03-23 21:24:28'),(59,6,42,497,100,0,'2017-03-23 21:24:32'),(60,6,42,397,100,0,'2017-03-23 21:24:37'),(61,6,42,297,50,0,'2017-03-23 21:24:40'),(62,6,42,247,500,253,'2017-03-23 21:24:46'),(63,0,45,50,200,50,'2017-03-24 08:19:18'),(64,0,46,0,50,0,'2017-03-24 08:24:58'),(65,0,47,0,50,0,'2017-03-24 08:31:14'),(66,0,48,0,50,0,'2017-03-24 08:32:07'),(67,1,49,697,500,0,'2017-03-24 08:34:13'),(68,1,50,697,500,0,'2017-03-24 08:35:37'),(69,6,51,697,500,0,'2017-03-24 08:37:58'),(70,0,52,20,200,20,'2017-03-24 12:13:14'),(71,0,53,0,135,0,'2017-03-24 12:30:10'),(72,7,54,2,600,2,'2017-03-24 13:40:08'),(73,0,55,10,200,10,'2017-03-24 13:57:08');
/*!40000 ALTER TABLE `paymentline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `total` double NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'Regular',
  `status` varchar(45) NOT NULL DEFAULT 'Paid',
  `remaining` double NOT NULL DEFAULT '0',
  `due` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paymentid`),
  KEY `payments_orderid_idx` (`orderid`),
  CONSTRAINT `payments_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:18:32'),(2,2,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:25:17'),(3,3,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:26:32'),(4,4,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:31:52'),(5,5,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:36:02'),(6,6,1350,1350,'Regular','Paid',0,'2017-03-14 19:42:55','2017-03-14 19:42:55'),(7,7,450,450,'Downpayment','Paid',0,'2017-04-13 00:00:00','2017-03-14 19:54:13'),(8,8,720,720,'Regular','Paid',0,'2017-03-14 20:01:55','2017-03-14 20:01:55'),(9,10,299,299,'Regular','Paid',0,'2017-03-15 07:47:14','2017-03-15 07:47:14'),(10,11,299,299,'Downpayment','Paid',0,'2017-03-24 00:00:00','2017-03-15 08:31:50'),(11,12,1335,1335,'Regular','Paid',0,'2017-03-15 17:02:00','2017-03-15 17:02:00'),(12,14,1495,1495,'Regular','Paid',0,'2017-03-17 10:06:23','2017-03-17 10:06:23'),(13,15,270,200,'Downpayment','Pending',70,'2017-04-16 00:00:00','2017-03-17 14:10:40'),(14,16,375,375,'Regular','Paid',0,'2017-03-19 20:48:21','2017-03-19 20:48:21'),(15,17,65,65,'Regular','Paid',0,'2017-03-19 21:18:06','2017-03-19 21:18:06'),(16,18,330,330,'Regular','Paid',0,'2017-03-19 21:20:21','2017-03-19 21:20:21'),(17,26,340,340,'Regular','Paid',0,'2017-03-19 23:27:11','2017-03-19 23:27:11'),(18,27,35,35,'Regular','Paid',0,'2017-03-19 23:42:25','2017-03-19 23:42:25'),(19,28,350,350,'Regular','Paid',0,'2017-03-19 23:44:28','2017-03-19 23:44:28'),(20,29,1950,0,'Downpayment','Pending',1950,'2017-04-20 00:00:00','2017-03-21 09:29:00'),(21,30,5890,1000,'Downpayment','Pending',4890,'2017-03-31 00:00:00','2017-03-21 22:50:21'),(22,32,65,65,'Regular','Paid',0,'2017-03-21 23:55:00','2017-03-21 23:55:00'),(23,34,45,45,'Regular','Paid',0,'2017-03-22 00:01:27','2017-03-22 00:01:27'),(24,35,135,135,'Regular','Paid',0,'2017-03-22 00:04:33','2017-03-22 00:04:33'),(25,36,90,90,'Regular','Paid',0,'2017-03-22 00:05:22','2017-03-22 00:05:22'),(26,37,65,65,'Regular','Paid',0,'2017-03-22 00:09:59','2017-03-22 00:09:59'),(27,38,45,45,'Regular','Paid',0,'2017-03-22 00:12:47','2017-03-22 00:12:47'),(28,39,45,30,'Downpayment','Pending',15,'2017-04-21 00:00:00','2017-03-22 08:22:33'),(29,40,45,45,'Regular','Paid',0,'2017-03-22 08:25:09','2017-03-22 08:25:09'),(30,41,45,0,'Downpayment','Pending',45,'2017-04-21 00:00:00','2017-03-22 08:30:11'),(31,42,45,45,'Regular','Paid',0,'2017-03-22 08:51:59','2017-03-22 08:51:59'),(32,43,45,45,'Regular','Paid',0,'2017-03-22 08:53:11','2017-03-22 08:53:11'),(33,44,45,45,'Regular','Paid',0,'2017-03-22 08:54:10','2017-03-22 08:54:10'),(34,45,45,45,'Regular','Paid',0,'2017-03-22 08:58:04','2017-03-22 08:58:04'),(35,46,3792,2000,'Downpayment','Pending',1792,'2017-03-31 00:00:00','2017-03-22 13:02:59'),(36,47,135,135,'Regular','Paid',0,'2017-03-22 13:07:32','2017-03-22 13:07:32'),(37,48,90,90,'Regular','Paid',0,'2017-05-02 16:06:16','2017-05-02 16:06:16'),(38,49,135,135,'Regular','Paid',0,'2017-03-23 09:59:17','2017-03-23 09:59:17'),(39,50,45,45,'Regular','Paid',0,'2017-03-23 10:02:33','2017-03-23 10:02:33'),(40,51,65,65,'Regular','Paid',0,'2017-03-23 15:00:20','2017-03-23 15:00:20'),(41,54,1200,1200,'Regular','Paid',0,'2017-03-23 21:01:53','2017-03-23 21:01:53'),(42,55,1097,1097,'Downpayment','Paid',0,'2017-03-27 00:00:00','2017-03-23 21:05:40'),(43,56,45,45,'Regular','Paid',0,'2017-03-23 21:18:36','2017-03-23 21:18:36'),(44,57,45,45,'Regular','Paid',0,'2017-03-23 21:19:26','2017-03-23 21:19:26'),(45,58,150,150,'Regular','Paid',0,'2017-03-24 08:19:18','2017-03-24 08:19:18'),(46,59,50,50,'Regular','Paid',0,'2017-03-24 08:24:57','2017-03-24 08:24:57'),(47,60,50,50,'Regular','Paid',0,'2017-03-24 08:31:14','2017-03-24 08:31:14'),(48,61,50,50,'Regular','Paid',0,'2017-03-24 08:32:07','2017-03-24 08:32:07'),(49,62,1197,500,'Downpayment','Pending',697,'2017-03-30 00:00:00','2017-03-24 08:34:13'),(50,63,1197,500,'Downpayment','Pending',697,'2017-03-30 00:00:00','2017-03-24 08:35:37'),(51,64,1197,500,'Downpayment','Pending',697,'2017-03-30 00:00:00','2017-03-24 08:37:58'),(52,66,180,180,'Regular','Paid',0,'2017-03-24 12:13:14','2017-03-24 12:13:14'),(53,67,135,135,'Regular','Paid',0,'2017-03-24 12:30:10','2017-03-24 12:30:10'),(54,68,598,598,'Regular','Paid',0,'2017-03-24 13:40:08','2017-03-24 13:40:08'),(55,69,190,190,'Regular','Paid',0,'2017-03-24 13:57:07','2017-03-24 13:57:07');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) NOT NULL,
  `purchase_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `producttype` varchar(45) NOT NULL,
  `productdesc` varchar(255) NOT NULL,
  `productunit` varchar(100) NOT NULL,
  `reorderpoint` int(11) NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Beater',40,45,'Non-Consumable','beat','Medium',20),(2,'Sugar',40,45,'Consumable','s','1 Kg',30),(3,'Flour',45,50,'Consumable','f','1 Kg',30),(4,'Butter',39,45,'Consumable','b','100 grams',20),(5,'Chiffon Cake',0,299,'Food','cc','Medium',0),(6,'Food for the Gods Box',10,15,'Non-Consumable','container','Small',10),(7,'Cream',50,65,'Consumable','113','500 grams',20),(8,'Strawberry Powder',40,45,'Consumable','sp','400 grams',10),(9,'Chocolate Powder',47,50,'Consumable','CXSD','1 Kg',15),(10,'Bread knife',23,25,'Non-Consumable','bg','Small',10),(11,'Mixing Bowl',30,35,'Non-Consumable','mb','Medium',10),(12,'Measuring Spoons and Cups',95,105,'Non-Consumable','Pack','Large',10),(13,'Chocolate Moist Cake',0,599,'Food','cake','Medium',0),(14,'Corn Starch',25,30,'Consumable','Lapot','1 Kg',20),(15,'Kitchen knife',90,100,'Non-Consumable','talinis','Small',10),(16,'Chocolate moist',0,399,'Food','deliciouso','Medium',0),(17,'Egg',49,50,'Consumable','test','Pack',10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productconversion`
--

DROP TABLE IF EXISTS `productconversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productconversion` (
  `productid` int(11) NOT NULL,
  `pieces` int(11) DEFAULT NULL,
  `cups` int(11) DEFAULT NULL,
  `tbsps` int(11) DEFAULT NULL,
  `tsps` int(11) DEFAULT NULL,
  `grams` int(11) DEFAULT NULL,
  `ml` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `pc_productid_idx` (`productid`),
  CONSTRAINT `pc_productid` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productconversion`
--

LOCK TABLES `productconversion` WRITE;
/*!40000 ALTER TABLE `productconversion` DISABLE KEYS */;
INSERT INTO `productconversion` VALUES (2,12,8,20,0,0,0),(3,12,8,20,0,0,0),(4,12,8,20,0,0,0),(7,12,8,20,0,0,0),(8,12,8,20,0,0,0),(9,12,8,20,0,0,0),(14,12,8,20,0,0,0),(17,12,8,20,0,0,0);
/*!40000 ALTER TABLE `productconversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production` (
  `productionid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `deliveryid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`productionid`),
  KEY `prod_orderid_idx` (`orderid`),
  KEY `prod_deliveryid_idx` (`deliveryid`),
  CONSTRAINT `prod_deliveryid` FOREIGN KEY (`deliveryid`) REFERENCES `delivery` (`deliveryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prod_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (1,10,1,'2017-03-15 07:48:15'),(2,11,2,'2017-03-17 10:04:20'),(3,14,3,'2017-03-17 10:07:38'),(4,55,6,'2017-03-23 21:13:46'),(5,68,8,'2017-03-24 13:42:05');
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productioninventory`
--

DROP TABLE IF EXISTS `productioninventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productioninventory` (
  `productioninventoryid` int(11) NOT NULL AUTO_INCREMENT,
  `transferid` int(11) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`productioninventoryid`,`transferid`),
  KEY `pi_transferid_idx` (`transferid`),
  CONSTRAINT `pi_transferid` FOREIGN KEY (`transferid`) REFERENCES `transfer` (`transferid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productioninventory`
--

LOCK TABLES `productioninventory` WRITE;
/*!40000 ALTER TABLE `productioninventory` DISABLE KEYS */;
INSERT INTO `productioninventory` VALUES (1,0,'Sugar',0,'Pieces'),(2,0,'Sugar',0,'Cups'),(3,0,'Sugar',0,'Tbsps'),(4,0,'Sugar',0,'tsps'),(5,0,'Sugar',0,'grams'),(6,0,'Sugar',0,'ml'),(7,0,'Flour',0,'Pieces'),(8,0,'Flour',0,'Cups'),(9,0,'Flour',0,'Tbsps'),(10,0,'Flour',0,'tsps'),(11,0,'Flour',0,'grams'),(12,0,'Flour',0,'ml'),(13,0,'Butter',0,'Pieces'),(14,0,'Butter',0,'Cups'),(15,0,'Butter',0,'Tbsps'),(16,0,'Butter',0,'tsps'),(17,0,'Butter',0,'grams'),(18,0,'Butter',0,'ml'),(19,0,'Butter',0,'Tbsps'),(20,1,'Flour',0,'Cups'),(21,2,'Sugar',0,'Cups'),(22,3,'Sugar',10,'Cups'),(23,4,'Butter',0,'Tbsps'),(24,5,'Flour',0,'Cups'),(25,0,'Cream',0,'Pieces'),(26,0,'Cream',0,'Cups'),(27,0,'Cream',0,'Tbsps'),(28,0,'Cream',0,'tsps'),(29,0,'Cream',0,'grams'),(30,0,'Cream',0,'ml'),(31,0,'Strawberry Powder',0,'Pieces'),(32,0,'Strawberry Powder',0,'Cups'),(33,0,'Strawberry Powder',0,'Tbsps'),(34,0,'Strawberry Powder',0,'tsps'),(35,0,'Strawberry Powder',0,'grams'),(36,0,'Strawberry Powder',0,'ml'),(37,0,'Chocolate Powder',0,'Pieces'),(38,0,'Chocolate Powder',0,'Cups'),(39,0,'Chocolate Powder',0,'Tbsps'),(40,0,'Chocolate Powder',0,'tsps'),(41,0,'Chocolate Powder',0,'grams'),(42,0,'Chocolate Powder',0,'ml'),(43,0,'Corn Starch',0,'Pieces'),(44,0,'Corn Starch',0,'Cups'),(45,0,'Corn Starch',0,'Tbsps'),(46,0,'Corn Starch',0,'tsps'),(47,0,'Corn Starch',0,'grams'),(48,0,'Corn Starch',0,'ml'),(49,6,'Corn Starch',21,'Cups'),(50,7,'Cream',2600,'grams'),(51,8,'Chocolate Powder',21,'Cups'),(52,9,'Flour',32,'Cups'),(53,0,'Product1',0,'Pieces'),(54,0,'Product1',0,'Cups'),(55,0,'Product1',0,'Tbsps'),(56,0,'Product1',0,'tsps'),(57,0,'Product1',0,'grams'),(58,0,'Product1',0,'ml'),(59,10,'Flour',8,'Cups'),(60,11,'Butter',14,'Tbsps'),(61,12,'Sugar',8,'Cups'),(62,13,'Flour',20,'Tbsps');
/*!40000 ALTER TABLE `productioninventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productioninventory_report`
--

DROP TABLE IF EXISTS `productioninventory_report`;
/*!50001 DROP VIEW IF EXISTS `productioninventory_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `productioninventory_report` AS SELECT 
 1 AS `productioninventoryid`,
 1 AS `transferid`,
 1 AS `productname`,
 1 AS `SUM(quantity)`,
 1 AS `unit`,
 1 AS `Out by Production`,
 1 AS `Expired`,
 1 AS `Damaged`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productionline`
--

DROP TABLE IF EXISTS `productionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productionline` (
  `productionlineid` int(11) NOT NULL AUTO_INCREMENT,
  `productionid` int(11) NOT NULL,
  `productioninventoryid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`productionlineid`),
  KEY `prl_pinventoryid_idx` (`productioninventoryid`),
  KEY `prl_productionid_idx` (`productionid`),
  CONSTRAINT `prl_pinventoryid` FOREIGN KEY (`productioninventoryid`) REFERENCES `productioninventory` (`productioninventoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prl_productionid` FOREIGN KEY (`productionid`) REFERENCES `production` (`productionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionline`
--

LOCK TABLES `productionline` WRITE;
/*!40000 ALTER TABLE `productionline` DISABLE KEYS */;
INSERT INTO `productionline` VALUES (1,1,19,5),(2,1,20,2),(3,1,21,1),(4,2,19,5),(5,2,20,2),(6,2,21,1),(7,3,23,25),(8,3,20,4),(9,3,21,5),(10,3,24,6),(11,4,49,3),(12,4,24,2),(13,4,51,3),(14,4,50,300),(15,4,52,1),(16,5,23,4),(17,5,52,4),(18,5,22,2),(19,5,60,6);
/*!40000 ALTER TABLE `productionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productionstockout`
--

DROP TABLE IF EXISTS `productionstockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productionstockout` (
  `proinvstockoutid` int(11) NOT NULL AUTO_INCREMENT,
  `productioninventoryid` int(11) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`proinvstockoutid`),
  KEY `prodso_productioninventoryid_idx` (`productioninventoryid`),
  CONSTRAINT `prodso_productioninventoryid` FOREIGN KEY (`productioninventoryid`) REFERENCES `productioninventory` (`productioninventoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionstockout`
--

LOCK TABLES `productionstockout` WRITE;
/*!40000 ALTER TABLE `productionstockout` DISABLE KEYS */;
INSERT INTO `productionstockout` VALUES (1,19,'Butter','Tbsps',5,'Production','2017-03-15 07:48:15'),(2,20,'Flour','Cups',2,'Production','2017-03-15 07:48:15'),(3,21,'Sugar','Cups',1,'Production','2017-03-15 07:48:16'),(4,19,'Butter','Tbsps',5,'Production','2017-03-17 10:04:20'),(5,20,'Flour','Cups',2,'Production','2017-03-17 10:04:20'),(6,21,'Sugar','Cups',1,'Production','2017-03-17 10:04:21'),(7,23,'Butter','Tbsps',25,'Production','2017-03-17 10:07:38'),(8,20,'Flour','Cups',4,'Production','2017-03-17 10:07:38'),(9,21,'Sugar','Cups',5,'Production','2017-03-17 10:07:38'),(10,24,'Flour','Cups',6,'Production','2017-03-17 10:07:38'),(11,21,'Sugar','Cups',1,'Damaged','2017-03-19 10:18:56'),(12,22,'Sugar','Cups',9,'Damaged','2017-03-19 10:18:56'),(13,23,'Butter','Tbsps',1,'Damaged','2017-03-20 19:08:32'),(14,22,'Sugar','Cups',3,'Expired','2017-03-20 19:08:32'),(15,49,'Corn Starch','Cups',3,'Production','2017-03-23 21:13:46'),(16,24,'Flour','Cups',2,'Production','2017-03-23 21:13:46'),(17,51,'Chocolate Powder','Cups',3,'Production','2017-03-23 21:13:46'),(18,50,'Cream','grams',300,'Production','2017-03-23 21:13:47'),(19,52,'Flour','Cups',1,'Production','2017-03-23 21:13:47'),(20,50,'Cream','grams',100,'Damaged','2017-03-23 23:47:38'),(21,23,'Butter','Tbsps',4,'Production','2017-03-24 13:42:05'),(22,52,'Flour','Cups',4,'Production','2017-03-24 13:42:05'),(23,22,'Sugar','Cups',2,'Production','2017-03-24 13:42:05'),(24,60,'Butter','Tbsps',6,'Production','2017-03-24 13:42:06'),(25,52,'Flour','Cups',3,'Damaged','2017-03-24 13:54:07');
/*!40000 ALTER TABLE `productionstockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasedetails`
--

DROP TABLE IF EXISTS `purchasedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasedetails` (
  `pdid` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalquantity` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`pdid`),
  KEY `pd_purchaseid_idx` (`purchaseid`),
  CONSTRAINT `pd_purchaseid` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedetails`
--

LOCK TABLES `purchasedetails` WRITE;
/*!40000 ALTER TABLE `purchasedetails` DISABLE KEYS */;
INSERT INTO `purchasedetails` VALUES (1,1,1,30,40,4000),(2,2,1,90,90,4000),(3,3,2,85,75,4000),(4,3,3,25,25,2250),(5,3,4,30,25,1950),(6,4,8,0,50,2000),(7,4,7,0,30,1500),(8,5,1,20,30,1200),(9,6,7,14,100,5000),(10,7,1,0,3,120),(11,8,14,50,100,2500),(12,9,9,0,50,2350),(13,10,2,0,10,400),(14,11,4,5,10,390),(15,11,3,6,10,450),(16,11,17,5,10,490);
/*!40000 ALTER TABLE `purchasedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorder` (
  `purchaseid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `total` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`purchaseid`),
  KEY `po_staffid_idx` (`staffid`),
  KEY `po_supplierid_idx` (`supplierid`),
  CONSTRAINT `po_staffid` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `po_supplierid` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`supplierid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,1,1,'4000','2017-03-14 19:18:06'),(2,1,1,'4000','2017-03-14 19:53:28'),(3,1,1,'8200','2017-03-15 07:45:00'),(4,1,5,'3500','2017-03-19 12:22:06'),(5,1,2,'1200','2017-03-20 11:54:34'),(6,1,4,'5000','2017-03-20 11:55:16'),(7,1,1,'120','2017-05-02 16:01:26'),(8,1,6,'2500','2017-03-23 20:50:45'),(9,1,6,'2350','2017-03-23 21:08:04'),(10,1,1,'400','2017-03-24 12:03:16'),(11,1,6,'1330','2017-03-24 13:32:25');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `returnlineid` int(11) NOT NULL,
  `amount` double NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`refid`),
  KEY `ref_returnlineid_idx` (`returnlineid`),
  CONSTRAINT `ref_returnlineid` FOREIGN KEY (`returnlineid`) REFERENCES `returnline` (`returnlineid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,2,450,'2017-03-14 07:25:52'),(2,5,450,'2017-03-14 07:30:34'),(3,8,450,'2017-03-14 07:36:23'),(4,9,450,'2017-03-14 08:00:34'),(5,10,225,'2017-03-14 08:03:48'),(6,13,90,'2017-03-19 08:52:47'),(7,26,45,'2017-03-23 09:22:16'),(8,27,180,'2017-03-24 12:16:33'),(9,28,135,'2017-03-24 12:32:20'),(10,29,45,'2017-03-24 02:00:09'),(11,31,100,'2017-03-24 02:00:09');
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return`
--

DROP TABLE IF EXISTS `return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return` (
  `returnid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `returntotal` double NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`returnid`),
  KEY `returns_orderid_idx` (`orderid`),
  CONSTRAINT `returns_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return`
--

LOCK TABLES `return` WRITE;
/*!40000 ALTER TABLE `return` DISABLE KEYS */;
INSERT INTO `return` VALUES (1,1,450,'2017-03-14 19:18:49'),(2,2,450,'2017-03-14 19:25:46'),(3,3,450,'2017-03-14 19:26:44'),(4,3,450,'2017-03-14 19:29:04'),(5,3,450,'2017-03-14 19:30:28'),(6,1,450,'2017-03-14 19:30:48'),(7,4,0,'2017-03-14 19:31:56'),(8,5,450,'2017-03-14 19:36:15'),(9,7,450,'2017-03-14 20:00:27'),(10,0,0,'2017-03-14 20:02:03'),(11,0,0,'2017-03-14 20:03:18'),(12,8,225,'2017-03-14 20:03:40'),(13,0,0,'2017-03-17 14:10:47'),(14,0,0,'2017-03-19 20:11:16'),(15,15,0,'2017-03-19 20:12:54'),(16,0,0,'2017-03-19 20:16:30'),(17,15,0,'2017-03-19 20:16:55'),(18,16,240,'2017-03-19 20:51:37'),(19,17,65,'2017-03-19 21:18:40'),(20,18,220,'2017-03-19 21:20:37'),(21,48,45,'2017-05-02 16:08:08'),(22,50,45,'2017-03-23 10:25:30'),(23,50,45,'2017-03-23 10:27:24'),(24,50,45,'2017-03-23 10:30:35'),(25,0,0,'2017-03-23 15:53:38'),(26,0,0,'2017-03-23 15:54:06'),(27,34,45,'2017-03-23 18:52:37'),(28,0,0,'2017-03-23 21:14:37'),(29,54,300,'2017-03-23 21:15:57'),(30,56,45,'2017-03-23 21:20:12'),(31,57,45,'2017-03-23 21:21:21'),(32,66,180,'2017-03-24 12:15:31'),(33,67,135,'2017-03-24 12:32:06'),(34,69,190,'2017-03-24 13:57:33');
/*!40000 ALTER TABLE `return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnline`
--

DROP TABLE IF EXISTS `returnline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnline` (
  `returnlineid` int(11) NOT NULL AUTO_INCREMENT,
  `returnid` int(11) NOT NULL,
  `orderlineid` int(11) NOT NULL,
  `productstatus` varchar(45) NOT NULL DEFAULT 'Good',
  `returntype` varchar(45) NOT NULL DEFAULT 'Replace',
  `quantityreturned` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `action` varchar(45) NOT NULL DEFAULT 'Throw',
  PRIMARY KEY (`returnlineid`),
  KEY `returnline_returnid_idx` (`returnid`),
  CONSTRAINT `returnline_returnid` FOREIGN KEY (`returnid`) REFERENCES `return` (`returnid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnline`
--

LOCK TABLES `returnline` WRITE;
/*!40000 ALTER TABLE `returnline` DISABLE KEYS */;
INSERT INTO `returnline` VALUES (1,1,1,'Good','Refund',10,450,'Re-Stock'),(2,2,2,'Good','Refund',10,450,'Re-Stock'),(3,3,3,'Good','Refund',10,450,'Re-Stock'),(4,4,3,'Good','Refund',10,450,'Re-Stock'),(5,5,3,'Good','Refund',10,450,'Re-Stock'),(6,6,1,'Good','Replace',10,450,'Throw'),(7,7,4,'Damaged','Replace',10,450,'Throw'),(8,8,5,'Damaged','Refund',10,450,'Throw'),(9,9,9,'Good','Refund',10,450,'Re-Stock'),(10,12,10,'Good','Refund',16,225,'Re-Stock'),(11,15,20,'Damaged','Replace',2,90,'Throw'),(12,17,20,'Damaged','Replace',2,90,'Throw'),(13,18,23,'Good','Refund',2,90,'Re-Stock'),(14,18,24,'Damaged','Replace',1,50,'Throw'),(15,19,25,'Damaged','Replace',1,65,'Throw'),(16,20,26,'Damaged','Replace',2,130,'Throw'),(17,20,27,'Expired','Replace',2,90,'Throw'),(18,21,61,'Damaged','Replace',1,45,'Re-Stock'),(19,22,63,'Good','Replace',1,45,'Re-Stock'),(20,23,63,'Good','Replace',1,45,'Re-Stock'),(21,24,63,'Good','Replace',1,45,'Re-Stock'),(22,27,46,'Damaged','Replace',1,45,'Throw'),(23,29,68,'Damaged','Replace',10,300,'Throw'),(24,29,68,'Damaged','Replace',30,240,'Throw'),(25,30,71,'Good','Replace',1,45,'Re-Stock'),(26,31,72,'Good','Refund',1,45,'Re-Stock'),(27,32,81,'Damaged','Refund',4,180,'Throw'),(28,33,85,'Good','Refund',3,135,'Re-Stock'),(29,34,89,'Damaged','Refund',1,45,'Re-Stock'),(30,34,88,'Damaged','Replace',1,45,'Throw'),(31,34,87,'Expired','Refund',2,100,'Throw');
/*!40000 ALTER TABLE `returnline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleinventory`
--

DROP TABLE IF EXISTS `saleinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saleinventory` (
  `saleid` int(11) NOT NULL AUTO_INCREMENT,
  `stockinlineid` int(11) NOT NULL,
  `purchaseid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry` date NOT NULL,
  PRIMARY KEY (`saleid`),
  KEY `si_productid_idx` (`productid`),
  CONSTRAINT `si_productid` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleinventory`
--

LOCK TABLES `saleinventory` WRITE;
/*!40000 ALTER TABLE `saleinventory` DISABLE KEYS */;
INSERT INTO `saleinventory` VALUES (1,0,0,1,0,'2017-03-14 19:17:34','2017-03-14'),(2,0,1,1,0,'2017-03-14 19:18:18','2116-03-14'),(3,0,0,1,0,'2017-03-14 19:18:56','2116-03-14'),(4,0,1,1,0,'2017-03-14 19:25:52','2116-03-14'),(5,0,1,1,0,'2017-03-14 19:26:50','2116-03-14'),(6,0,1,1,0,'2017-03-14 19:29:11','2116-03-14'),(7,0,1,1,0,'2017-03-14 19:30:34','2116-03-14'),(8,0,2,1,0,'2017-03-14 19:53:53','2116-03-14'),(9,0,1,1,0,'2017-03-14 20:00:10','2116-03-14'),(10,0,2,1,0,'2017-03-14 20:00:34','2116-03-14'),(11,0,2,1,0,'2017-03-14 20:03:48','2116-03-14'),(12,0,0,2,0,'2017-03-15 07:39:47','2017-03-15'),(13,0,0,3,0,'2017-03-15 07:40:11','2017-03-15'),(14,0,0,4,0,'2017-03-15 07:41:00','2017-03-15'),(15,0,3,3,0,'2017-03-15 07:45:38','2017-04-14'),(16,0,3,2,0,'2017-03-15 07:45:38','2017-04-14'),(17,0,3,4,0,'2017-03-15 07:45:38','2017-04-14'),(18,0,0,6,0,'2017-03-17 20:39:05','2017-03-17'),(19,0,0,7,0,'2017-03-17 20:39:47','2017-03-17'),(20,0,0,8,0,'2017-03-17 20:40:29','2017-03-17'),(21,0,0,9,0,'2017-03-17 20:40:59','2017-03-17'),(22,0,0,10,0,'2017-03-17 20:42:32','2017-03-17'),(23,0,0,11,0,'2017-03-17 20:43:02','2017-03-17'),(24,0,0,12,0,'2017-03-17 20:43:44','2017-03-17'),(25,0,1,1,0,'2017-03-19 12:18:51','2116-03-19'),(26,0,3,2,0,'2017-03-19 12:20:09','2017-03-19'),(27,0,1,1,0,'2017-03-19 20:52:47','2116-03-19'),(28,0,4,7,0,'2017-03-19 21:17:38','2017-04-18'),(29,0,4,8,0,'2017-03-19 21:17:39','2017-04-18'),(30,0,6,7,0,'2017-03-20 11:55:47','2017-04-22'),(31,0,6,7,0,'2017-03-20 11:56:06','2017-04-30'),(32,0,6,7,0,'2017-03-20 11:59:17','2017-03-20'),(33,0,6,7,0,'2017-03-20 12:04:12','2017-03-24'),(34,20,6,7,0,'2017-03-21 22:42:34','2017-04-20'),(35,21,6,7,0,'2017-03-21 23:08:06','2017-04-20'),(36,22,7,1,0,'2017-05-02 16:02:42','2116-05-02'),(37,23,7,1,0,'2017-05-02 16:03:14','2116-05-02'),(38,24,7,1,0,'2017-05-02 16:04:10','2116-05-02'),(39,25,1,1,0,'2017-03-23 10:27:32','2116-03-23'),(40,26,1,1,0,'2017-03-23 10:30:45','2116-03-23'),(41,27,6,7,16,'2017-03-23 10:59:16','2017-04-22'),(42,0,0,14,0,'2017-03-23 20:44:04','2017-03-23'),(43,0,0,15,0,'2017-03-23 20:45:45','2017-03-23'),(44,28,8,14,0,'2017-03-23 20:51:49','2017-05-31'),(45,29,8,14,0,'2017-03-23 20:53:14','2017-05-31'),(46,30,3,3,0,'2017-03-23 21:07:41','2017-04-29'),(47,31,9,9,39,'2017-03-23 21:08:59','2017-05-31'),(48,32,7,1,0,'2017-03-23 21:20:33','2116-03-23'),(49,33,7,1,0,'2017-03-23 21:22:16','2116-03-23'),(50,0,0,17,0,'2017-03-23 23:22:46','2017-03-23'),(51,34,5,1,6,'2017-03-24 09:01:13','2116-03-24'),(52,35,10,2,8,'2017-03-24 12:03:55','2017-04-24'),(53,36,10,2,0,'2017-03-24 12:04:29','2017-04-23'),(54,37,10,2,1,'2017-03-24 12:06:12','2017-04-23'),(55,38,5,1,3,'2017-03-24 12:32:20','2116-03-24'),(56,39,11,4,2,'2017-03-24 13:33:15','2017-04-23'),(57,40,11,3,1,'2017-03-24 13:33:15','2017-04-23'),(58,41,11,17,5,'2017-03-24 13:33:16','2017-04-23'),(59,42,5,1,1,'2017-03-24 14:00:09','2116-03-24');
/*!40000 ALTER TABLE `saleinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `saleopeningreport`
--

DROP TABLE IF EXISTS `saleopeningreport`;
/*!50001 DROP VIEW IF EXISTS `saleopeningreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `saleopeningreport` AS SELECT 
 1 AS `saleid`,
 1 AS `productid`,
 1 AS `productname`,
 1 AS `productunit`,
 1 AS `SUM(si.quantity)`,
 1 AS `selling_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesreport`
--

DROP TABLE IF EXISTS `salesreport`;
/*!50001 DROP VIEW IF EXISTS `salesreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `salesreport` AS SELECT 
 1 AS `date`,
 1 AS `orderid`,
 1 AS `Customer`,
 1 AS `Orders`,
 1 AS `Total`,
 1 AS `Paid`,
 1 AS `discount`,
 1 AS `Name_exp_8`,
 1 AS `remaining`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `soa`
--

DROP TABLE IF EXISTS `soa`;
/*!50001 DROP VIEW IF EXISTS `soa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `soa` AS SELECT 
 1 AS `date`,
 1 AS `Customer`,
 1 AS `Order`,
 1 AS `Payments`,
 1 AS `paymentid`,
 1 AS `Paid`,
 1 AS `Name_exp_7`,
 1 AS `total`,
 1 AS `remaining`,
 1 AS `-`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `stafftype` varchar(45) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`staffid`,`stafftype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Owner','Owner','a','a','Admin','Active'),(2,'b','b','b','b','Admin','Active');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockin`
--

DROP TABLE IF EXISTS `stockin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockin` (
  `stockinid` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockinid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockin`
--

LOCK TABLES `stockin` WRITE;
/*!40000 ALTER TABLE `stockin` DISABLE KEYS */;
INSERT INTO `stockin` VALUES (1,'2017-03-14 19:18:18'),(2,'2017-03-14 19:18:56'),(3,'2017-03-14 19:25:52'),(4,'2017-03-14 19:26:50'),(5,'2017-03-14 19:29:11'),(6,'2017-03-14 19:30:34'),(7,'2017-03-14 19:53:53'),(8,'2017-03-14 20:00:11'),(9,'2017-03-14 20:00:34'),(10,'2017-03-14 20:03:48'),(11,'2017-03-15 07:45:39'),(12,'2017-03-19 12:18:52'),(13,'2017-03-19 12:20:11'),(14,'2017-03-19 20:52:47'),(15,'2017-03-19 21:17:40'),(16,'2017-03-20 11:55:48'),(17,'2017-03-20 11:56:07'),(18,'2017-03-20 11:59:19'),(19,'2017-03-20 12:04:13'),(20,'2017-03-21 22:42:35'),(21,'2017-03-21 23:08:06'),(22,'2017-05-02 16:02:45'),(23,'2017-05-02 16:03:18'),(24,'2017-05-02 16:04:11'),(25,'2017-03-23 10:27:32'),(26,'2017-03-23 10:30:45'),(27,'2017-03-23 10:59:17'),(28,'2017-03-23 20:51:52'),(29,'2017-03-23 20:53:15'),(30,'2017-03-23 21:07:42'),(31,'2017-03-23 21:09:00'),(32,'2017-03-23 21:20:33'),(33,'2017-03-23 21:22:16'),(34,'2017-03-24 09:01:15'),(35,'2017-03-24 12:03:57'),(36,'2017-03-24 12:04:30'),(37,'2017-03-24 12:06:20'),(38,'2017-03-24 12:32:20'),(39,'2017-03-24 13:33:17'),(40,'2017-03-24 14:00:09');
/*!40000 ALTER TABLE `stockin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockinline`
--

DROP TABLE IF EXISTS `stockinline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockinline` (
  `stockinlineid` int(11) NOT NULL AUTO_INCREMENT,
  `stockinid` int(11) NOT NULL,
  `purchaseid` int(11) NOT NULL,
  `pdid` int(11) NOT NULL,
  `deliverynumber` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `expirydate` date NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockinlineid`),
  KEY `stockin_productid_idx` (`productid`),
  KEY `stockin_stockinid_idx` (`stockinid`),
  KEY `stockin_purchaseid_idx` (`purchaseid`),
  CONSTRAINT `stockin_productid` FOREIGN KEY (`productid`) REFERENCES `saleinventory` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stockin_purchaseid` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stockin_stockinid` FOREIGN KEY (`stockinid`) REFERENCES `stockin` (`stockinid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockinline`
--

LOCK TABLES `stockinline` WRITE;
/*!40000 ALTER TABLE `stockinline` DISABLE KEYS */;
INSERT INTO `stockinline` VALUES (1,1,1,1,1231231,1,'50','2116-03-14','2017-03-14 19:18:18'),(2,3,1,1,1231231,1,'10','2116-03-14','2017-03-14 07:25:52'),(3,6,1,1,1231231,1,'10','2116-03-14','2017-03-14 07:30:34'),(4,7,2,2,312312,1,'15','2116-03-14','2017-03-14 19:53:52'),(5,8,1,1,324234,1,'10','2116-03-14','2017-03-14 20:00:10'),(6,9,2,2,312312,1,'10','2116-03-14','2017-03-14 08:00:34'),(7,10,2,2,312312,1,'16','2116-03-14','2017-03-14 08:03:48'),(8,11,3,4,12312,3,'25','2017-04-14','2017-03-15 07:45:38'),(9,11,3,3,12312,2,'25','2017-04-14','2017-03-15 07:45:38'),(10,11,3,5,12312,4,'25','2017-04-14','2017-03-15 07:45:38'),(11,12,1,1,8686786,1,'10','2116-03-19','2017-03-19 12:18:51'),(12,13,3,3,8856545,2,'5','2017-03-19','2017-03-19 12:20:09'),(13,14,1,1,1231231,1,'2','2116-03-19','2017-03-19 08:52:47'),(14,15,4,7,12312,7,'30','2017-04-18','2017-03-19 21:17:38'),(15,15,4,6,12312,8,'50','2017-04-18','2017-03-19 21:17:39'),(16,16,6,9,102031,7,'10','2017-04-22','2017-03-20 11:55:47'),(17,17,6,9,12312,7,'50','2017-04-30','2017-03-20 11:56:06'),(18,18,6,9,8236123,7,'5','2017-03-20','2017-03-20 11:59:17'),(19,19,6,9,1231728,7,'5','2017-03-24','2017-03-20 12:04:12'),(20,20,6,9,21313,7,'20','2017-04-20','2017-03-21 22:42:34'),(21,21,6,9,123123131,7,'10','2017-04-20','2017-03-21 23:08:06'),(22,22,7,10,1234,1,'2','2116-05-02','2017-05-02 16:02:42'),(23,23,7,10,2222,1,'1','2116-05-02','2017-05-02 16:03:14'),(24,24,7,10,3333,1,'1','2116-05-02','2017-05-02 16:04:10'),(25,25,1,1,1231231,1,'1','2116-03-23','2017-03-23 10:27:32'),(26,26,1,1,1231231,1,'1','2116-03-23','2017-03-23 10:30:45'),(27,27,6,9,2112121,7,'20','2017-04-22','2017-03-23 10:59:16'),(28,28,8,11,1232131231,14,'50','2017-05-31','2017-03-23 20:51:48'),(29,29,8,11,1232131231,14,'3','2017-05-31','2017-03-23 20:53:14'),(30,30,3,4,1321312312,3,'5','2017-04-29','2017-03-23 21:07:41'),(31,31,9,12,1231231231,9,'50','2017-05-31','2017-03-23 21:08:58'),(32,32,7,10,1234,1,'1','2116-03-23','2017-03-23 09:20:33'),(33,33,7,10,1234,1,'1','2116-03-23','2017-03-23 09:22:16'),(34,34,5,8,2342342,1,'10','2116-03-24','2017-03-24 09:01:13'),(35,35,10,13,1111,2,'9','2017-04-24','2017-03-24 12:03:55'),(36,36,10,13,2222,2,'1','2017-04-23','2017-03-24 12:04:29'),(37,37,10,13,2222,2,'1','2017-04-23','2017-03-24 12:06:12'),(38,38,5,8,2342342,1,'3','2116-03-24','2017-03-24 12:32:20'),(39,39,11,14,222222123,4,'5','2017-04-23','2017-03-24 13:33:15'),(40,39,11,15,222222123,3,'5','2017-04-23','2017-03-24 13:33:15'),(41,39,11,16,222222123,17,'5','2017-04-23','2017-03-24 13:33:16'),(42,40,5,8,2342342,1,'1','2116-03-24','2017-03-24 02:00:09');
/*!40000 ALTER TABLE `stockinline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockout`
--

DROP TABLE IF EXISTS `stockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockout` (
  `stockoutid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockoutid`),
  KEY `stockout_saleid_idx` (`productid`),
  CONSTRAINT `stockout_productid` FOREIGN KEY (`productid`) REFERENCES `saleinventory` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockout`
--

LOCK TABLES `stockout` WRITE;
/*!40000 ALTER TABLE `stockout` DISABLE KEYS */;
INSERT INTO `stockout` VALUES (1,1,10,'Sales','2017-03-14 19:18:32'),(2,1,10,'Sales','2017-03-14 19:25:18'),(3,1,10,'Sales','2017-03-14 19:26:33'),(4,1,10,'Good and Replaced','2017-03-14 19:30:55'),(5,1,10,'Sales','2017-03-14 19:31:53'),(6,1,10,'Damaged and Replaced','2017-03-14 19:32:05'),(7,1,10,'Sales','2017-03-14 19:36:03'),(8,1,10,'Sales','2017-03-14 19:42:56'),(9,1,10,'Sales','2017-03-14 19:42:56'),(10,1,10,'Sales','2017-03-14 19:42:57'),(11,1,10,'Sales','2017-03-14 19:54:14'),(12,1,5,'Sales','2017-03-14 20:01:56'),(13,1,10,'Sales','2017-03-14 20:01:57'),(14,1,1,'Sales','2017-03-14 20:01:57'),(15,1,5,'Damaged','2017-03-14 23:24:05'),(16,1,5,'Damaged','2017-03-14 23:26:28'),(17,4,1,'Production','2017-03-15 07:46:08'),(18,3,1,'Production','2017-03-15 07:46:08'),(19,2,1,'Production','2017-03-15 07:46:08'),(20,4,13,'Sales','2017-03-15 17:02:02'),(21,3,15,'Sales','2017-03-15 17:02:02'),(22,2,3,'Production','2017-03-17 10:07:22'),(23,4,3,'Production','2017-03-17 10:07:22'),(24,3,1,'Production','2017-03-17 10:07:22'),(25,2,3,'Sales','2017-03-17 14:10:41'),(26,4,2,'Sales','2017-03-17 14:10:41'),(27,1,1,'Sales','2017-03-17 14:10:41'),(28,2,5,'Expired','2017-03-19 12:20:14'),(29,2,15,'Damaged','2017-03-19 12:24:52'),(30,3,5,'Damaged','2017-03-19 12:24:52'),(31,4,5,'Damaged','2017-03-19 12:36:11'),(32,2,2,'Damaged and Replaced','2017-03-19 20:17:09'),(33,1,5,'Sales','2017-03-19 20:48:22'),(34,3,3,'Sales','2017-03-19 20:48:22'),(35,7,1,'Sales','2017-03-19 21:18:07'),(36,7,1,'Damaged and Replaced','2017-03-19 21:19:26'),(37,7,3,'Sales','2017-03-19 21:20:22'),(38,8,3,'Sales','2017-03-19 21:20:22'),(39,7,2,'Damaged and Replaced','2017-03-19 21:21:05'),(40,8,2,'Expired and Replaced','2017-03-19 21:21:06'),(41,8,4,'Sales','2017-03-19 23:27:12'),(42,7,4,'Sales','2017-03-19 23:27:12'),(43,8,1,'Sales','2017-03-19 23:42:26'),(44,8,10,'Sales','2017-03-19 23:44:29'),(45,7,5,'Expired','2017-03-20 11:59:28'),(46,7,19,'Sales','2017-03-21 09:29:01'),(47,7,10,'Sales','2017-03-21 09:29:01'),(48,7,1,'Sales','2017-03-21 09:29:01'),(49,7,7,'Damaged','2017-03-21 22:54:11'),(50,7,3,'Damaged','2017-03-21 22:54:11'),(51,7,7,'Damaged','2017-03-21 22:58:46'),(52,7,3,'Damaged','2017-03-21 22:58:46'),(53,7,10,'Damaged','2017-03-21 23:07:39'),(54,7,3,'Damaged','2017-03-21 23:10:00'),(55,7,1,'Expired','2017-03-21 23:10:00'),(56,7,1,'Sales','2017-03-21 23:55:01'),(57,8,1,'Sales','2017-03-22 00:01:27'),(58,8,3,'Sales','2017-03-22 00:04:34'),(59,8,2,'Sales','2017-03-22 00:05:23'),(60,7,1,'Sales','2017-03-22 00:10:00'),(61,8,1,'Sales','2017-03-22 00:12:48'),(62,8,1,'Sales','2017-03-22 08:22:34'),(63,8,1,'Sales','2017-03-22 08:25:10'),(64,8,1,'Sales','2017-03-22 08:30:12'),(65,8,1,'Sales','2017-03-22 08:52:00'),(66,8,1,'Sales','2017-03-22 08:53:12'),(67,8,1,'Sales','2017-03-22 08:54:11'),(68,8,1,'Sales','2017-03-22 08:58:05'),(69,8,3,'Sales','2017-03-22 13:07:33'),(70,4,1,'Expired','2017-05-02 15:59:32'),(71,7,4,'Expired','2017-05-02 15:59:32'),(72,7,7,'Expired','2017-05-02 15:59:32'),(73,8,13,'Expired','2017-05-02 15:59:32'),(74,2,1,'Expired','2017-05-02 15:59:32'),(75,1,1,'Damaged','2017-05-02 16:03:43'),(76,1,2,'Sales','2017-05-02 16:06:19'),(77,1,3,'Sales','2017-03-23 09:59:18'),(78,1,1,'Sales','2017-03-23 10:02:34'),(79,1,1,'Good and Replaced','2017-03-23 10:30:45'),(80,7,1,'Sales','2017-03-23 15:00:21'),(81,14,3,'Damaged','2017-03-23 20:52:19'),(82,14,5,'Damaged','2017-03-23 20:54:12'),(83,14,3,'Production','2017-03-23 20:57:46'),(84,7,3,'Production','2017-03-23 20:57:47'),(85,14,39,'Sales','2017-03-23 21:01:55'),(86,14,1,'Sales','2017-03-23 21:01:55'),(87,9,3,'Production','2017-03-23 21:09:36'),(88,3,5,'Production','2017-03-23 21:09:36'),(89,14,2,'Damaged and Replaced','2017-03-23 21:17:00'),(90,1,1,'Sales','2017-03-23 21:18:37'),(91,1,1,'Sales','2017-03-23 21:19:27'),(92,1,1,'Good and Replaced','2017-03-23 21:20:33'),(93,9,3,'Sales','2017-03-24 08:19:19'),(94,9,1,'Sales','2017-03-24 08:24:58'),(95,9,1,'Sales','2017-03-24 08:31:15'),(96,9,1,'Sales','2017-03-24 08:32:08'),(97,2,1,'Damaged','2017-03-24 12:04:54'),(98,1,1,'Sales','2017-03-24 12:13:16'),(99,1,1,'Sales','2017-03-24 12:13:16'),(100,1,1,'Sales','2017-03-24 12:13:16'),(101,1,1,'Sales','2017-03-24 12:13:16'),(102,1,3,'Sales','2017-03-24 12:30:11'),(103,3,1,'Production','2017-03-24 13:37:44'),(104,4,1,'Production','2017-03-24 13:37:44'),(105,2,1,'Production','2017-03-24 13:37:44'),(106,3,1,'Production','2017-03-24 13:48:43'),(107,3,1,'Damaged','2017-03-24 13:52:46'),(108,3,1,'Damaged','2017-03-24 13:53:29'),(109,9,2,'Sales','2017-03-24 13:57:09'),(110,4,1,'Sales','2017-03-24 13:57:09'),(111,1,1,'Sales','2017-03-24 13:57:09'),(112,4,1,'Damaged and Replaced','2017-03-24 14:00:09');
/*!40000 ALTER TABLE `stockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockreturn`
--

DROP TABLE IF EXISTS `stockreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockreturn` (
  `stockreturnid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `purchaseid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`stockreturnid`),
  KEY `pr_staffid_idx` (`staffid`),
  KEY `pr_purchaseid_idx` (`purchaseid`),
  CONSTRAINT `pr_purchaseid` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pr_staffid` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockreturn`
--

LOCK TABLES `stockreturn` WRITE;
/*!40000 ALTER TABLE `stockreturn` DISABLE KEYS */;
INSERT INTO `stockreturn` VALUES (1,1,3,'2017-03-19 12:36:11'),(2,1,6,'2017-03-21 22:54:11'),(3,1,6,'2017-03-21 22:58:45'),(4,1,6,'2017-03-21 23:07:39'),(5,1,6,'2017-03-21 23:10:00'),(6,1,7,'2017-05-02 16:03:43'),(7,1,8,'2017-03-23 20:52:18'),(8,1,10,'2017-03-24 12:04:54'),(9,1,11,'2017-03-24 13:52:46');
/*!40000 ALTER TABLE `stockreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockreturnline`
--

DROP TABLE IF EXISTS `stockreturnline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockreturnline` (
  `stockreturnlineid` int(11) NOT NULL AUTO_INCREMENT,
  `stockreturnid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stockreturnlineid`),
  KEY `srl_stockreturnid_idx` (`stockreturnid`),
  KEY `srl_productid_idx` (`productid`),
  CONSTRAINT `srl_productid` FOREIGN KEY (`productid`) REFERENCES `saleinventory` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `srl_stockreturnid` FOREIGN KEY (`stockreturnid`) REFERENCES `stockreturn` (`stockreturnid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockreturnline`
--

LOCK TABLES `stockreturnline` WRITE;
/*!40000 ALTER TABLE `stockreturnline` DISABLE KEYS */;
INSERT INTO `stockreturnline` VALUES (1,1,4,6,'Damaged'),(2,2,7,7,'Damaged'),(3,2,7,7,'Damaged'),(4,3,7,7,'Damaged'),(5,3,7,3,'Damaged'),(6,4,7,10,'Damaged'),(7,5,7,3,'Damaged'),(8,5,7,1,'Expired'),(9,6,1,1,'Damaged'),(10,7,14,3,'Damaged'),(11,8,2,1,'Damaged'),(12,9,3,1,'Damaged');
/*!40000 ALTER TABLE `stockreturnline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierid` int(11) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(45) NOT NULL,
  `suppliercontact` varchar(45) NOT NULL,
  `supplieraddress` varchar(45) NOT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Gaisano','09123817263','Bajada'),(2,'Amoren Foods','01923162567','Laverna'),(3,'Victoria Plaza','09190283917','Bajada Obrero'),(4,'SM Lanang','09123812397','Lanang Damosa'),(5,'Tepco','01923812381','Cabantian'),(6,'Amorson','09446546465','Indangan Davao City');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `transferid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `salequantity` varchar(45) NOT NULL,
  `converted_quantity` int(11) NOT NULL,
  `converted_unit` varchar(45) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferid`),
  KEY `transfer_productid_idx` (`productname`),
  KEY `trans_productid_idx` (`productid`),
  CONSTRAINT `trans_productid` FOREIGN KEY (`productid`) REFERENCES `saleinventory` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,4,'Butter','1',10,'Tbsps','2017-03-19 10:06:27'),(2,3,'Flour','1',8,'Cups','2017-03-19 10:06:27'),(3,2,'Sugar','1',8,'Cups','2017-03-19 10:06:27'),(4,2,'Sugar','3',24,'Cups','2017-03-19 10:06:27'),(5,4,'Butter','3',30,'Tbsps','2017-03-19 10:06:27'),(6,3,'Flour','1',8,'Cups','2017-03-19 10:06:27'),(7,14,'Corn Starch','3',24,'Cups','2017-03-23 20:57:47'),(8,7,'Cream','3',3000,'grams','2017-03-23 20:57:47'),(9,9,'Chocolate Powder','3',24,'Cups','2017-03-23 21:09:36'),(10,3,'Flour','5',40,'Cups','2017-03-23 21:09:36'),(11,3,'Flour','1',8,'Cups','2017-03-24 13:37:44'),(12,4,'Butter','1',20,'Tbsps','2017-03-24 13:37:44'),(13,2,'Sugar','1',8,'Cups','2017-03-24 13:37:44'),(14,3,'Flour','1',20,'Tbsps','2017-03-24 13:48:43');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `productioninventory_report`
--

/*!50001 DROP VIEW IF EXISTS `productioninventory_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productioninventory_report` AS select `pi`.`productioninventoryid` AS `productioninventoryid`,`pi`.`transferid` AS `transferid`,`pi`.`productname` AS `productname`,sum(`pi`.`quantity`) AS `SUM(quantity)`,`pi`.`unit` AS `unit`,(select sum(`ps`.`quantity`) from `productionstockout` `ps` where ((`ps`.`reason` = 'Production') and (`pi`.`productname` = `ps`.`productname`) and (`pi`.`unit` = `ps`.`unit`))) AS `Out by Production`,(select sum(`ps`.`quantity`) from `productionstockout` `ps` where ((`ps`.`reason` = 'Expired') and (`pi`.`productname` = `ps`.`productname`) and (`pi`.`unit` = `ps`.`unit`))) AS `Expired`,(select sum(`ps`.`quantity`) from `productionstockout` `ps` where ((`ps`.`reason` = 'Damaged') and (`pi`.`productname` = `ps`.`productname`) and (`pi`.`unit` = `ps`.`unit`))) AS `Damaged` from `productioninventory` `pi` where (`pi`.`quantity` > 0) group by `pi`.`productname`,`pi`.`unit` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `saleopeningreport`
--

/*!50001 DROP VIEW IF EXISTS `saleopeningreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `saleopeningreport` AS select `si`.`saleid` AS `saleid`,`si`.`productid` AS `productid`,`p`.`productname` AS `productname`,`p`.`productunit` AS `productunit`,sum(`si`.`quantity`) AS `SUM(si.quantity)`,`p`.`selling_price` AS `selling_price` from (`saleinventory` `si` join `product` `p`) where (`si`.`productid` = `p`.`productid`) group by `p`.`productid` order by `p`.`productname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesreport`
--

/*!50001 DROP VIEW IF EXISTS `salesreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesreport` AS select `orders`.`date` AS `date`,`p`.`orderid` AS `orderid`,concat(`customer`.`lastname`,', ',`customer`.`firstname`) AS `Customer`,group_concat(distinct concat(`ol`.`quantity`,' ',`ol`.`productname`) separator ',') AS `Orders`,`orders`.`total` AS `Total`,`p`.`amount` AS `Paid`,`orders`.`discount` AS `discount`,'' AS `Name_exp_8`,`p`.`remaining` AS `remaining`,`p`.`type` AS `type` from (((`orders` join `customer`) join `payments` `p`) join `orderline` `ol`) where ((`orders`.`type` <> 'Delivery') and (`orders`.`customerid` = `customer`.`customerid`) and (`orders`.`orderid` = `p`.`orderid`) and (`orders`.`orderid` = `ol`.`orderid`) and (`p`.`orderid` = `ol`.`orderid`)) group by `p`.`orderid` union all select `orders`.`date` AS `date`,`p`.`orderid` AS `orderid`,'Walk-in' AS `Walk-in`,group_concat(distinct concat(`ol`.`quantity`,' ',`ol`.`productname`) separator ',') AS `Orders`,`orders`.`total` AS `Total`,`p`.`amount` AS `Paid`,`orders`.`discount` AS `discount`,'' AS `Name_exp_18`,`p`.`remaining` AS `remaining`,`p`.`type` AS `type` from ((`orders` join `payments` `p`) join `orderline` `ol`) where ((`orders`.`type` <> 'Delivery') and (`orders`.`customerid` = 0) and (`orders`.`orderid` = `p`.`orderid`) and (`orders`.`orderid` = `ol`.`orderid`) and (`p`.`orderid` = `ol`.`orderid`)) group by `p`.`orderid` order by `date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `soa`
--

/*!50001 DROP VIEW IF EXISTS `soa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `soa` AS select `t`.`date` AS `date`,`t`.`Customer` AS `Customer`,`t`.`Order` AS `Order`,`t`.`Payments` AS `Payments`,`t`.`paymentid` AS `paymentid`,`t`.`Paid` AS `Paid`,`t`.`Name_exp_7` AS `Name_exp_7`,`t`.`total` AS `total`,`t`.`remaining` AS `remaining`,`t`.`-` AS `-` from (select `creamsncrumbs`.`orders`.`date` AS `date`,concat(`creamsncrumbs`.`customer`.`lastname`,', ',`creamsncrumbs`.`customer`.`firstname`) AS `Customer`,group_concat(distinct concat(`ol`.`quantity`,' ',`ol`.`productname`) separator ',') AS `Order`,'' AS `Payments`,`p`.`paymentid` AS `paymentid`,`p`.`amount` AS `Paid`,'' AS `Name_exp_7`,`creamsncrumbs`.`orders`.`total` AS `total`,`p`.`remaining` AS `remaining`,'-' AS `-` from (((`creamsncrumbs`.`orders` join `creamsncrumbs`.`customer`) join `creamsncrumbs`.`payments` `p`) join `creamsncrumbs`.`orderline` `ol`) where ((`creamsncrumbs`.`orders`.`customerid` = `creamsncrumbs`.`customer`.`customerid`) and (`creamsncrumbs`.`orders`.`orderid` = `p`.`orderid`) and (`creamsncrumbs`.`orders`.`orderid` = `ol`.`orderid`) and (`p`.`orderid` = `ol`.`orderid`)) group by `creamsncrumbs`.`orders`.`orderid` union all select '' AS `Name_exp_11`,concat(`c`.`lastname`,', ',`c`.`firstname`) AS `CONCAT(c.lastname, ', ', c.firstname)`,'' AS `Name_exp_13`,'Payment' AS `Payment`,`p`.`paymentid` AS `paymentid`,`p`.`payment` AS `payment`,`p`.`date` AS `date`,'' AS `Name_exp_18`,'' AS `Name_exp_19`,`p`.`paychange` AS `paychange` from (`creamsncrumbs`.`paymentline` `p` join `creamsncrumbs`.`customer` `c`) where (`p`.`customerid` = `c`.`customerid`) order by `paymentid`,`date`) `t` order by `t`.`paymentid` desc,`t`.`date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-11 13:19:04
