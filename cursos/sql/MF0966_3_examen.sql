CREATE DATABASE  IF NOT EXISTS `mf0966_3` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mf0966_3`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mf0966_3
-- -----------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `codigo` int NOT NULL AUTO_INCREMENT COMMENT 'el campo clave de la tabla. Es auto generado.',
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `apellidos` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fNacimiento` date DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `poblacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `codigopostal` int(5) unsigned zerofill DEFAULT NULL,
  `telefono` int NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dni` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `nHermanos` int DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (0,'alumno','sin asignar',NULL,NULL,NULL,00000,0,'aaaaaaa@aaaaa.com','0000000x',0,0),(1,'sergio','aparicio vargas','1977-12-01','','',00000,944110293,'aaaa@aaaa.com','44974398z',0,1),(2,'maite','monasterio','1986-11-11','','',48007,944110293,'mmonasterio@gmail.com','16071559x',0,1),(4,'enrique javier','ruiz jimenez','2017-02-14','','',00048,944110239,'enrique@gmail.com','45677362y',0,1),(11,'Koldo','Arretxea García',NULL,NULL,NULL,NULL,0,'koldo@gmail.com','0000700x',0,1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_has_resenyas`
--

DROP TABLE IF EXISTS `alumno_has_resenyas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_has_resenyas` (
  `alumno_codigo` int NOT NULL,
  `curso_codigo` int NOT NULL,
  `resenya` varchar(100) NOT NULL,
  `resenyas_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`alumno_codigo`,`curso_codigo`),
  UNIQUE KEY `resenyas_id_UNIQUE` (`resenyas_id`),
  KEY `fk_alumno_has_curso_curso1_idx` (`curso_codigo`),
  KEY `fk_alumno_has_curso_alumno1_idx` (`alumno_codigo`),
  CONSTRAINT `fk_alumno_has_curso_alumno1` FOREIGN KEY (`alumno_codigo`) REFERENCES `alumno` (`codigo`),
  CONSTRAINT `fk_alumno_has_curso_curso1` FOREIGN KEY (`curso_codigo`) REFERENCES `curso` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_has_resenyas`
--

LOCK TABLES `alumno_has_resenyas` WRITE;
/*!40000 ALTER TABLE `alumno_has_resenyas` DISABLE KEYS */;
INSERT INTO `alumno_has_resenyas` VALUES (1,1,'muy mal',1),(1,2,'muy requetebien',5),(1,3,'muy bien',4),(1,4,'na',10),(1,5,'bestialísimo',13),(2,4,'bestialísimo',11);
/*!40000 ALTER TABLE `alumno_has_resenyas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `poblacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `codigopostal` int(5) unsigned zerofill DEFAULT NULL,
  `identificador` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'Sin Definir','aaaaaa@aaaaa.com',9444,NULL,NULL,NULL,'#######',0),(1,'SERIKAT CONSULTORÍA E INFORMÁTICA, S.A.','info@serikat.es',944250100,'c/ Ercilla 19','Bilbao',48009,'A-48476006',1),(2,'lanbide - servicio vasco de empleo','info@lanbide.net',945160601,'Jose Atxotegi 1','Vitoria-Gazteiz',01009,'Q0100571l',1),(3,'hobetuz','bizkaia@hobetuz.eus',944150808,'gran vía, 35-6º',NULL,NULL,'g48850127',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `identificador` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fInicio` date DEFAULT NULL,
  `fFin` date DEFAULT NULL,
  `nHoras` int NOT NULL,
  `temario` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `activo` tinyint DEFAULT '1',
  `cliente_codigo` int DEFAULT NULL,
  `precio` double(8,2) DEFAULT '0.00',
  `profesor_codigo` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_curso_cliente_codigo_idx` (`cliente_codigo`),
  KEY `fk_curso_profesor_codigo_idx` (`profesor_codigo`),
  CONSTRAINT `fk_curso_cliente_codigo` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`codigo`),
  CONSTRAINT `fk_curso_profesor_codigo` FOREIGN KEY (`profesor_codigo`) REFERENCES `profesor` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Desarrrollo de Aplicaciones con Tecnologias Web','18482675','2017-01-09','2017-06-13',510,NULL,1,2,300000.00,1),(2,'Desarrollo de Bases de Datos y Programacion orientada a Objetos','18488225','2017-02-20','2017-09-29',630,'IFCD0112_FIC.pdf',1,2,400000.00,1),(3,'Publicidad en internet','18482678','2017-03-27','2017-03-30',10,NULL,1,3,1500.00,1),(4,'Programación en Bases de Datos relaciones con Oracle 12c','CI67','2017-05-02','2017-05-30',30,'CI67.pdf',1,3,3500.00,1),(5,'Desarrollo JAVA','2573756','2018-07-02','2018-09-02',40,'fsefsf.pdf',1,3,45642.00,1);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imparticion`
