-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mf0966_3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mf0966_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mf0966_3` ;
USE `mf0966_3` ;

-- -----------------------------------------------------
-- Table `mf0966_3`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`alumno` (
  `codigo` INT NOT NULL AUTO_INCREMENT COMMENT 'el campo clave de la tabla. Es auto generado.',
  `nombre` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  `apellidos` VARCHAR(250) CHARACTER SET 'utf8mb3' NOT NULL,
  `fNacimiento` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(250) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `poblacion` VARCHAR(150) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `codigopostal` INT(5) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(150) CHARACTER SET 'utf8mb3' NOT NULL,
  `dni` VARCHAR(9) CHARACTER SET 'utf8mb3' NOT NULL,
  `nHermanos` INT NULL DEFAULT '0',
  `activo` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7;


-- -----------------------------------------------------
-- Table `mf0966_3`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`cliente` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` TEXT CHARACTER SET 'utf8mb3' NOT NULL,
  `email` VARCHAR(150) CHARACTER SET 'utf8mb3' NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(250) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `poblacion` VARCHAR(150) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `codigopostal` INT(5) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `identificador` VARCHAR(15) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 4;


-- -----------------------------------------------------
-- Table `mf0966_3`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`profesor` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `NSS` BIGINT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  `apellidos` VARCHAR(250) CHARACTER SET 'utf8mb3' NOT NULL,
  `fNacimiento` DATE NULL DEFAULT NULL,
  `DNI` VARCHAR(9) CHARACTER SET 'utf8mb3' NOT NULL,
  `direccion` VARCHAR(250) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `poblacion` VARCHAR(150) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `codigopostal` INT(5) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(150) CHARACTER SET 'utf8mb3' NOT NULL,
  `activo` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2;


