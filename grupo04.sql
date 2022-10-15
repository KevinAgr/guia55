<<<<<<< HEAD
﻿# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost:3308    Database: grupo04
# ------------------------------------------------------
# Server version 5.5.5-10.1.13-MariaDB
=======
﻿/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;

>>>>>>> 925918d0f34714c1d9970d57a1137255d47a3903

DROP DATABASE IF EXISTS `grupo04`;
CREATE DATABASE `grupo04` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `grupo04`;
<<<<<<< HEAD

#
# Source for table libro
#

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) NOT NULL DEFAULT '',
  `titulo` varchar(255) NOT NULL DEFAULT '',
  `autor` varchar(255) NOT NULL DEFAULT '',
  `editorial` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Dumping data for table libro
#

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'11243424','La odisea','Kevin','Novela');
INSERT INTO `libro` VALUES (2,'1111111111111','Romeo y Julieta','Kevin','Santillana');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table users
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `nivel` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Dumping data for table users
#

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kevin','Kevin','1','1234');
INSERT INTO `users` VALUES (2,'navarro','Navarro','1','1234');
INSERT INTO `users` VALUES (3,'alexander','Alexander','2','1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
=======
DROP TABLE IF EXISTS `editorial`;
CREATE TABLE `editorial` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `editorial` VALUES (1,'Grupo Editorial EDISAL');
INSERT INTO `editorial` VALUES (2,'ESE Ediciones');
INSERT INTO `editorial` VALUES (3,'Santillana');
INSERT INTO `editorial` VALUES (4,'Piedra Santa');
DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `isbn` bigint(13) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL DEFAULT '',
  `autor` varchar(255) NOT NULL DEFAULT '',
  `editorial` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=4444444444442 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `libro` VALUES (1111111111111,'prueba','Alexander',1);
INSERT INTO `libro` VALUES (1111111111114,'fffff','Disney  ',4);
INSERT INTO `libro` VALUES (1111111111115,'Blanca nieves','Alexander',3);
INSERT INTO `libro` VALUES (1111111111116,'si se puede','YO',3);
INSERT INTO `libro` VALUES (4444444444441,'prueba','Alexander',2);

>>>>>>> 925918d0f34714c1d9970d57a1137255d47a3903
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
