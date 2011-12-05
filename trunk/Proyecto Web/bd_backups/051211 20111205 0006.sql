-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.77-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema laracardella
--

CREATE DATABASE IF NOT EXISTS laracardella;
USE laracardella;

--
-- Definition of table `accesorio`
--

DROP TABLE IF EXISTS `accesorio`;
CREATE TABLE `accesorio` (
  `idAccesorio` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(45) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `idColeccion` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idAccesorio`),
  KEY `FK_accesorio_coleccion` (`idColeccion`),
  CONSTRAINT `FK_accesorio_coleccion` FOREIGN KEY (`idColeccion`) REFERENCES `coleccion` (`idColeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesorio`
--

/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` (`idAccesorio`,`codigo`,`descripcion`,`idColeccion`) VALUES 
 (1,'codAc01','accesorio1',0),
 (2,'codAc02','accesorio2',1),
 (3,'codAc03','accesorio3',1),
 (4,'codAc04','accesorio4',2),
 (5,'codAc05','accesorio5',2),
 (6,'codAc06','desc',1),
 (7,'codAc07','desc',1),
 (8,'codAc08','desc',1),
 (9,'codAc09','desc',1),
 (10,'codAc10','desc',1);
/*!40000 ALTER TABLE `accesorio` ENABLE KEYS */;


--
-- Definition of table `calzado`
--

DROP TABLE IF EXISTS `calzado`;
CREATE TABLE `calzado` (
  `idCalzado` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) default NULL,
  `idColeccion` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idCalzado`),
  KEY `FK_calzado_coleccion` (`idColeccion`),
  CONSTRAINT `FK_calzado_coleccion` FOREIGN KEY (`idColeccion`) REFERENCES `coleccion` (`idColeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (18,'1','calzado1','',1),
 (19,'10','calzado10','',2),
 (20,'2','calzado2','',2),
 (21,'3','calzado3','',2),
 (22,'4','calzado4','',2),
 (23,'5','calzado5','',2),
 (24,'6','calzado6','',2),
 (25,'7','calzado7','',2),
 (26,'8','calzado8','',2),
 (27,'9','calzado9','',2);
/*!40000 ALTER TABLE `calzado` ENABLE KEYS */;


--
-- Definition of table `coleccion`
--

DROP TABLE IF EXISTS `coleccion`;
CREATE TABLE `coleccion` (
  `idColeccion` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(400) default NULL,
  PRIMARY KEY  (`idColeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coleccion`
--

/*!40000 ALTER TABLE `coleccion` DISABLE KEYS */;
INSERT INTO `coleccion` (`idColeccion`,`nombre`,`descripcion`) VALUES 
 (0,'sin coleccion','articulo correspondiente a una temporada vieja'),
 (1,'oto-inv','coleccion otonio invierno'),
 (2,'pri-ver','coleccion primavera verano');
/*!40000 ALTER TABLE `coleccion` ENABLE KEYS */;


--
-- Definition of table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE `imagen` (
  `idImagen` int(10) unsigned NOT NULL auto_increment,
  `idCalzado` int(10) unsigned default NULL,
  `idAccesorio` int(10) unsigned default NULL,
  `pathGrande` varchar(400) NOT NULL,
  `pathChica` varchar(400) NOT NULL,
  PRIMARY KEY  (`idImagen`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` (`idImagen`,`idCalzado`,`idAccesorio`,`pathGrande`,`pathChica`) VALUES 
 (2,18,NULL,'images/zapatos/zapato1g.png','images/zapatos/zapato1.png'),
 (3,19,NULL,'images/zapatos/zapato2g.png','images/zapatos/zapato2.png'),
 (4,20,NULL,'images/zapatos/zapato3g.png','images/zapatos/zapato3.png'),
 (5,21,NULL,'images/zapatos/zapato4g.png','images/zapatos/zapato4.png'),
 (6,22,NULL,'images/zapatos/zapato5g.png','images/zapatos/zapato5.png'),
 (7,23,NULL,'images/zapatos/zapato6g.png','images/zapatos/zapato6.png'),
 (8,24,NULL,'images/zapatos/zapato7g.png','images/zapatos/zapato7.png'),
 (9,25,NULL,'images/zapatos/zapato8g.png','images/zapatos/zapato8.png'),
 (10,26,NULL,'images/zapatos/zapato9g.png','images/zapatos/zapato9.png'),
 (11,27,NULL,'images/zapatos/zapato10g.png','images/zapatos/zapato10.png'),
 (12,NULL,1,'images/accesorios/accesorio1g.png','images/accesorios/accesorio1.png'),
 (13,NULL,2,'images/accesorios/accesorio2g.png','images/accesorios/accesorio2.png'),
 (14,NULL,3,'images/accesorios/accesorio3g.png','images/accesorios/accesorio3.png'),
 (15,NULL,4,'images/accesorios/accesorio4g.png','images/accesorios/accesorio4.png'),
 (16,NULL,5,'images/accesorios/accesorio5g.png','images/accesorios/accesorio5.png'),
 (17,NULL,6,'images/accesorios/accesorio6g.png','images/accesorios/accesorio6.png'),
 (18,NULL,7,'images/accesorios/accesorio7g.png','images/accesorios/accesorio7.png'),
 (19,NULL,8,'images/accesorios/accesorio8g.png','images/accesorios/accesorio8.png'),
 (20,NULL,9,'images/accesorios/accesorio9g.png','images/accesorios/accesorio9.png'),
 (21,NULL,10,'images/accesorios/accesorio10g.png','images/accesorios/accesorio10.png');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