-- -----------------------------------------------------
-- Table `mf0966_3`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`curso` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8mb3' NOT NULL,
  `identificador` VARCHAR(12) CHARACTER SET 'utf8mb3' NOT NULL,
  `fInicio` DATE NULL DEFAULT NULL,
  `fFin` DATE NULL DEFAULT NULL,
  `nHoras` INT NOT NULL,
  `temario` TEXT CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `activo` TINYINT NULL DEFAULT '1',
  `cliente_codigo` INT NULL DEFAULT NULL,
  `precio` DOUBLE(8,2) NULL DEFAULT '0.00',
  `profesor_codigo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_curso_cliente_codigo_idx` (`cliente_codigo` ASC) VISIBLE,
  INDEX `fk_curso_profesor_codigo_idx` (`profesor_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_cliente_codigo`
    FOREIGN KEY (`cliente_codigo`)
    REFERENCES `mf0966_3`.`cliente` (`codigo`),
  CONSTRAINT `fk_curso_profesor_codigo`
    FOREIGN KEY (`profesor_codigo`)
    REFERENCES `mf0966_3`.`profesor` (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 5;


-- -----------------------------------------------------
-- Table `mf0966_3`.`imparticion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`imparticion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `curso_codigo` INT NOT NULL,
  `alumno_codigo` INT NOT NULL,
  `fMatriculacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_imparticion_alumno_codigo_idx` (`alumno_codigo` ASC) VISIBLE,
  INDEX `fk_imparticion_curso_codigo_idx` (`curso_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_imparticion_alumno_codigo`
    FOREIGN KEY (`alumno_codigo`)
    REFERENCES `mf0966_3`.`alumno` (`codigo`),
  CONSTRAINT `fk_imparticion_curso_codigo`
    FOREIGN KEY (`curso_codigo`)
    REFERENCES `mf0966_3`.`curso` (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 51;


-- -----------------------------------------------------
-- Table `mf0966_3`.`alumno_has_resenyas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mf0966_3`.`alumno_has_resenyas` (
  `alumno_codigo` INT NOT NULL,
  `curso_codigo` INT NOT NULL,
  `resenya` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`alumno_codigo`, `curso_codigo`),
  INDEX `fk_alumno_has_curso_curso1_idx` (`curso_codigo` ASC) VISIBLE,
  INDEX `fk_alumno_has_curso_alumno1_idx` (`alumno_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_has_curso_alumno1`
    FOREIGN KEY (`alumno_codigo`)
    REFERENCES `mf0966_3`.`alumno` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_has_curso_curso1`
    FOREIGN KEY (`curso_codigo`)
    REFERENCES `mf0966_3`.`curso` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mf0966_3` ;

-- -----------------------------------------------------
-- procedure alumnoCreate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoCreate`(IN `papellidos` VARCHAR(250), IN `pcodigopostal` INT(5), IN `pdireccion` VARCHAR(250), IN `pdni` VARCHAR(9), IN `pemail` VARCHAR(150), IN `pfNacimiento` DATE, IN `pnHermanos` INT(2), IN `pnombre` VARCHAR(50), IN `ppoblacion` VARCHAR(150), IN `ptelefono` INT(9), OUT `pcodigo` INT)
BEGIN

INSERT	INTO alumno(nombre,apellidos,dni,email,direccion,codigopostal,poblacion,fNacimiento,telefono,nHermanos)
VALUES(LOWER(pnombre),LOWER(papellidos),LOWER(pdni),LOWER(pemail),LOWER(pdireccion),pcodigopostal,LOWER(ppoblacion),pfNacimiento,ptelefono,pnHermanos);
SET pcodigo = LAST_INSERT_ID();

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnoDelete
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoDelete`(IN `pcodigo` INT)
    NO SQL
BEGIN

DELETE FROM alumno WHERE codigo = pcodigo;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnoInforme
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnoUpdate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnoUpdate`(IN `papellidos` VARCHAR(250), IN `pcodigo` INT, IN `pcodigopostal` INT(5), IN `pdireccion` VARCHAR(250), IN `pdni` VARCHAR(9), IN `pemail` VARCHAR(150), IN `pfNacimiento` DATE, IN `pnHermanos` INT(2), IN `pnombre` VARCHAR(150), IN `ppoblacion` VARCHAR(150), IN `ptelefono` INT(9))
    NO SQL
BEGIN

UPDATE alumno 
SET nombre = LOWER(pnombre),apellidos = LOWER(papellidos), dni = LOWER(pdni),email = LOWER(pemail),direccion=LOWER(pdireccion),codigopostal=pcodigopostal,poblacion=LOWER(ppoblacion),fNacimiento=pfNacimiento,telefono=ptelefono,nHermanos=pnHermanos
WHERE codigo = pcodigo;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnogetAll
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnogetAll`()
    NO SQL
BEGIN
	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo
	FROM `alumno`
    WHERE alumno.activo = true;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnogetByCurso
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnogetByCurso`(IN `pcursocodigo` INT)
BEGIN
	SELECT a.`codigo` as alumnocodigo, a.`nombre` as alumnonombre, a.`apellidos` as alumnoapellidos, a.`fNacimiento` as alumnofnacimiento, a.`direccion` as alumnodireccion, a.`poblacion` as alumnopoblacion, a.`codigopostal` as alumnocodigopostal, a.`telefono` as alumnotelefono, a.`email` as alumnoemail, a.`dni` as alumnodni, a.`nHermanos` as alumnonhermanos, a.`activo` as alumnoactivo
    FROM `alumno` as a 
		inner join imparticion as i ON i.alumno_codigo = a.codigo
        inner join curso as c ON i.curso_codigo = c.codigo
	WHERE c.codigo = pcursocodigo
    group by a.codigo;
        
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnogetByDni
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnogetByDni`(IN `pdni` VARCHAR(9))
BEGIN
	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo 
    FROM `alumno`
	WHERE dni = pdni;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure alumnogetById
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `alumnogetById`(IN `pcodigo` INT)
    NO SQL
BEGIN

	SELECT `codigo` as alumnocodigo, `nombre` as alumnonombre, `apellidos` as alumnoapellidos, `fNacimiento` as alumnofnacimiento, `direccion` as alumnodireccion, `poblacion` as alumnopoblacion, `codigopostal` as alumnocodigopostal, `telefono` as alumnotelefono, `email` as alumnoemail, `dni` as alumnodni, `nHermanos` as alumnonhermanos, `activo` as alumnoactivo
    FROM `alumno`
	WHERE codigo = pcodigo;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clienteCreate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clienteInforme
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clienteInforme`(IN `pcodigo` INT)
BEGIN
SELECT c.`codigo` as clientecodigo, c.`nombre` as clientenombre, c.`email` as clienteemail, c.`telefono` as clientetelefono, c.`direccion` as clientedireccion, c.`poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,c.`identificador` as clienteidentificador,c.activo as clienteactivo, cu.codigo as cursocodigo,cu.nombre as cursonombre,cu.identificador as cursoidentificador, cu.fInicio as cursofinicio,cu.fFin as cursoffin,cu.nhoras as cursonhoras,cu.precio as cursoprecio FROM cliente as c LEFT JOIN curso as cu ON cu.cliente_codigo = c.codigo WHERE c.codigo = pcodigo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clienteUpdate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clientegetAll
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `clientegetAll`()
    NO SQL
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE cliente.activo = true;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clientegetById
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientegetById`(IN `pcodigo` INT)
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE codigo = pcodigo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure clientegetByIdentificador
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientegetByIdentificador`(IN `pidentificador` VARCHAR(15))
BEGIN
	SELECT`codigo` as clientecodigo, `nombre` as clientenombre, `email` as clienteemail, `telefono` as clientetelefono, `direccion` as clientedireccion, `poblacion` as clientepoblacion, `codigopostal` as clientecodigopostal,`identificador` as clienteidentificador,activo as clienteactivo
	FROM `cliente`
    WHERE identificador = pidentificador;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursoDelete
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `cursoDelete`(IN `pcodigo` INT)
    NO SQL
BEGIN

UPDATE curso SET activo = false
WHERE codigo = pcodigo;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursocreate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `cursocreate`(IN `pnombre` VARCHAR(50), IN `pidentificador` VARCHAR(50), IN `pfinicio` DATE, IN `pffin` DATE, IN `ptemario` VARCHAR(50), IN `pprecio` DOUBLE(8,2), IN `pcodigo_profesor` INT, IN `pcodigo_cliente` INT, OUT `pcodigo` INT)
    NO SQL
BEGIN

INSERT INTO curso(nombre,idenficador,fInicio,fFin,temario,precio,cliente_codigo,profesor_codigo)
VALUES(LOWER(pnombre),LOWER(pidentificador),pfinicio,pffin,LOWER(ptemario),pprecio,pcodigo_profesor,pcodigo_cliente);
SET pcodigo = LAST_INSERT_ID();

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursogetAll
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursogetById
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursogetByIdentificador
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure cursoupdate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `cursoupdate`(IN `pcodigo` INT, IN `pnombre` VARCHAR(50), IN `pidentificador` VARCHAR(50), IN `pfinicio` DATE, IN `pffin` DATE, IN `pnhoras` INT, IN `ptemario` VARCHAR(50), IN `pprecio` DOUBLE(8,2), IN `pcliente_codigo` INT, IN `pprofesor_codigo` INT)
    NO SQL
BEGIN

UPDATE curso SET nombre = pnombre, identificador = pidentificador, fInicio = pfinicio, fFin = pffin, nHoras = phoras, temario = ptemario, precio = pprecio, cliente_codigo = pcliente_codigo, profesor_codigo = pprofesor_codigo
WHERE codigo = pcodigo;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorByDni
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorByDni`(IN `dni` VARCHAR(9))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE dni = pdni;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorCreate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorUpdate
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
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


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorgetAll
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `profesorgetAll`()
    NO SQL
BEGIN

	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE profesor.activo = true;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorgetByDni
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetByDni`(IN `pdni` VARCHAR(9))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE dni = pdni;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorgetById
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetById`(IN `pcodigo` INT)
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE codigo = pcodigo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure profesorgetByNss
-- -----------------------------------------------------

DELIMITER $$
USE `mf0966_3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesorgetByNss`(IN `pnss` VARCHAR(12))
BEGIN
	SELECT `codigo` as profesorcodigo, `NSS` as profesornss, `nombre` as profesornombre, `apellidos` as profesorapellidos, `fNacimiento` as profesorfnacimiento, `DNI` as profesordni, `direccion` as profesordireccion, `poblacion` as profesorpoblacion, `codigopostal` as profesorcodigopostal, `telefono` as profesortelefono, `email` as profesoremail,activo as profesoractivo
	FROM `profesor`
    WHERE nss = pnss;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
