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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesorio`
--

/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` (`idAccesorio`,`codigo`,`descripcion`,`idColeccion`) VALUES 
 (1,'codAc01','accesorio1',1),
 (2,'codAc02','accesorio2',1),
 (3,'codAc03','accesorio3',1),
 (4,'codAc04','accesorio4',2),
 (5,'codAc05','accesorio5',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (1,'cod01','zapato1','desc zapato1',1),
 (2,'cod02','zapato2','desc zapato2',1),
 (3,'cod03','zapato3','desc zapato3',1),
 (4,'cod04','zapato4','desc zapato4',2),
 (5,'cod05','zapato5','desc zapato5',2),
 (6,'COD06','zapato6','desc zapato6',1),
 (7,'COD07','zapato7','desc zapato7',1),
 (8,'COD08','zapato8','desc zapato8',1),
 (9,'COD09','zapato9','desc zapato9',1),
 (10,'COD010','zapato10','desc zapato10',1),
 (11,'newZap','new Zapato','Zapato new desc',1),
 (12,'AAA','AAA','AAA',2),
 (13,'BBB','BBB','BBB',1),
 (14,'CCC','CCC','CCC',1),
 (15,'DDD','DDD','DDD',1),
 (16,'VVV','VVV','VVV',1),
 (17,'TTT','TTT','TTT',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` (`idImagen`,`idCalzado`,`idAccesorio`,`pathGrande`,`pathChica`) VALUES 
 (1,1,NULL,'images/zapatos/zapato1g.png','images/zapatos/zapato1.png'),
 (2,2,NULL,'images/zapatos/zapato2g.png','images/zapatos/zapato2.png'),
 (3,3,NULL,'images/zapatos/zapato3g.png','images/zapatos/zapato3.png'),
 (4,4,NULL,'images/zapatos/zapato4g.png','images/zapatos/zapato4.png'),
 (5,5,NULL,'images/zapatos/zapato5g.png','images/zapatos/zapato5.png'),
 (6,6,NULL,'images/zapatos/zapato6g.png','images/zapatos/zapato6.png'),
 (7,7,NULL,'images/zapatos/zapato7g.png','images/zapatos/zapato7.png'),
 (8,8,NULL,'images/zapatos/zapato8g.png','images/zapatos/zapato8.png'),
 (9,9,NULL,'images/zapatos/zapato9g.png','images/zapatos/zapato9.png'),
 (10,10,NULL,'images/zapatos/zapato10g.png','images/zapatos/zapato10.png'),
 (11,15,NULL,'PATHBIG','PATHSMALL'),
 (12,17,NULL,'D:Proyectos WEBLara CardellalaraczapateriaProyecto WebLara Cardella WebimagesimagenesZapatosoto-invzapatoPRUEBA.jpg','D:Proyectos WEBLara CardellalaraczapateriaProyecto WebLara Cardella WebimagesimagenesZapatosoto-invzapatoPRUEBA5_thumb.jpg'),
 (13,17,NULL,'D:Proyectos WEBLara CardellalaraczapateriaProyecto WebLara Cardella WebimagesimagenesZapatosoto-invzapatos.jpg','D:Proyectos WEBLara CardellalaraczapateriaProyecto WebLara Cardella WebimagesimagenesZapatosoto-invzapatos4_thumb.jpg');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
