--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      estudiante
-- Project :      proyecto3.DM1
-- Author :       ronald
--
-- Date Created : Tuesday, May 31, 2016 13:52:38
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: BANCOS 
--

CREATE TABLE BANCOS(
    NO_CUENTA          DECIMAL(38, 0)    NOT NULL,
    NOMBRE_BANCO       VARCHAR(100)      NOT NULL,
    DIRECCION_BANCO    VARCHAR(200)      NOT NULL,
    DPI                DECIMAL(38, 0)    NOT NULL,
    ID_USUARIO         DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (NO_CUENTA)
)ENGINE=MYISAM
;



-- 
-- TABLE: CAJA 
--

CREATE TABLE CAJA(
    CODIGO_CAJA         DECIMAL(38, 0)    NOT NULL,
    NOMBRE_CAJA         VARCHAR(100),
    ENTRADA             DECIMAL(10, 0),
    SALIDA              DECIMAL(10, 0),
    ESPECIFICACIONES    VARCHAR(300),
    ID_USUARIO          DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (CODIGO_CAJA)
)ENGINE=MYISAM
;



-- 
-- TABLE: CITAS 
--

CREATE TABLE CITAS(
    CITA_ACTUAL     VARCHAR(20)       NOT NULL,
    PROXIMA_CITA    VARCHAR(20)       NOT NULL,
    DPI             DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: DETALLE_FACTURA 
--

CREATE TABLE DETALLE_FACTURA(
    TIPO_FACTURA    VARCHAR(100)      NOT NULL,
    CANTIDAD        DECIMAL(10, 0),
    DETALLE         VARCHAR(200),
    NO_FACTURA      DECIMAL(38, 0),
    NO_SERIE        VARCHAR(50),
    ID_PRODUCTO     DECIMAL(38, 0)    NOT NULL,
    ID_PROVEEDOR    DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: DETALLE_PRODUCTO 
--

CREATE TABLE DETALLE_PRODUCTO(
    ID_PRODUCTO          DECIMAL(38, 0)    NOT NULL,
    DETALLE_PRODUCTOS    VARCHAR(200)      NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: DETALLE_ROLES 
--

CREATE TABLE DETALLE_ROLES(
    IDROL         DECIMAL(38, 0)    NOT NULL,
    ID_USUARIO    DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: DIAGNOSTICO 
--

CREATE TABLE DIAGNOSTICO(
    DPI                    DECIMAL(38, 0)    NOT NULL,
    DETALLE_DIAGNOSTICO    VARCHAR(300)      NOT NULL,
    NOMBRE_ENFERMEDAD      VARCHAR(100)      NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: EXAMENES 
--

CREATE TABLE EXAMENES(
    NOMBRE_LABORATORIO       VARCHAR(100),
    DIRECCION_LABORATORIO    VARCHAR(150),
    TIPO_EXAMEN              VARCHAR(100)      NOT NULL,
    RESULTADOS               VARCHAR(200)      NOT NULL,
    DPI                      DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: FACTURAS 
--

CREATE TABLE FACTURAS(
    NO_FACTURA    DECIMAL(38, 0)    NOT NULL,
    NO_SERIE      VARCHAR(50)       NOT NULL,
    FECHA         VARCHAR(20)       NOT NULL,
    SUBTOTAL      DECIMAL(10, 0),
    TOTAL         DECIMAL(10, 0)    NOT NULL,
    ID_USUARIO    DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (NO_FACTURA, NO_SERIE)
)ENGINE=MYISAM
;



-- 
-- TABLE: MUESTRA_MEDICA 
--

CREATE TABLE MUESTRA_MEDICA(
    ID_PRODUCTO    DECIMAL(38, 0)    NOT NULL,
    DPI            DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: OPINION 
--

CREATE TABLE OPINION(
    ID_OPINION    DECIMAL(38, 0)    NOT NULL,
    COMENTARIO    VARCHAR(250),
    DPI           DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (ID_OPINION)
)ENGINE=MYISAM
;



-- 
-- TABLE: PACIENTES 
--

CREATE TABLE PACIENTES(
    DPI                   DECIMAL(38, 0)    NOT NULL,
    NOMBRE_PACIENTE       VARCHAR(100)      NOT NULL,
    APELLIDO_PACIENTE     VARCHAR(100)      NOT NULL,
    DIRECCION_PACIENTE    VARCHAR(200)      NOT NULL,
    SEXO                  CHAR(2)           NOT NULL,
    TEL_PACIENTE          DECIMAL(20, 0),
    TIPO_SANGRE           VARCHAR(18)       NOT NULL,
    OTROS_DATOS           VARCHAR(200),
    ID_USUARIO            DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (DPI)
)ENGINE=MYISAM
;



-- 
-- TABLE: PAGOS 
--

CREATE TABLE PAGOS(
    NO_PAGO          DECIMAL(38, 0)    NOT NULL,
    TIPO_PAGO        VARCHAR(50)       NOT NULL,
    CANTIDAD_PAGO    DECIMAL(10, 0)    NOT NULL,
    NO_FACTURA       DECIMAL(38, 0)    NOT NULL,
    NO_SERIE         VARCHAR(50)       NOT NULL,
    DPI              DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (NO_PAGO)
)ENGINE=MYISAM
;



-- 
-- TABLE: PRODUCTOS 
--

CREATE TABLE PRODUCTOS(
    ID_PRODUCTO        DECIMAL(38, 0)    NOT NULL,
    NOMBRE_PRODUCTO    VARCHAR(100)      NOT NULL,
    PRECIO_VENTA       DECIMAL(10, 0)    NOT NULL,
    CANTIDAD           DECIMAL(10, 0)    NOT NULL,
    TIPO_PRODUCTO      VARCHAR(100)      NOT NULL,
    FECHA              VARCHAR(20)       NOT NULL,
    VENCIMIENTO        VARCHAR(20)       NOT NULL,
    ID_PROVEEDOR       DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (ID_PRODUCTO)
)ENGINE=MYISAM
;



-- 
-- TABLE: PROVEEDORES 
--

CREATE TABLE PROVEEDORES(
    ID_PROVEEDOR    DECIMAL(38, 0)    NOT NULL,
    NOMBRE          VARCHAR(100)      NOT NULL,
    APELLIDO        VARCHAR(100)      NOT NULL,
    DIRECCION       VARCHAR(200)      NOT NULL,
    TELEFONO        DECIMAL(20, 0),
    EMAIL           VARCHAR(150),
    ID_USUARIO      DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (ID_PROVEEDOR)
)ENGINE=MYISAM
;



-- 
-- TABLE: ROLES 
--

CREATE TABLE ROLES(
    IDROL         DECIMAL(38, 0)    NOT NULL,
    NOMBRE_ROL    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (IDROL)
)ENGINE=MYISAM
;



-- 
-- TABLE: TRASLADOS 
--

CREATE TABLE TRASLADOS(
    NO_ORDEN               DECIMAL(38, 0)    NOT NULL,
    LUGAR_DE_TRASLADO      VARCHAR(100)      NOT NULL,
    DIRECCION_DEL_LUGAR    VARCHAR(200)      NOT NULL,
    FECHA_TRASLADO         VARCHAR(20)       NOT NULL,
    DETALLE_TRASLADO       VARCHAR(250),
    DPI                    DECIMAL(38, 0)    NOT NULL,
    ID_USUARIO             DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (NO_ORDEN)
)ENGINE=MYISAM
;



-- 
-- TABLE: TRATAMIENTOS 
--

CREATE TABLE TRATAMIENTOS(
    RECETA           VARCHAR(300)      NOT NULL,
    OBSERVACIONES    VARCHAR(200)      NOT NULL,
    ACCIONES         VARCHAR(200),
    DPI              DECIMAL(38, 0)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    ID_USUARIO        DECIMAL(38, 0)    NOT NULL,
    APELLIDO          VARCHAR(100)      NOT NULL,
    NOMBRE            VARCHAR(100)      NOT NULL,
    NOMBRE_USUARIO    VARCHAR(150)      NOT NULL,
    DIRECCION         VARCHAR(200)      NOT NULL,
    TELEFONO          DECIMAL(20, 0),
    FECHA_CONTRATO    DATE              NOT NULL,
    PRIMARY KEY (ID_USUARIO)
)ENGINE=MYISAM
;



-- 
-- TABLE: BANCOS 
--

ALTER TABLE BANCOS ADD CONSTRAINT REFPACIENTES27 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;

ALTER TABLE BANCOS ADD CONSTRAINT REFUSUARIO28 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: CAJA 
--

ALTER TABLE CAJA ADD CONSTRAINT REFUSUARIO31 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: CITAS 
--

ALTER TABLE CITAS ADD CONSTRAINT REFPACIENTES57 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


-- 
-- TABLE: DETALLE_FACTURA 
--

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT REFFACTURAS6 
    FOREIGN KEY (NO_FACTURA, NO_SERIE)
    REFERENCES FACTURAS(NO_FACTURA, NO_SERIE)
;

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT REFPRODUCTOS34 
    FOREIGN KEY (ID_PRODUCTO)
    REFERENCES PRODUCTOS(ID_PRODUCTO)
;

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT REFPROVEEDORES43 
    FOREIGN KEY (ID_PROVEEDOR)
    REFERENCES PROVEEDORES(ID_PROVEEDOR)
;


-- 
-- TABLE: DETALLE_PRODUCTO 
--

ALTER TABLE DETALLE_PRODUCTO ADD CONSTRAINT REFPRODUCTOS45 
    FOREIGN KEY (ID_PRODUCTO)
    REFERENCES PRODUCTOS(ID_PRODUCTO)
;


-- 
-- TABLE: DETALLE_ROLES 
--

ALTER TABLE DETALLE_ROLES ADD CONSTRAINT REFROLES35 
    FOREIGN KEY (IDROL)
    REFERENCES ROLES(IDROL)
;

ALTER TABLE DETALLE_ROLES ADD CONSTRAINT REFUSUARIO36 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: DIAGNOSTICO 
--

ALTER TABLE DIAGNOSTICO ADD CONSTRAINT REFPACIENTES49 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


-- 
-- TABLE: EXAMENES 
--

ALTER TABLE EXAMENES ADD CONSTRAINT REFPACIENTES52 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


-- 
-- TABLE: FACTURAS 
--

ALTER TABLE FACTURAS ADD CONSTRAINT REFUSUARIO30 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: MUESTRA_MEDICA 
--

ALTER TABLE MUESTRA_MEDICA ADD CONSTRAINT REFPACIENTES56 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;

ALTER TABLE MUESTRA_MEDICA ADD CONSTRAINT REFPRODUCTOS54 
    FOREIGN KEY (ID_PRODUCTO)
    REFERENCES PRODUCTOS(ID_PRODUCTO)
;


-- 
-- TABLE: OPINION 
--

ALTER TABLE OPINION ADD CONSTRAINT REFPACIENTES33 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


-- 
-- TABLE: PACIENTES 
--

ALTER TABLE PACIENTES ADD CONSTRAINT REFUSUARIO29 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: PAGOS 
--

ALTER TABLE PAGOS ADD CONSTRAINT REFFACTURAS24 
    FOREIGN KEY (NO_FACTURA, NO_SERIE)
    REFERENCES FACTURAS(NO_FACTURA, NO_SERIE)
;

ALTER TABLE PAGOS ADD CONSTRAINT REFPACIENTES25 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


-- 
-- TABLE: PRODUCTOS 
--

ALTER TABLE PRODUCTOS ADD CONSTRAINT REFPROVEEDORES46 
    FOREIGN KEY (ID_PROVEEDOR)
    REFERENCES PROVEEDORES(ID_PROVEEDOR)
;


-- 
-- TABLE: PROVEEDORES 
--

ALTER TABLE PROVEEDORES ADD CONSTRAINT REFUSUARIO32 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: TRASLADOS 
--

ALTER TABLE TRASLADOS ADD CONSTRAINT REFPACIENTES10 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;

ALTER TABLE TRASLADOS ADD CONSTRAINT REFUSUARIO11 
    FOREIGN KEY (ID_USUARIO)
    REFERENCES USUARIO(ID_USUARIO)
;


-- 
-- TABLE: TRATAMIENTOS 
--

ALTER TABLE TRATAMIENTOS ADD CONSTRAINT REFPACIENTES9 
    FOREIGN KEY (DPI)
    REFERENCES PACIENTES(DPI)
;