--

DROP TABLE IF EXISTS `imparticion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imparticion` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `curso_codigo` int NOT NULL,
  `alumno_codigo` int NOT NULL,
  `fMatriculacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_imparticion_alumno_codigo_idx` (`alumno_codigo`),
  KEY `fk_imparticion_curso_codigo_idx` (`curso_codigo`),
  CONSTRAINT `fk_imparticion_alumno_codigo` FOREIGN KEY (`alumno_codigo`) REFERENCES `alumno` (`codigo`),
  CONSTRAINT `fk_imparticion_curso_codigo` FOREIGN KEY (`curso_codigo`) REFERENCES `curso` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imparticion`
--

LOCK TABLES `imparticion` WRITE;
/*!40000 ALTER TABLE `imparticion` DISABLE KEYS */;
INSERT INTO `imparticion` VALUES (9,3,2,NULL),(10,3,4,NULL),(15,2,1,NULL),(16,2,2,NULL),(17,2,4,NULL),(48,1,1,NULL),(49,1,2,NULL),(50,1,4,NULL);
/*!40000 ALTER TABLE `imparticion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `NSS` bigint DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `apellidos` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fNacimiento` date DEFAULT NULL,
  `DNI` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `direccion` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `poblacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `codigopostal` int(5) unsigned zerofill DEFAULT NULL,
  `telefono` int NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (0,0,'profesor','sin asignar',NULL,'00000000z',NULL,NULL,NULL,0,'aaaaaaaa@aaaaa.aaa',0),(1,481234567840,'Ander','Ipartek','1976-11-24','30693142x','Av. Mazustegi 9','Bilbao',48009,944110293,'auraga@ipartek.com',1);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mf0966_3'
--

