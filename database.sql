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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `lesson_table` */

insert  into `lesson_table`(`lesson_id`,`class_id`,`lecturer_id`,`semester`,`year`,`state`) values (1,'COMP90007',927046,'Semester2',2019,'ABLE'),(2,'COMP90038',927046,'Semester1',2018,'ABLE'),(3,'COMP90038',927046,'Semester2',2019,'ABLE');

/*Table structure for table `mark_table` */

DROP TABLE IF EXISTS `mark_table`;

CREATE TABLE `mark_table` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `marks` float DEFAULT NULL,
  `max_mark` float DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`mark_id`),
  KEY `FK_student_id_idx` (`student_id`),
  KEY `FK_tutor_assignment_id` (`tutor_assignment_id`),
  CONSTRAINT `FK_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_assignment_id` FOREIGN KEY (`tutor_assignment_id`) REFERENCES `tutor_assignment` (`tutor_assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `mark_table` */

insert  into `mark_table`(`mark_id`,`tutor_assignment_id`,`student_id`,`marks`,`max_mark`,`comment`) values (1,14,123456,1,10,'You FAIL'),(2,14,345678,2,10,'You FAIL'),(3,14,912345,3,10,'You FAIL'),(4,15,234567,4,10,'You FAIL'),(5,15,456789,5,10,'You Barely PASS'),(6,14,567891,6,10,'H3'),(7,14,678912,7,10,'H2'),(8,14,789123,8,10,'H1'),(9,14,891234,10,10,'GOOOOOOOOOOOOOOOOOOD');

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

insert  into `student_info`(`student_id`,`student_email`,`student_username`,`student_surname`,`student_givenname`) values (123456,'abc@student.unimelb.edu.au','abc','ABC','Alice'),(234567,'bcd@student.unimelb.edu.au','bcd','BCD','Bob'),(345678,'cde@student.unimelb.edu.au','cde','CDE','Cassy'),(456789,'def@student.unimelb.edu.au','def','DEF','DENG'),(567891,'efg@student.unimelb.edu.au','efg','EFG','Ella'),(678912,'fgh@student.unimelb.edu.au','fgh','FGH','Fly'),(789123,'ghi@student.unimelb.edu.au','ghi','GHI','GUO'),(891234,'hij@student.unimelb.edu.au','hij','HIJ','Halen'),(912345,'ijk@student.unimelb.edu.au','ijk','IJK','Irsh');

/*Table structure for table `tutor_assignment` */

DROP TABLE IF EXISTS `tutor_assignment`;

CREATE TABLE `tutor_assignment` (
  `tutor_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_lesson_id` int(11) DEFAULT NULL,
  `assignment` int(11) DEFAULT NULL,
  `mark_excel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tutor_assignment_id`),
  KEY `FK_tutor_lesson` (`tutor_lesson_id`),
  CONSTRAINT `FK_tutor_lesson` FOREIGN KEY (`tutor_lesson_id`) REFERENCES `tutor_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `tutor_assignment` */

insert  into `tutor_assignment`(`tutor_assignment_id`,`tutor_lesson_id`,`assignment`,`mark_excel`) values (14,13,1,'D:\\Java Tools\\apache-tomcat-7.0.52\\webapps\\Project\\marks\\c346f3066b764f86b5f7b1669d13c6cb.xlsx'),(15,14,1,NULL);

/*Table structure for table `tutor_info` */

DROP TABLE IF EXISTS `tutor_info`;

CREATE TABLE `tutor_info` (
  `tutor_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_email` varchar(100) NOT NULL,
  `tutor_phone` varchar(20) DEFAULT NULL,
  `tutor_name` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`tutor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tutor_info` */

insert  into `tutor_info`(`tutor_id`,`tutor_email`,`tutor_phone`,`tutor_name`,`password`) values (2,'deng4@student.unimelb.edu.au','18840824073','Devin DENG','meiyoumima'),(3,'dengyue941228@163.com','18840824073','Yue DENG','meiyoumima'),(4,'2430070746@qq.com','0431683781','Purple Sum','123456'),(5,'123456789@qq.com',NULL,NULL,'[C@78524f84');

/*Table structure for table `tutor_lesson` */

DROP TABLE IF EXISTS `tutor_lesson`;

CREATE TABLE `tutor_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tutor_id_idx` (`tutor_id`),
  KEY `FK_lesson_id_idx` (`lesson_id`),
  KEY `FK_tutor_right_id_idx` (`status`),
  CONSTRAINT `FK_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lesson_table` (`lesson_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tutor_id` FOREIGN KEY (`tutor_id`) REFERENCES `tutor_info` (`tutor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `tutor_lesson` */

insert  into `tutor_lesson`(`id`,`tutor_id`,`lesson_id`,`status`) values (13,2,1,'ACTIVATED'),(14,3,1,'ACTIVATED'),(15,2,2,'ACTIVATED');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
