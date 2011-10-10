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
  `imagenGrande` varchar(100) default NULL,
  `imagenChica` varchar(100) default NULL,
  `idColeccion` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idAccesorio`),
  KEY `FK_accesorio_coleccion` (`idColeccion`),
  CONSTRAINT `FK_accesorio_coleccion` FOREIGN KEY (`idColeccion`) REFERENCES `coleccion` (`idColeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesorio`
--

/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` (`idAccesorio`,`codigo`,`descripcion`,`imagenGrande`,`imagenChica`,`idColeccion`) VALUES 
 (1,'codAc01','accesorio1',NULL,NULL,0),
 (2,'codAc02','accesorio2',NULL,NULL,1),
 (3,'codAc03','accesorio3',NULL,NULL,1),
 (4,'codAc04','accesorio4',NULL,NULL,2),
 (5,'codAc05','accesorio5',NULL,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (1,'cod01','zapato1','desc zapato1',0),
 (2,'cod02','zapato2','desc zapato2',1),
 (3,'cod03','zapato3','desc zapato3',1),
 (4,'cod04','zapato4','desc zapato4',2),
 (5,'cod05','zapato5','desc zapato5',2);
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
  `path` varchar(100) NOT NULL,
  PRIMARY KEY  (`idImagen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
