--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      estudiante
-- Project :      base_clinica.DM1
-- Author :       ronald
--
-- Date Created : Friday, April 15, 2016 11:50:14
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: bancos 
--

CREATE TABLE bancos(
    no_cuenta          NUMBER(38, 0)    NOT NULL,
    nombre_banco       VARCHAR2(100)    NOT NULL,
    direccion_banco    VARCHAR2(200)    NOT NULL,
    DPI                NUMBER(38, 0)    NOT NULL,
    id_usuario         NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (no_cuenta)
)
;



-- 
-- TABLE: caja 
--

CREATE TABLE caja(
    codigo_caja         NUMBER(38, 0)    NOT NULL,
    nombre_caja         VARCHAR2(100),
    entrada             NUMBER(10, 0),
    salida              NUMBER(10, 0),
    especificaciones    VARCHAR2(300),
    id_usuario          NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (codigo_caja)
)
;



-- 
-- TABLE: citas 
--

CREATE TABLE citas(
    cita_actual     DATE             NOT NULL,
    proxima_cita    DATE             NOT NULL,
    DPI             NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: detalle_factura 
--

CREATE TABLE detalle_factura(
    tipo_factura    VARCHAR2(100)    NOT NULL,
    cantidad        NUMBER(10, 0),
    detalle         VARCHAR2(200),
    no_factura      NUMBER(38, 0),
    no_serie        VARCHAR2(50),
    id_producto     NUMBER(38, 0)    NOT NULL,
    id_proveedor    NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: detalle_producto 
--

CREATE TABLE detalle_producto(
    id_producto          NUMBER(38, 0)    NOT NULL,
    detalle_productos    VARCHAR2(200)    NOT NULL
)
;



-- 
-- TABLE: detalle_roles 
--

CREATE TABLE detalle_roles(
    idrol         NUMBER(38, 0)    NOT NULL,
    id_usuario    NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: diagnostico 
--

CREATE TABLE diagnostico(
    DPI                    NUMBER(38, 0)    NOT NULL,
    detalle_diagnostico    VARCHAR2(300)    NOT NULL,
    nombre_enfermedad      VARCHAR2(100)    NOT NULL
)
;



-- 
-- TABLE: examenes 
--

CREATE TABLE examenes(
    nombre_laboratorio       CHAR(10),
    direccion_laboratorio    CHAR(10),
    tipo_examen              VARCHAR2(100)    NOT NULL,
    resultados               VARCHAR2(200)    NOT NULL,
    DPI                      NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: facturas 
--

CREATE TABLE facturas(
    no_factura    NUMBER(38, 0)    NOT NULL,
    no_serie      VARCHAR2(50)     NOT NULL,
    fecha         DATE             NOT NULL,
    subtotal      NUMBER(10, 0),
    total         NUMBER(10, 0)    NOT NULL,
    id_usuario    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (no_factura, no_serie)
)
;



-- 
-- TABLE: muestra_medica 
--

CREATE TABLE muestra_medica(
    id_producto    NUMBER(38, 0)    NOT NULL,
    DPI            NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: opinion 
--

CREATE TABLE opinion(
    id_opinion    NUMBER(38, 0)    NOT NULL,
    comentario    VARCHAR2(250),
    DPI           NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (id_opinion)
)
;



-- 
-- TABLE: pacientes 
--

CREATE TABLE pacientes(
    DPI                   NUMBER(38, 0)    NOT NULL,
    nombre_paciente       VARCHAR2(100)    NOT NULL,
    apellido_paciente     VARCHAR2(100)    NOT NULL,
    direccion_paciente    VARCHAR2(200)    NOT NULL,
    sexo                  CHAR(2)          NOT NULL,
    tel_paciente          NUMBER(20, 0),
    tipo_sangre           VARCHAR2(18)     NOT NULL,
    otros_datos           VARCHAR2(200),
    id_usuario            NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (DPI)
)
;



-- 
-- TABLE: pagos 
--

CREATE TABLE pagos(
    no_pago          NUMBER(38, 0)    NOT NULL,
    tipo_pago        VARCHAR2(50)     NOT NULL,
    cantidad_pago    NUMBER(10, 0)    NOT NULL,
    no_factura       NUMBER(38, 0)    NOT NULL,
    no_serie         VARCHAR2(50)     NOT NULL,
    DPI              NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (no_pago)
)
;



-- 
-- TABLE: productos 
--

CREATE TABLE productos(
    id_producto        NUMBER(38, 0)    NOT NULL,
    nombre_producto    VARCHAR2(100)    NOT NULL,
    precio_venta       NUMBER(10, 0)    NOT NULL,
    cantidad           NUMBER(10, 0)    NOT NULL,
    tipo_producto      VARCHAR2(100)    NOT NULL,
    fecha              DATE             NOT NULL,
    vencimiento        DATE             NOT NULL,
    id_proveedor       NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (id_producto)
)
;



-- 
-- TABLE: proveedores 
--

CREATE TABLE proveedores(
    id_proveedor    NUMBER(38, 0)    NOT NULL,
    nombre          VARCHAR2(100)    NOT NULL,
    apellido        VARCHAR2(100)    NOT NULL,
    direccion       VARCHAR2(200)    NOT NULL,
    telefono        NUMBER(20, 0),
    email           VARCHAR2(150),
    id_usuario      NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (id_proveedor)
)
;



-- 
-- TABLE: roles 
--

CREATE TABLE roles(
    idrol         NUMBER(38, 0)    NOT NULL,
    nombre_rol    VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (idrol)
)
;



-- 
-- TABLE: traslados 
--

CREATE TABLE traslados(
    no_orden               NUMBER(38, 0)    NOT NULL,
    lugar_de_traslado      VARCHAR2(100)    NOT NULL,
    direccion_del_lugar    VARCHAR2(200)    NOT NULL,
    fecha_traslado         DATE             NOT NULL,
    detalle_traslado       VARCHAR2(250),
    DPI                    NUMBER(38, 0)    NOT NULL,
    id_usuario             NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (no_orden)
)
;



-- 
-- TABLE: tratamientos 
--

CREATE TABLE tratamientos(
    receta           VARCHAR2(300)    NOT NULL,
    observaciones    VARCHAR2(200)    NOT NULL,
    acciones         VARCHAR2(200),
    DPI              NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: usuario 
--

CREATE TABLE usuario(
    id_usuario        NUMBER(38, 0)    NOT NULL,
    apellido          VARCHAR2(100)    NOT NULL,
    nombre            VARCHAR2(100)    NOT NULL,
    nombre_usuario    VARCHAR2(150)    NOT NULL,
    direccion         VARCHAR2(200)    NOT NULL,
    telefono          NUMBER(20, 0),
    fecha_contrato    DATE             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (id_usuario)
)
;



-- 
-- TABLE: bancos 
--

ALTER TABLE bancos ADD CONSTRAINT Refpacientes27 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;

ALTER TABLE bancos ADD CONSTRAINT Refusuario28 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: caja 
--

ALTER TABLE caja ADD CONSTRAINT Refusuario31 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: citas 
--

ALTER TABLE citas ADD CONSTRAINT Refpacientes57 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: detalle_factura 
--

ALTER TABLE detalle_factura ADD CONSTRAINT Reffacturas6 
    FOREIGN KEY (no_factura, no_serie)
    REFERENCES facturas(no_factura, no_serie)
;

ALTER TABLE detalle_factura ADD CONSTRAINT Refproductos34 
    FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto)
;

ALTER TABLE detalle_factura ADD CONSTRAINT Refproveedores43 
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id_proveedor)
;


-- 
-- TABLE: detalle_producto 
--

ALTER TABLE detalle_producto ADD CONSTRAINT Refproductos45 
    FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto)
;


-- 
-- TABLE: detalle_roles 
--

ALTER TABLE detalle_roles ADD CONSTRAINT Refroles35 
    FOREIGN KEY (idrol)
    REFERENCES roles(idrol)
;

ALTER TABLE detalle_roles ADD CONSTRAINT Refusuario36 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: diagnostico 
--

ALTER TABLE diagnostico ADD CONSTRAINT Refpacientes49 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: examenes 
--

ALTER TABLE examenes ADD CONSTRAINT Refpacientes52 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: facturas 
--

ALTER TABLE facturas ADD CONSTRAINT Refusuario30 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: muestra_medica 
--

ALTER TABLE muestra_medica ADD CONSTRAINT Refproductos54 
    FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto)
;

ALTER TABLE muestra_medica ADD CONSTRAINT Refpacientes56 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: opinion 
--

ALTER TABLE opinion ADD CONSTRAINT Refpacientes33 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: pacientes 
--

ALTER TABLE pacientes ADD CONSTRAINT Refusuario29 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: pagos 
--

ALTER TABLE pagos ADD CONSTRAINT Reffacturas24 
    FOREIGN KEY (no_factura, no_serie)
    REFERENCES facturas(no_factura, no_serie)
;

ALTER TABLE pagos ADD CONSTRAINT Refpacientes25 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


-- 
-- TABLE: productos 
--

ALTER TABLE productos ADD CONSTRAINT Refproveedores46 
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id_proveedor)
;


-- 
-- TABLE: proveedores 
--

ALTER TABLE proveedores ADD CONSTRAINT Refusuario32 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: traslados 
--

ALTER TABLE traslados ADD CONSTRAINT Refpacientes10 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;

ALTER TABLE traslados ADD CONSTRAINT Refusuario11 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: tratamientos 
--

ALTER TABLE tratamientos ADD CONSTRAINT Refpacientes9 
    FOREIGN KEY (DPI)
    REFERENCES pacientes(DPI)
;


