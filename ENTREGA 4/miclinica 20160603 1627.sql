-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.24-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema miclinica
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ miclinica;
USE miclinica;

--
-- Table structure for table `miclinica`.`bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `NO_CUENTA` decimal(38,0) NOT NULL,
  `NOMBRE_BANCO` varchar(100) NOT NULL,
  `DIRECCION_BANCO` varchar(200) NOT NULL,
  `DPI` decimal(38,0) NOT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`NO_CUENTA`),
  KEY `REFPACIENTES27` (`DPI`),
  KEY `REFUSUARIO28` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`caja`
--

DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `CODIGO_CAJA` decimal(38,0) NOT NULL,
  `NOMBRE_CAJA` varchar(100) DEFAULT NULL,
  `ENTRADA` decimal(10,0) DEFAULT NULL,
  `SALIDA` decimal(10,0) DEFAULT NULL,
  `ESPECIFICACIONES` varchar(300) DEFAULT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`CODIGO_CAJA`),
  KEY `REFUSUARIO31` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`caja`
--

/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`citas`
--

DROP TABLE IF EXISTS `citas`;
CREATE TABLE `citas` (
  `CITA_ACTUAL` varchar(20) NOT NULL,
  `PROXIMA_CITA` varchar(20) NOT NULL,
  `DPI` decimal(38,0) NOT NULL,
  KEY `REFPACIENTES57` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`citas`
--

/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura` (
  `TIPO_FACTURA` varchar(100) NOT NULL,
  `CANTIDAD` decimal(10,0) DEFAULT NULL,
  `DETALLE` varchar(200) DEFAULT NULL,
  `NO_FACTURA` decimal(38,0) DEFAULT NULL,
  `NO_SERIE` varchar(50) DEFAULT NULL,
  `ID_PRODUCTO` decimal(38,0) NOT NULL,
  `ID_PROVEEDOR` decimal(38,0) NOT NULL,
  KEY `REFFACTURAS6` (`NO_FACTURA`,`NO_SERIE`),
  KEY `REFPRODUCTOS34` (`ID_PRODUCTO`),
  KEY `REFPROVEEDORES43` (`ID_PROVEEDOR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`detalle_factura`
--

/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
CREATE TABLE `detalle_producto` (
  `ID_PRODUCTO` decimal(38,0) NOT NULL,
  `DETALLE_PRODUCTOS` varchar(200) NOT NULL,
  KEY `REFPRODUCTOS45` (`ID_PRODUCTO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`detalle_producto`
--

/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`detalle_roles`
--

DROP TABLE IF EXISTS `detalle_roles`;
CREATE TABLE `detalle_roles` (
  `IDROL` decimal(38,0) NOT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  KEY `REFROLES35` (`IDROL`),
  KEY `REFUSUARIO36` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`detalle_roles`
--

/*!40000 ALTER TABLE `detalle_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_roles` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
CREATE TABLE `diagnostico` (
  `DPI` decimal(38,0) NOT NULL,
  `DETALLE_DIAGNOSTICO` varchar(300) NOT NULL,
  `NOMBRE_ENFERMEDAD` varchar(100) NOT NULL,
  KEY `REFPACIENTES49` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`diagnostico`
--

/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`examenes`
--

DROP TABLE IF EXISTS `examenes`;
CREATE TABLE `examenes` (
  `NOMBRE_LABORATORIO` varchar(100) DEFAULT NULL,
  `DIRECCION_LABORATORIO` varchar(150) DEFAULT NULL,
  `TIPO_EXAMEN` varchar(100) NOT NULL,
  `RESULTADOS` varchar(200) NOT NULL,
  `DPI` decimal(38,0) NOT NULL,
  KEY `REFPACIENTES52` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`examenes`
--

/*!40000 ALTER TABLE `examenes` DISABLE KEYS */;
INSERT INTO `examenes` (`NOMBRE_LABORATORIO`,`DIRECCION_LABORATORIO`,`TIPO_EXAMEN`,`RESULTADOS`,`DPI`) VALUES 
 ('NOMBRE_LABORATORIO','DIRECCION_LABORATORIO','TIPO_EXAMEN','RESULTADOS','0'),
 ('clinica_gualan','bo_ la estacion','patologia',' globulos blancos 6000\r\nglobulos rojos 10000\r\nplaquetas 15000\r\nemoglobina 14','90');
/*!40000 ALTER TABLE `examenes` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `NO_FACTURA` decimal(38,0) NOT NULL,
  `NO_SERIE` varchar(50) NOT NULL,
  `FECHA` varchar(20) NOT NULL,
  `SUBTOTAL` decimal(10,0) DEFAULT NULL,
  `TOTAL` decimal(10,0) NOT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`NO_FACTURA`,`NO_SERIE`),
  KEY `REFUSUARIO30` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`facturas`
--

/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`muestra_medica`
--

DROP TABLE IF EXISTS `muestra_medica`;
CREATE TABLE `muestra_medica` (
  `ID_PRODUCTO` decimal(38,0) NOT NULL,
  `DPI` decimal(38,0) NOT NULL,
  KEY `REFPACIENTES56` (`DPI`),
  KEY `REFPRODUCTOS54` (`ID_PRODUCTO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`muestra_medica`
--

/*!40000 ALTER TABLE `muestra_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `muestra_medica` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`opinion`
--

DROP TABLE IF EXISTS `opinion`;
CREATE TABLE `opinion` (
  `ID_OPINION` decimal(38,0) NOT NULL,
  `COMENTARIO` varchar(250) DEFAULT NULL,
  `DPI` decimal(38,0) NOT NULL,
  PRIMARY KEY (`ID_OPINION`),
  KEY `REFPACIENTES33` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`opinion`
--

/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `DPI` decimal(38,0) NOT NULL,
  `NOMBRE_PACIENTE` varchar(100) NOT NULL,
  `APELLIDO_PACIENTE` varchar(100) NOT NULL,
  `DIRECCION_PACIENTE` varchar(200) NOT NULL,
  `SEXO` char(2) NOT NULL,
  `TEL_PACIENTE` decimal(20,0) DEFAULT NULL,
  `TIPO_SANGRE` varchar(18) NOT NULL,
  `OTROS_DATOS` varchar(200) DEFAULT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`DPI`),
  KEY `REFUSUARIO29` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`pacientes`
--

/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`DPI`,`NOMBRE_PACIENTE`,`APELLIDO_PACIENTE`,`DIRECCION_PACIENTE`,`SEXO`,`TEL_PACIENTE`,`TIPO_SANGRE`,`OTROS_DATOS`,`ID_USUARIO`) VALUES 
 ('333','jose','rivas','chiquimula','M','11111','B','ooo','1234'),
 ('2121','alllan','allan','aaaaaaa','w','34556','a','qqq','1234'),
 ('90','ronald','orellana','gualan zacapa','M','43479916','B+','x','1234'),
 ('5757','allan','paredes','zacapa','M','57559838','O+','null','1234'),
 ('7777','cristh victoria','ramirez orellana','gualan','F','23456787','O+','xxxxx','1234'),
 ('4444','carla','mendez','rio hondo','F','121212','A+','xxx','1234');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `NO_PAGO` decimal(38,0) NOT NULL,
  `TIPO_PAGO` varchar(50) NOT NULL,
  `CANTIDAD_PAGO` decimal(10,0) NOT NULL,
  `NO_FACTURA` decimal(38,0) NOT NULL,
  `NO_SERIE` varchar(50) NOT NULL,
  `DPI` decimal(38,0) NOT NULL,
  PRIMARY KEY (`NO_PAGO`),
  KEY `REFFACTURAS24` (`NO_FACTURA`,`NO_SERIE`),
  KEY `REFPACIENTES25` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`pagos`
--

/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `ID_PRODUCTO` decimal(38,0) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(100) NOT NULL,
  `PRECIO_VENTA` decimal(10,0) NOT NULL,
  `CANTIDAD` decimal(10,0) NOT NULL,
  `TIPO_PRODUCTO` varchar(100) NOT NULL,
  `FECHA` varchar(20) NOT NULL,
  `VENCIMIENTO` varchar(20) NOT NULL,
  `ID_PROVEEDOR` decimal(38,0) NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `REFPROVEEDORES46` (`ID_PROVEEDOR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`ID_PRODUCTO`,`NOMBRE_PRODUCTO`,`PRECIO_VENTA`,`CANTIDAD`,`TIPO_PRODUCTO`,`FECHA`,`VENCIMIENTO`,`ID_PROVEEDOR`) VALUES 
 ('0','NOMBRE_PRODUCTO','0','0','TIPO_PRODUCTO','FECHA','VENCIMIENTO','0'),
 ('12','cetafen','33','45','fisico','2016-05-13','2016-05-31','2');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` decimal(38,0) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` decimal(20,0) DEFAULT NULL,
  `EMAIL` varchar(150) DEFAULT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  KEY `REFUSUARIO32` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `IDROL` decimal(38,0) NOT NULL,
  `NOMBRE_ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`IDROL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`traslados`
--

DROP TABLE IF EXISTS `traslados`;
CREATE TABLE `traslados` (
  `NO_ORDEN` decimal(38,0) NOT NULL,
  `LUGAR_DE_TRASLADO` varchar(100) NOT NULL,
  `DIRECCION_DEL_LUGAR` varchar(200) NOT NULL,
  `FECHA_TRASLADO` varchar(20) NOT NULL,
  `DETALLE_TRASLADO` varchar(250) DEFAULT NULL,
  `DPI` decimal(38,0) NOT NULL,
  `ID_USUARIO` decimal(38,0) NOT NULL,
  PRIMARY KEY (`NO_ORDEN`),
  KEY `REFPACIENTES10` (`DPI`),
  KEY `REFUSUARIO11` (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`traslados`
--

/*!40000 ALTER TABLE `traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `traslados` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
CREATE TABLE `tratamientos` (
  `RECETA` varchar(300) NOT NULL,
  `OBSERVACIONES` varchar(200) NOT NULL,
  `ACCIONES` varchar(200) DEFAULT NULL,
  `DPI` decimal(38,0) NOT NULL,
  KEY `REFPACIENTES9` (`DPI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`tratamientos`
--

/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` (`RECETA`,`OBSERVACIONES`,`ACCIONES`,`DPI`) VALUES 
 ('RECETA','OBSERVACIONES','ACCIONES','0'),
 (' tttttttttttt',' ttttttttt',' ttttttttt','333'),
 (' tomar 1 cucharada de ambroxol\r\n, acetaminofe y una desloratadina al dia',' tomar mucha agua en los proximos 5 dias',' no se requieren','90'),
 (' xxxxxxxxxxxxxx\r\nx',' ititititititi',' ccccccc','333');
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;


--
-- Table structure for table `miclinica`.`usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_USUARIO` decimal(38,0) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `NOMBRE_USUARIO` varchar(150) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` decimal(20,0) DEFAULT NULL,
  `FECHA_CONTRATO` date NOT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miclinica`.`usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