--
-- Dumping routines for database 'mf0966_3'
--
/*!50003 DROP PROCEDURE IF EXISTS `alumnoCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoCreate`(IN `papellidos` VARCHAR(250), IN `pcodigopostal` INT(5), IN `pdireccion` VARCHAR(250), IN `pdni` VARCHAR(9), IN `pemail` VARCHAR(150), IN `pfNacimiento` DATE, IN `pnHermanos` INT(2), IN `pnombre` VARCHAR(50), IN `ppoblacion` VARCHAR(150), IN `ptelefono` INT(9), OUT `pcodigo` INT)
BEGIN

INSERT	INTO alumno(nombre,apellidos,dni,email,direccion,codigopostal,poblacion,fNacimiento,telefono,nHermanos)
VALUES(LOWER(pnombre),LOWER(papellidos),LOWER(pdni),LOWER(pemail),LOWER(pdireccion),pcodigopostal,LOWER(ppoblacion),pfNacimiento,ptelefono,pnHermanos);
SET pcodigo = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnoDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoDelete`(IN `pcodigo` INT)
    NO SQL
BEGIN

DELETE FROM alumno WHERE codigo = pcodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnogetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnogetAll`()
    NO SQL
BEGIN
	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo
	FROM `alumno`
    WHERE alumno.activo = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnogetByCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnogetByCurso`(IN `pcursocodigo` INT)
BEGIN
	SELECT a.`codigo` as alumnocodigo, a.`nombre` as alumnonombre, a.`apellidos` as alumnoapellidos, a.`fNacimiento` as alumnofnacimiento, a.`direccion` as alumnodireccion, a.`poblacion` as alumnopoblacion, a.`codigopostal` as alumnocodigopostal, a.`telefono` as alumnotelefono, a.`email` as alumnoemail, a.`dni` as alumnodni, a.`nHermanos` as alumnonhermanos, a.`activo` as alumnoactivo
    FROM `alumno` as a 
		inner join imparticion as i ON i.alumno_codigo = a.codigo
        inner join curso as c ON i.curso_codigo = c.codigo
	WHERE c.codigo = pcursocodigo
    group by a.codigo;
        
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnogetByDni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnogetByDni`(IN `pdni` VARCHAR(9))
BEGIN
	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo 
    FROM `alumno`
	WHERE dni = pdni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnogetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnogetById`(IN `pcodigo` INT)
    NO SQL
BEGIN

	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo
    FROM `alumno`
	WHERE codigo = pcodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnoInforme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnoInforme`(IN `pcodigo` INT)
BEGIN
	
	SELECT a.`codigo` as alumnocodigo, a.`nombre` as alumnonombre, a.`apellidos` as alumnoapellidos, a.`fNacimiento` as alumnofnacimiento, a.`direccion` as alumnodireccion, a.`poblacion` as alumnopoblacion, a.`codigopostal` as alumnocodigopostal, a.`telefono` as alumnotelefono, a.`email` as alumnoemail, a.`dni` as alumnodni, `nHermanos` as alumnonhermanos, a.`activo` as alumnoactivo,
	 c.codigo as cursocodigo,c.nombre as cursonombre,
     c.identificador as cursoidentificador, c.fInicio as cursofinicio, c.fFin as cursoffin,c.nHoras as cursonhoras,c.precio as cursoprecio
            /*,SUM(cd.precio) as preciocurso*/
    FROM alumno as a
        LEFT JOIN imparticion as i ON i.alumno_codigo = a.codigo
        LEFT JOIN curso as c ON c.codigo = i.curso_codigo
    WHERE a.codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoUpdate`(IN `papellidos` VARCHAR(250), IN `pcodigo` INT, IN `pcodigopostal` INT(5), IN `pdireccion` VARCHAR(250), IN `pdni` VARCHAR(9), IN `pemail` VARCHAR(150), IN `pfNacimiento` DATE, IN `pnHermanos` INT(2), IN `pnombre` VARCHAR(150), IN `ppoblacion` VARCHAR(150), IN `ptelefono` INT(9))
    NO SQL
BEGIN

UPDATE alumno 
SET nombre = LOWER(pnombre),apellidos = LOWER(papellidos), dni = LOWER(pdni),email = LOWER(pemail),direccion=LOWER(pdireccion),codigopostal=pcodigopostal,poblacion=LOWER(ppoblacion),fNacimiento=pfNacimiento,telefono=ptelefono,nHermanos=pnHermanos
WHERE codigo = pcodigo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clienteCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clienteCreate`(IN `pnombre` TEXT, IN `pemail` VARCHAR(150), IN `ptelefono` INT, IN `pdireccion` VARCHAR(150), IN `ppoblacion` VARCHAR(150), IN `pcodigopostal` INT(5), IN `pidentificador` VARCHAR(50), OUT `pcodigo` INT)
BEGIN
INSERT INTO cliente(`nombre`, `email`, `telefono`, `direccion`, `poblacion`, `codigopostal`, `identificador`) 
VALUES(LOWER(pnombre),
       LOWER(pemail),
       ptelefono,
       LOWER(pdireccion),
       LOWER(poblacion),
       codigopostal,
       LOWER(pidentificador));
	SET pcodigo = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clientegetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `clientegetAll`()
    NO SQL
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE cliente.activo = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clientegetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientegetById`(IN `pcodigo` INT)
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clientegetByIdentificador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientegetByIdentificador`(IN `pidentificador` VARCHAR(15))
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE identificador = pidentificador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clienteInforme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clienteInforme`(IN `pcodigo` INT)
BEGIN
SELECT c.`codigo` as clientecodigo, c.`nombre` as clientenombre, c.`email` as clienteemail, c.`telefono` as clientetelefono, c.`direccion` as clientedireccion, c.`poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,c.`identificador` as clienteidentificador,c.activo as clienteactivo, cu.codigo as cursocodigo,cu.nombre as cursonombre,cu.identificador as cursoidentificador, cu.fInicio as cursofinicio,cu.fFin as cursoffin,cu.nhoras as cursonhoras,cu.precio as cursoprecio FROM cliente as c LEFT JOIN curso as cu ON cu.cliente_codigo = c.codigo WHERE c.codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clienteUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clienteUpdate`(IN `pcodigo` INT, IN `pnombre` VARCHAR(150), IN `pemail` VARCHAR(150), IN `ptelefono` INT(9), IN `pdirecion` VARCHAR(250), IN `ppoblacion` VARCHAR(150), IN `pcodigopostal` INT(5), IN `pidentificador` VARCHAR(15))
BEGIN
UPDATE `cliente` 
SET `codigo`=pcodigo,
	`nombre`=pnombre,
    `email`=pemail,
    `telefono`=ptelefono,
    `direccion`=pdirecion,
    `poblacion`=ppoblacion,
    `codigopostal`=pcodigopostal,
    `identificador`=pidentificador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursocreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursocreate`(IN `pnombre` VARCHAR(50), IN `pidentificador` VARCHAR(50), IN `pfinicio` DATE, IN `pffin` DATE, IN `ptemario` VARCHAR(50), IN `pprecio` DOUBLE(8,2), IN `pcodigo_profesor` INT, IN `pcodigo_cliente` INT, OUT `pcodigo` INT)
    NO SQL
