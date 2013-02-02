-- MySQL dump 10.13  Distrib 5.1.52, for Win32 (ia32)
--
-- Host: localhost    Database: housing
-- ------------------------------------------------------
-- Server version	5.1.52-community

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `idaccess` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `passwd` varchar(16) DEFAULT NULL,
  `user_type` int(11) NOT NULL,
  PRIMARY KEY (`idaccess`),
  UNIQUE KEY `User_Name_UNIQUE` (`username`),
  KEY `type_idx` (`user_type`),
  CONSTRAINT `type` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`idtype`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'Administrator','admin',1),(2,'user01','a1b2c3',2),(3,'user02','user',2),(4,'user03','12ab',2),(5,'user04','34bc',2);
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `idaddress` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `building` int(11) NOT NULL,
  `flat` int(11) NOT NULL,
  PRIMARY KEY (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Пушкина',1,1),(2,'Пушкина',1,2),(3,'Пушкина',2,1),(4,'Пушкина',2,2);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `idprofession` int(11) NOT NULL AUTO_INCREMENT,
  `nameprof` varchar(30) NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
INSERT INTO `profession` VALUES (1,'бригадир'),(2,'столяр'),(3,'сантехник'),(4,'сварщик'),(5,'электрик'),(6,'маляр-штукатур');
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `idrequest` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` date DEFAULT NULL,
  `work_type` int(11) NOT NULL,
  `order_fulfillment` date DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `approved` varchar(10) NOT NULL DEFAULT 'wait app',
  PRIMARY KEY (`idrequest`),
  KEY `id_idx` (`userid`),
  KEY `typewrk_idx` (`work_type`),
  CONSTRAINT `id` FOREIGN KEY (`userid`) REFERENCES `users` (`idusers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `typewrk` FOREIGN KEY (`work_type`) REFERENCES `work_type` (`idworktype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'2013-01-13',1,'2013-01-28',1,'approve'),(2,'2013-01-20',5,'2013-01-22',1,'approve'),(3,'2013-01-25',5,'2013-01-03',1,'wait app'),(4,'2013-01-27',8,'2013-01-29',1,'approve'),(5,'2013-01-27',1,'2013-01-28',1,'approve'),(6,'2013-01-30',4,'2013-01-31',1,'approve'),(7,'2013-02-02',2,'2013-02-05',1,'wait app'),(8,'2013-02-03',7,'2013-02-15',1,'approve');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `idtype` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(45) NOT NULL,
  PRIMARY KEY (`idtype`),
  UNIQUE KEY `Type_UNIQUE` (`typename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'administrator'),(2,'user');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` int(11) NOT NULL,
  `authorization` int(11) NOT NULL,
  PRIMARY KEY (`idusers`),
  KEY `address_idx` (`address`),
  KEY `login_idx` (`authorization`),
  CONSTRAINT `address` FOREIGN KEY (`address`) REFERENCES `address` (`idaddress`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `login` FOREIGN KEY (`authorization`) REFERENCES `access` (`idaccess`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Александр','Петров',1,2),(2,'Олег','Добрынин',2,3),(3,'Сергей','Палин',3,4),(4,'Денис','Павлов',4,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_plan`
--

DROP TABLE IF EXISTS `work_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_plan` (
  `idplan` int(11) NOT NULL AUTO_INCREMENT,
  `foreman` int(11) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `plan_date` date DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  PRIMARY KEY (`idplan`),
  KEY `foreman_idx` (`foreman`),
  KEY `work_addr_idx` (`address`),
  KEY `worker_idx` (`worker`),
  CONSTRAINT `foreman` FOREIGN KEY (`foreman`) REFERENCES `workers` (`idworker`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worker` FOREIGN KEY (`worker`) REFERENCES `workers` (`idworker`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `work_addr` FOREIGN KEY (`address`) REFERENCES `users` (`address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_plan`
--

LOCK TABLES `work_plan` WRITE;
/*!40000 ALTER TABLE `work_plan` DISABLE KEYS */;
INSERT INTO `work_plan` VALUES (4,1,1,'2013-01-28',15),(7,16,1,'2013-01-28',16),(8,7,1,'2013-01-22',7),(9,1,1,'2013-01-31',10),(10,2,1,'2013-01-29',4),(11,4,1,'2013-02-15',4);
/*!40000 ALTER TABLE `work_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_type` (
  `idworktype` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `worker` int(11) NOT NULL,
  PRIMARY KEY (`idworktype`),
  KEY `who_idx` (`worker`),
  CONSTRAINT `who` FOREIGN KEY (`worker`) REFERENCES `profession` (`idprofession`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_type`
--

LOCK TABLES `work_type` WRITE;
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
INSERT INTO `work_type` VALUES (1,'покраска стен',6),(2,'штукатурка стен',6),(3,'ремонт проводки',5),(4,'сварные работы',4),(5,'замена крана',3),(6,'подключение стиральной машинки',3),(7,'укладка ламината',2),(8,'установка дверей',2);
/*!40000 ALTER TABLE `work_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_request`
--

DROP TABLE IF EXISTS `worker_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idworker` int(11) DEFAULT NULL,
  `idrequest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_request`
--

LOCK TABLES `worker_request` WRITE;
/*!40000 ALTER TABLE `worker_request` DISABLE KEYS */;
INSERT INTO `worker_request` VALUES (7,15,1),(8,1,1),(13,16,5),(14,7,2),(15,10,6),(16,1,6),(17,4,4),(18,2,4),(19,4,8);
/*!40000 ALTER TABLE `worker_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `idworker` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `profession` int(11) NOT NULL COMMENT 'This is a worker profession.',
  `busy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idworker`),
  KEY `prof_idx` (`profession`),
  CONSTRAINT `prof` FOREIGN KEY (`profession`) REFERENCES `profession` (`idprofession`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Олег','Бобров',1,1),(2,'Игорь','Уткин',1,1),(3,'Петр','Зуев',2,0),(4,'Андрей','Митар',2,1),(5,'Сергеи','Петров',2,0),(6,'Игорь','Петров',3,0),(7,'Олег','Зайцев',3,1),(8,'Алексей','Демин',3,0),(9,'Александр','Петров',4,0),(10,'Артем','Барс',4,1),(11,'Владлен','Карпов',4,0),(12,'Владислав','Земин',5,0),(13,'Андрей','Вронский',5,0),(14,'Александр','Вронский',5,0),(15,'Иван','Коровьев',6,1),(16,'Остап','Кирин',6,1),(17,'Ольга','Сидорова',6,0),(18,'Анна','Исаева',6,0);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-03  0:51:16
