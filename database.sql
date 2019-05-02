/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.25-log : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `project`;

/*Table structure for table `class_dict` */

DROP TABLE IF EXISTS `class_dict`;

CREATE TABLE `class_dict` (
  `class_id` varchar(30) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class_dict` */

insert  into `class_dict`(`class_id`,`class_name`) values ('COMP90007','Internet Technologies'),('COMP90015','Distributed Systems'),('COMP90018','Mobile Computing Systems Programming'),('COMP90038','Algorithms and Complexity'),('COMP90041','Programming and Software Development'),('COMP90042','Web Search and Text Analysis'),('COMP90043',' Cryptography and Security'),('COMP90049','Knowledge Technologies'),('COMP90050','Advanced Database Systems'),('COMP90051','Statistical Machine Learning'),('COMP90054','AI Planning for Autonomy'),('COMP90055','Computing Project'),('COMP90056','Stream Computing and Applications'),('INFO90002',' Database Systems & Information Modelling'),('SWEN90016','Software Processes and Management');

/*Table structure for table `lecturer_info` */

DROP TABLE IF EXISTS `lecturer_info`;

CREATE TABLE `lecturer_info` (
  `lecturer_id` int(11) NOT NULL,
  `lecturer_email` varchar(100) NOT NULL,
  `lecturer_name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lecturer_info` */

insert  into `lecturer_info`(`lecturer_id`,`lecturer_email`,`lecturer_name`,`password`) values (927046,'deng4@student.unimelb.edu.au','Devin DENG','meiyoumima');

/*Table structure for table `lesson_table` */

DROP TABLE IF EXISTS `lesson_table`;

CREATE TABLE `lesson_table` (
  `lesson_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(30) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `semester` varchar(15) NOT NULL,
  `year` int(11) NOT NULL,
  `state` varchar(11) NOT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `FK_class_id_idx` (`class_id`),
  KEY `FK_lecture_id_idx` (`lecturer_id`),
  KEY `FK_right_id_idx` (`state`),
  CONSTRAINT `FK_class_id` FOREIGN KEY (`class_id`) REFERENCES `class_dict` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lecture_id` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer_info` (`lecturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lesson_table` */

insert  into `lesson_table`(`lesson_id`,`class_id`,`lecturer_id`,`semester`,`year`,`state`) values (1,'COMP90007',927046,'Semester1',2019,'ABLE'),(2,'COMP90038',927046,'Semester1',2018,'ABLE');

/*Table structure for table `mark_table` */

DROP TABLE IF EXISTS `mark_table`;

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

/*Data for the table `mark_table` */

/*Table structure for table `record_table` */

DROP TABLE IF EXISTS `record_table`;

CREATE TABLE `record_table` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_date` datetime NOT NULL,
  `detail` text NOT NULL,
  `operator` varchar(45) NOT NULL,
  `operator_type` int(11) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record_table` */

/*Table structure for table `right_table` */

DROP TABLE IF EXISTS `right_table`;

CREATE TABLE `right_table` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_name` varchar(50) NOT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `right_table` */

/*Table structure for table `student_info` */

DROP TABLE IF EXISTS `student_info`;

CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `student_surname` varchar(30) NOT NULL,
  `student_givenname` varchar(30) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student_info` */

/*Table structure for table `tutor_info` */

DROP TABLE IF EXISTS `tutor_info`;

CREATE TABLE `tutor_info` (
  `tutor_id` int(11) NOT NULL,
  `tutor_email` varchar(100) NOT NULL,
  `tutor_phone` varchar(20) DEFAULT NULL,
  `tutor_name` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`tutor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tutor_info` */

insert  into `tutor_info`(`tutor_id`,`tutor_email`,`tutor_phone`,`tutor_name`,`password`) values (123456,'yuxing4@student.unimelb.edu.au','123456','Evelyn GUO','123456');

/*Table structure for table `tutor_lesson` */

DROP TABLE IF EXISTS `tutor_lesson`;

CREATE TABLE `tutor_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(11) NOT NULL,
  `lession_id` int(11) NOT NULL,
  `tutor_right_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tutor_id_idx` (`tutor_id`),
  KEY `FK_lesson_id_idx` (`lession_id`),
  KEY `FK_tutor_right_id_idx` (`tutor_right_id`),
  CONSTRAINT `FK_lesson_id` FOREIGN KEY (`lession_id`) REFERENCES `lesson_table` (`lesson_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_id` FOREIGN KEY (`tutor_id`) REFERENCES `tutor_info` (`tutor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_right_id` FOREIGN KEY (`tutor_right_id`) REFERENCES `right_table` (`right_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tutor_lesson` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