BEGIN

INSERT INTO curso(nombre,idenficador,fInicio,fFin,temario,precio,cliente_codigo,profesor_codigo)
VALUES(LOWER(pnombre),LOWER(pidentificador),pfinicio,pffin,LOWER(ptemario),pprecio,pcodigo_profesor,pcodigo_cliente);
SET pcodigo = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursoDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursoDelete`(IN `pcodigo` INT)
    NO SQL
BEGIN

UPDATE curso SET activo = false
WHERE codigo = pcodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursogetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursogetAll`()
    NO SQL
BEGIN
SELECT
 c.`codigo` as cursocodigo, c.`nombre` as cursonombre, c.`identificador` as cursoidentificador, c.`fInicio` as cursofinicio, c.`fFin` as cursoffin, c.`nHoras` as cursonhoras, c.`temario` as cursotemario, c.`activo` as cursoactivo, c.`precio` as cursoprecio, 
p.`codigo` as profesorcodigo, p.`NSS` as profesornss, p.`nombre` as profesornombre, p.`apellidos` as profesorapellidos, p.`fNacimiento` as profesorfnacimiento, p.`DNI` as profesordni, p.`direccion` as profesordireccion, p.`poblacion` as profesorpoblacion, p.`codigopostal` as profesorcodigopostal, p.`telefono` as profesortelefono, p.`email` as profesoremail,p.activo as profesoractivo, cli.codigo as clientecodigo, cli.`nombre` as clientenombre, cli.`email` as clienteemail, cli.`telefono` as clientetelefono, cli.identificador as clienteidentificador, cli.`direccion` as clientedireccion, cli.`poblacion` as clientepoblacion, cli.`codigopostal` as clientecodigopostal, cli.activo as clienteactivo
FROM curso c
	LEFT JOIN profesor p ON p.codigo = c.profesor_codigo
  LEFT JOIN cliente cli ON cli.codigo = c.cliente_codigo
