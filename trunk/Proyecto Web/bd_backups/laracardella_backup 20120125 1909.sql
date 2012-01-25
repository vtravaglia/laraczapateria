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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesorio`
--

/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` (`idAccesorio`,`codigo`,`descripcion`,`idColeccion`) VALUES 
 (19,'1','',1),
 (20,'2','',1),
 (21,'3','',1),
 (22,'4','',1),
 (23,'5','',1),
 (24,'6','',1),
 (25,'7','',1),
 (26,'8','',1),
 (27,'9','',1),
 (28,'10','',1),
 (29,'11','',1),
 (30,'12','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (37,'1','Calzado1','',1),
 (38,'2','2','',1),
 (39,'3','3','',1),
 (40,'4','4','',1),
 (41,'5','5','',1),
 (42,'7','7','',1),
 (43,'9','9','',1),
 (44,'10','10','',1),
 (45,'11','11','',1),
 (46,'12','12','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` (`idImagen`,`idCalzado`,`idAccesorio`,`pathGrande`,`pathChica`) VALUES 
 (87,NULL,19,'../images/accesorios/oto-inv/Imagen 016.jpg','../images/accesorios/oto-inv/Imagen 016_thumb.jpg'),
 (88,NULL,20,'../images/accesorios/oto-inv/Lara Cardella 002.jpg','../images/accesorios/oto-inv/Lara Cardella 002_thumb.jpg'),
 (89,NULL,21,'../images/accesorios/oto-inv/Lara Cardella 003.jpg','../images/accesorios/oto-inv/Lara Cardella 003_thumb.jpg'),
 (90,NULL,22,'../images/accesorios/oto-inv/Lara Cardella 010.jpg','../images/accesorios/oto-inv/Lara Cardella 010_thumb.jpg'),
 (91,NULL,23,'../images/accesorios/oto-inv/Lara Cardella 019.jpg','../images/accesorios/oto-inv/Lara Cardella 019_thumb.jpg'),
 (92,NULL,24,'../images/accesorios/oto-inv/Lara Cardella 020.jpg','../images/accesorios/oto-inv/Lara Cardella 020_thumb.jpg'),
 (93,NULL,25,'../images/accesorios/oto-inv/Lara Cardella 022.jpg','../images/accesorios/oto-inv/Lara Cardella 022_thumb.jpg'),
 (94,NULL,26,'../images/accesorios/oto-inv/mis imagenes 040.jpg','../images/accesorios/oto-inv/mis imagenes 040_thumb.jpg'),
 (95,NULL,27,'../images/accesorios/oto-inv/mis imagenes 042.jpg','../images/accesorios/oto-inv/mis imagenes 042_thumb.jpg'),
 (96,NULL,28,'../images/accesorios/oto-inv/mis imagenes 043.jpg','../images/accesorios/oto-inv/mis imagenes 043_thumb.jpg'),
 (97,NULL,29,'../images/accesorios/oto-inv/mis imagenes 045.jpg','../images/accesorios/oto-inv/mis imagenes 045_thumb.jpg'),
 (98,NULL,30,'../images/accesorios/oto-inv/mis imagenes 046.jpg','../images/accesorios/oto-inv/mis imagenes 046_thumb.jpg'),
 (99,37,NULL,'../images/calzados/oto-inv/zapato1g.jpg','../images/calzados/oto-inv/zapato1g_thumb.jpg'),
 (100,38,NULL,'../images/calzados/oto-inv/zapato2g.jpg','../images/calzados/oto-inv/zapato2g_thumb.jpg'),
 (101,39,NULL,'../images/calzados/oto-inv/zapato3g.jpg','../images/calzados/oto-inv/zapato3g_thumb.jpg'),
 (102,40,NULL,'../images/calzados/oto-inv/zapato4g.jpg','../images/calzados/oto-inv/zapato4g_thumb.jpg'),
 (103,41,NULL,'../images/calzados/oto-inv/zapato5g.jpg','../images/calzados/oto-inv/zapato5g_thumb.jpg'),
 (104,42,NULL,'../images/calzados/oto-inv/zapato6g.jpg','../images/calzados/oto-inv/zapato6g_thumb.jpg'),
 (105,42,NULL,'../images/calzados/oto-inv/zapato7g.jpg','../images/calzados/oto-inv/zapato7g_thumb.jpg'),
 (106,43,NULL,'../images/calzados/oto-inv/zapato8g.jpg','../images/calzados/oto-inv/zapato8g_thumb.jpg'),
 (107,43,NULL,'../images/calzados/oto-inv/zapato9g.jpg','../images/calzados/oto-inv/zapato9g_thumb.jpg'),
 (109,45,NULL,'../images/calzados/oto-inv/zapato11g.jpg','../images/calzados/oto-inv/zapato11g_thumb.jpg'),
 (110,46,NULL,'../images/calzados/oto-inv/zapato12g.jpg','../images/calzados/oto-inv/zapato12g_thumb.jpg'),
 (112,44,NULL,'../images/calzados/oto-inv/zapato10g.jpg','../images/calzados/oto-inv/zapato10g_thumb.jpg');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idUsuario` int(10) unsigned NOT NULL auto_increment,
  `rol` varchar(20) NOT NULL default 'usuario',
  PRIMARY KEY  (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`user`,`password`,`idUsuario`,`rol`) VALUES 
 ('usr','pass',1,'Admin'),
 ('u1','pass1',2,'user');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
