-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: mysql-instance01.cdo84rlxvo4x.us-west-2.rds.amazonaws.com    Database: emptest
-- ------------------------------------------------------
-- Server version	5.7.22

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

call mysql.rds_set_configuration('binlog retention hours',8);

drop database if exists emptest;
create database if not exists emptest;;
ALTER DATABASE emptest CHARACTER SET latin1 COLLATE latin1_bin;

DROP USER IF EXISTS 'dms_user';
CREATE USER 'dms_user'@'%' IDENTIFIED BY 'dms_user';

GRANT ALL PRIVILEGES ON ticketsdb.* TO 'dms_user'@'%' IDENTIFIED BY 'dms_user';


use emptest;

--
-- Table structure for table `delete_count_cdc`
--

DROP TABLE IF EXISTS `delete_count_cdc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delete_count_cdc` (
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_no` char(10) DEFAULT NULL,
  `dept_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59222769 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_manager` (
  `man_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) DEFAULT NULL,
  `dept_no` char(10) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`man_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14806292 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(14) DEFAULT NULL,
  `last_name` varchar(16) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59222777 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insert_count_cdc`
--

DROP TABLE IF EXISTS `insert_count_cdc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insert_count_cdc` (
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaries` (
  `salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29609069 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14806290 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `update_count_cdc`
--

DROP TABLE IF EXISTS `update_count_cdc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_count_cdc` (
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-04 18:33:22
