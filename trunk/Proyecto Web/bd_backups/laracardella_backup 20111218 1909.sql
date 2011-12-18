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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesorio`
--

/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` (`idAccesorio`,`codigo`,`descripcion`,`idColeccion`) VALUES 
 (1,'a001','accesorio 1',2),
 (2,'002','acc 02',1),
 (3,'asd','as',1),
 (4,'sss','sss',1),
 (5,'005','nuevo nombre 5',1),
 (7,'fff','fff',1),
 (8,'rrrrr','rrr',1),
 (10,'e','e',1),
 (12,'nnnn','nnnn',2),
 (16,'aass','aass',1),
 (18,'asd','asd',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calzado`
--

/*!40000 ALTER TABLE `calzado` DISABLE KEYS */;
INSERT INTO `calzado` (`idCalzado`,`codigo`,`nombre`,`descripcion`,`idColeccion`) VALUES 
 (30,'001','cal 001','dos img distintas',1),
 (32,'3','nombre eeeeeeeee','sdfsdfsdf',1),
 (33,'asd','asd','asd',1),
 (35,'codigo','nombre','descripcion',1),
 (36,'c','n','d',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` (`idImagen`,`idCalzado`,`idAccesorio`,`pathGrande`,`pathChica`) VALUES 
 (38,33,NULL,'../images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','../images/imagenesZapatos/oto-inv/zapatoPRUEBA1_thumb.jpg'),
 (46,NULL,2,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio19_thumb.jpg'),
 (47,NULL,3,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio110_thumb.jpg'),
 (48,NULL,4,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio111_thumb.jpg'),
 (51,NULL,7,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio114_thumb.jpg'),
 (52,NULL,8,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio115_thumb.jpg'),
 (54,NULL,10,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio117_thumb.jpg'),
 (56,32,NULL,'../images/imagenesZapatos/oto-inv/zapatoPRUEBA.jpg','../images/imagenesZapatos/oto-inv/zapatoPRUEBA_thumb.jpg'),
 (62,NULL,5,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio112_thumb.jpg'),
 (63,NULL,5,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio119_thumb.jpg'),
 (68,NULL,1,'../images/accesorios/pri-ver/accesorio3.jpg','../images/accesorios/pri-ver/accesorio3_thumb.jpg'),
 (73,NULL,16,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio112_thumb.jpg'),
 (74,NULL,16,'../images/accesorios/oto-inv/accesorio1.jpg','../images/accesorios/oto-inv/accesorio119_thumb.jpg'),
 (79,NULL,12,'../images/accesorios/pri-ver/accesorio1.jpg','../images/accesorios/pri-ver/accesorio1_thumb.jpg'),
 (80,NULL,18,'../images/accesorios/pri-ver/accesorio3.jpg','../images/accesorios/pri-ver/accesorio31_thumb.jpg'),
 (83,35,NULL,'../images/calzados/oto-inv/zapatos.jpg','../images/calzados/oto-inv/zapatos_thumb.jpg'),
 (84,36,NULL,'../images/calzados/oto-inv/zapatos.jpg','../images/calzados/oto-inv/zapatos_thumb.jpg'),
 (85,36,NULL,'../images/calzados/oto-inv/zapatosGrandes.jpg','../images/calzados/oto-inv/zapatosGrandes_thumb.jpg'),
 (86,30,NULL,'../images/imagenesZapatos/oto-inv/zapatosGrandes.jpg','../images/imagenesZapatos/oto-inv/zapatosGrandes1_thumb.jpg');
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