WHERE c.activo = true;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursogetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursogetById`(IN `pcodigo` INT)
    NO SQL
BEGIN
SELECT
 c.`codigo` as cursocodigo, c.`nombre` as cursonombre, c.`identificador` as cursoidentificador, c.`fInicio` as cursofinicio, c.`fFin` as cursoffin, c.`nHoras` as cursonhoras, c.`temario` as cursotemario, c.`activo` as cursoactivo, c.`precio` as cursoprecio, 
p.`codigo` as profesorcodigo, p.`NSS` as profesornss, p.`nombre` as profesornombre, p.`apellidos` as profesorapellidos, p.`fNacimiento` as profesorfnacimiento, p.`DNI` as profesordni, p.`direccion` as profesordireccion, p.`poblacion` as profesorpoblacion, p.`codigopostal` as profesorcodigopostal, p.`telefono` as profesortelefono, p.`email` as profesoremail,p.activo as profesoractivo, cli.codigo as clientecodigo, cli.`nombre` as clientenombre, cli.`email` as clienteemail, cli.`telefono` as clientetelefono, cli.identificador as clienteidentificador, cli.`direccion` as clientedireccion, cli.`poblacion` as clientepoblacion, cli.`codigopostal` as clientecodigopostal, cli.activo as clienteactivo, i.codigo as imparticioncodigo,
i.fMatriculacion as imparticionfmatriculacion,
a.`codigo` as alumnocodigo, a.`nombre` as alumnonombre, a.`apellidos` as alumnoapellidos, a.`fNacimiento` as alumnofnacimiento, a.`direccion` as alumnodireccion, a.`poblacion` as alumnopoblacion, a.`codigopostal` as alumnocodigopostal, a.`telefono` as alumnotelefono, a.`email` as alumnoemail, a.`dni` as alumnodni, a.`nHermanos` as alumnonhermanos, a.`activo` as alumnoactivo
	FROM curso c
      INNER JOIN cliente cli ON cli.codigo = c.cliente_codigo
      INNER JOIN profesor p ON p.codigo = c.profesor_codigo
      INNER JOIN imparticion i on i.curso_codigo = c.codigo
      INNER JOIN alumno a ON a.codigo = i.alumno_codigo
   WHERE c.codigo = pcodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursogetByIdentificador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursogetByIdentificador`(IN `pidentificador` VARCHAR(50))
    NO SQL
BEGIN
SELECT
 c.`codigo` as cursocodigo, c.`nombre` as cursonombre, c.`identificador` as cursoidentificador, c.`fInicio` as cursofinicio, c.`fFin` as cursoffin, c.`nHoras` as cursonhoras, c.`temario` as cursotemario, c.`activo` as cursoactivo, c.`precio` as cursoprecio, 
