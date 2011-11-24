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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (30,'bb00','zapato japones','lindo zapato japones',2),
 (31,'as','asd','asd',1),
 (33,'bb33','asd','asd',1),
 (34,'codigo','nom','desc',1),
 (35,'cod2','nom2','',2),
 (36,'again','otro zap','',1),
 (37,'24','asd','asdasdasd',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` (`idImagen`,`idCalzado`,`idAccesorio`,`pathGrande`,`pathChica`) VALUES 
 (62,30,NULL,'images/imagenesZapatos/pri-ver/zapatoPRUEBA.jpg','images/imagenesZapatos/pri-ver/zapatoPRUEBA9_thumb.jpg'),
 (63,31,NULL,'images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','images/imagenesZapatos/oto-inv/zapatoPRUEBA15_thumb.jpg'),
 (66,33,NULL,'images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','images/imagenesZapatos/oto-inv/zapatoPRUEBA17_thumb.jpg'),
 (67,33,NULL,'images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','images/imagenesZapatos/oto-inv/zapatoPRUEBA18_thumb.jpg'),
 (68,34,NULL,'images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','images/imagenesZapatos/oto-inv/zapatoPRUEBA15_thumb.jpg'),
 (69,34,NULL,'images/imagenesZapatos/oto-inv/zapatos.jpg','images/imagenesZapatos/oto-inv/zapatos10_thumb.jpg'),
 (70,35,NULL,'images/imagenesZapatos/pri-ver/zapatoPRUEBA.jpg','images/imagenesZapatos/pri-ver/zapatoPRUEBA9_thumb.jpg'),
 (71,35,NULL,'images/imagenesZapatos/pri-ver/zapatos.jpg','images/imagenesZapatos/pri-ver/zapatos6_thumb.jpg'),
 (72,36,NULL,'images/imagenesZapatos/pri-ver/zapatoPRUEBA.jpg','images/imagenesZapatos/pri-ver/zapatoPRUEBA9_thumb.jpg'),
 (73,36,NULL,'images/imagenesZapatos/pri-ver/zapatos.jpg','images/imagenesZapatos/pri-ver/zapatos6_thumb.jpg'),
 (74,36,NULL,'images/imagenesZapatos/oto-inv/zapatos.jpg','images/imagenesZapatos/oto-inv/zapatos11_thumb.jpg'),
 (75,37,NULL,'../images/imagenesZapatos/oto-inv/zapatos.jpg','../images/imagenesZapatos/oto-inv/zapatos12_thumb.jpg');
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
 ('u1','p1',2,'Admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
