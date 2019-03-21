-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `class_dict`
--

DROP TABLE IF EXISTS `class_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_dict` (
  `class_id` varchar(30) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_dict`
--

LOCK TABLES `class_dict` WRITE;
/*!40000 ALTER TABLE `class_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_info`
--

DROP TABLE IF EXISTS `lecturer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturer_info` (
  `lecturer_id` int(11) NOT NULL,
  `lecturer_email` varchar(100) NOT NULL,
  `lecturer_name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_info`
--

LOCK TABLES `lecturer_info` WRITE;
/*!40000 ALTER TABLE `lecturer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_table`
--

DROP TABLE IF EXISTS `lesson_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_table` (
  `lession_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(30) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`lession_id`),
  KEY `FK_class_id_idx` (`class_id`),
  KEY `FK_lecture_id_idx` (`lecturer_id`),
  KEY `FK_right_id_idx` (`right_id`),
  CONSTRAINT `FK_class_id` FOREIGN KEY (`class_id`) REFERENCES `class_dict` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lecture_id` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer_info` (`lecturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_right_id` FOREIGN KEY (`right_id`) REFERENCES `right_table` (`right_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_table`
--

LOCK TABLES `lesson_table` WRITE;
/*!40000 ALTER TABLE `lesson_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark_table`
--

DROP TABLE IF EXISTS `mark_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark_table` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assignment` int(11) NOT NULL,
  `marks` float NOT NULL,
  `max_mark` float NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`mark_id`),
  KEY `FK_tutor_lesson_id_idx` (`tutor_lesson_id`),
  KEY `FK_student_id_idx` (`student_id`),
  CONSTRAINT `FK_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_lesson_id` FOREIGN KEY (`tutor_lesson_id`) REFERENCES `tutor_lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark_table`
--

LOCK TABLES `mark_table` WRITE;
/*!40000 ALTER TABLE `mark_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mark_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_table`
--

DROP TABLE IF EXISTS `record_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_table` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_date` datetime NOT NULL,
  `detail` text NOT NULL,
  `operator` varchar(45) NOT NULL,
  `operator_type` int(11) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_table`
--

LOCK TABLES `record_table` WRITE;
/*!40000 ALTER TABLE `record_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_table`
--

DROP TABLE IF EXISTS `right_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `right_table` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_name` varchar(50) NOT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_table`
--

LOCK TABLES `right_table` WRITE;
/*!40000 ALTER TABLE `right_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `right_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `student_surname` varchar(30) NOT NULL,
  `student_givenname` varchar(30) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_info`
--

LOCK TABLES `student_info` WRITE;
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_info`
--

DROP TABLE IF EXISTS `tutor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_info` (
  `tutor_id` int(11) NOT NULL,
  `tutor_email` varchar(100) NOT NULL,
  `tutor_phone` varchar(20) DEFAULT NULL,
  `tutor_name` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`tutor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_info`
--

LOCK TABLES `tutor_info` WRITE;
/*!40000 ALTER TABLE `tutor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_lesson`
--

DROP TABLE IF EXISTS `tutor_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(11) NOT NULL,
  `lession_id` int(11) NOT NULL,
  `tutor_right_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tutor_id_idx` (`tutor_id`),
  KEY `FK_lesson_id_idx` (`lession_id`),
  KEY `FK_tutor_right_id_idx` (`tutor_right_id`),
  CONSTRAINT `FK_lesson_id` FOREIGN KEY (`lession_id`) REFERENCES `lesson_table` (`lession_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_id` FOREIGN KEY (`tutor_id`) REFERENCES `tutor_info` (`tutor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_right_id` FOREIGN KEY (`tutor_right_id`) REFERENCES `right_table` (`right_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_lesson`
--

LOCK TABLES `tutor_lesson` WRITE;
/*!40000 ALTER TABLE `tutor_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_lesson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-21 17:16:52
