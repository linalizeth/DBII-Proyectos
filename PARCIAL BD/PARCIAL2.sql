/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.20-MariaDB : Database - parcial1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parcial1`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(11) NOT NULL,
  `quota` varchar(225) NOT NULL,
  `journeyId` int(11) NOT NULL,
  `degreeId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupId` (`groupId`),
  KEY `degreeId` (`degreeId`),
  KEY `journeyId` (`journeyId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

insert  into `academicperiodgroups`(`id`,`quota`,`journeyId`,`degreeId`,`groupId`) values 
(62,'',16,23,1),
(63,'',16,24,1);

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `abbreviation` varchar(225) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `levelId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelId`),
  CONSTRAINT `degrees_ibfk_1` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

insert  into `degrees`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`,`levelId`) values 
(23,'kinder','','1970-01-10 00:00:00','2022-03-17 21:18:54',11),
(24,'preparatoria','','2022-03-11 21:53:44','2022-03-17 21:53:48',11);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `abbreviation` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`createdAt`,`updatedAt`,`abbreviation`) values 
(1,'SeccionA','2022-03-10 21:22:06','2022-03-19 21:22:14','A');

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `abbreviation` varchar(225) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values 
(16,'matutina','Mat','2022-03-02 21:15:46','2022-03-03 21:15:55');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `abbreviation` varchar(225) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

insert  into `levels`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values 
(11,'preprimaria','','1970-01-15 00:00:00','1970-01-10 00:00:00'),
(12,'primaria alta','','1970-01-23 00:00:00','0000-00-00 00:00:00'),
(13,'secundaaria','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(11) NOT NULL,
  `academicPeriodGroupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

insert  into `matriculates`(`id`,`academicPeriodGroupId`) values 
(20,62);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