p.`codigo` as profesorcodigo, p.`NSS` as profesornss, p.`nombre` as profesornombre, p.`apellidos` as profesorapellidos, p.`fNacimiento` as profesorfnacimiento, p.`DNI` as profesordni, p.`direccion` as profesordireccion, p.`poblacion` as profesorpoblacion, p.`codigopostal` as profesorcodigopostal, p.`telefono` as profesortelefono, p.`email` as profesoremail,p.activo as profesoractivo, cli.codigo as clientecodigo, cli.`nombre` as clientenombre, cli.`email` as clienteemail, cli.`telefono` as clientetelefono, cli.identificador as clienteidentificador, cli.`direccion` as clientedireccion, cli.`poblacion` as clientepoblacion, cli.`codigopostal` as clientecodigopostal, cli.activo as clienteactivo, i.codigo as imparticioncodigo,
i.fMatriculacion as imparticionfmatriculacion,
a.`codigo` as alumnocodigo, a.`nombre` as alumnonombre, a.`apellidos` as alumnoapellidos, a.`fNacimiento` as alumnofnacimiento, a.`direccion` as alumnodireccion, a.`poblacion` as alumnopoblacion, a.`codigopostal` as alumnocodigopostal, a.`telefono` as alumnotelefono, a.`email` as alumnoemail, a.`dni` as alumnodni, a.`nHermanos` as alumnonhermanos, a.`activo` as alumnoactivo
	FROM curso c
      INNER JOIN cliente cli ON cli.codigo = c.cliente_codigo
      INNER JOIN profesor p ON p.codigo = c.profesor_codigo
      INNER JOIN imparticion i on i.curso_codigo = c.codigo
      INNER JOIN alumno a ON a.codigo = i.alumno_codigo
   WHERE c.identificador = pidentificador;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cursoupdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `cursoupdate`(IN `pcodigo` INT, IN `pnombre` VARCHAR(50), IN `pidentificador` VARCHAR(50), IN `pfinicio` DATE, IN `pffin` DATE, IN `pnhoras` INT, IN `ptemario` VARCHAR(50), IN `pprecio` DOUBLE(8,2), IN `pcliente_codigo` INT, IN `pprofesor_codigo` INT)
    NO SQL
BEGIN

UPDATE curso SET nombre = pnombre, identificador = pidentificador, fInicio = pfinicio, fFin = pffin, nHoras = phoras, temario = ptemario, precio = pprecio, cliente_codigo = pcliente_codigo, profesor_codigo = pprofesor_codigo
WHERE codigo = pcodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorByDni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorByDni`(IN `dni` VARCHAR(9))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE dni = pdni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorCreate`(IN `pnss` VARCHAR(150), IN `pnombre` VARCHAR(150), IN `papellidos` VARCHAR(250), IN `pfNacimiento` DATE, IN `pdni` VARCHAR(9), IN `pdireccion` VARCHAR(150), IN `ppoblacion` VARCHAR(150), IN `pcodigopostal` INT(5), IN `ptelefono` INT(9), IN `pemail` VARCHAR(150), OUT `pcodigo` INT)
BEGIN
	INSERT INTO `profesor` ( 
        `nombre`, 
        `apellidos`, 
        `fNacimiento`, 
        `DNI`, 
        `direccion`, 
        `poblacion`, 
        `codigopostal`, 
        `telefono`, 
        `email`) 
        VALUES (
        LOWER(pnombre),
        LOWER(papellidos),
		pfNacimiento,
        LOWER(pdni),
        LOWER(pdireccion),
        LOWER(poblacion),
		pcodigopostal,
		ptelefono,
        LOWER(pemail)
        );
        SET pcodigo = LAST_INSERT_ID();
        if pnss != '' THEN
			update profesor set nss = pnss where codigo = pcodigo;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorgetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `profesorgetAll`()
    NO SQL
BEGIN

	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE profesor.activo = true;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorgetByDni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetByDni`(IN `pdni` VARCHAR(9))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE dni = pdni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorgetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetById`(IN `pcodigo` INT)
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorgetByNss` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetByNss`(IN `pnss` VARCHAR(12))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE nss = pnss;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesorUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorUpdate`(IN `pnss` VARCHAR(12), IN `pnombre` VARCHAR(150), IN `papellidos` VARCHAR(250), IN `pfnacimiento` DATE, IN `pdni` VARCHAR(9), IN `pdireccion` VARCHAR(250), IN `ppoblacion` VARCHAR(150), IN `pcodigopostal` INT(5), IN `ptelefono` INT(9), IN `pemail` VARCHAR(150))
BEGIN

UPDATE `profesor` 
SET `NSS`=pnss,
    `nombre`=pnombre,
    `apellidos`=papellidos,
    `fNacimiento`=pfnacimiento,
    `DNI`=pdni,
    `direccion`=pdireccion,
    `poblacion`=ppoblacion,
    `codigopostal`=pcodigopostal,
    `telefono`=ptelefono,
    `email`=pemail
WHERE codigo = pcodigo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-04  8:52:29
