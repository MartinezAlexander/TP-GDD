USE [GD2C2020]
GO

----------------------------- BORRADO DE LAS TABLAS, PROCEDURE, TRIGGERS Y SCHEAMA SI EXISTEN ------------------

IF OBJECT_ID (N'ASADO_EN_CASA.validacion_item_compra', N'TR') IS NOT NULL
    DROP TRIGGER ASADO_EN_CASA.validacion_item_compra;
GO

IF OBJECT_ID (N'ASADO_EN_CASA.validacion_item_factura', N'TR') IS NOT NULL
    DROP TRIGGER ASADO_EN_CASA.validacion_item_factura;
GO

IF OBJECT_ID (N'ASADO_EN_CASA.procedure_creates', N'P') IS NOT NULL
    DROP PROCEDURE ASADO_EN_CASA.procedure_creates;
GO

IF OBJECT_ID (N'ASADO_EN_CASA.procedure_inserts', N'P') IS NOT NULL
    DROP PROCEDURE ASADO_EN_CASA.procedure_inserts;
GO

IF OBJECT_ID ('ASADO_EN_CASA.item_factura', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.item_factura;
END 

IF OBJECT_ID ('ASADO_EN_CASA.item_compra', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.item_compra;
END

IF OBJECT_ID ('ASADO_EN_CASA.autos', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.autos;
END

IF OBJECT_ID ('ASADO_EN_CASA.auto_parte_x_modelo', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.auto_parte_x_modelo;
END

IF OBJECT_ID ('ASADO_EN_CASA.auto_partes', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.auto_partes;
END

IF OBJECT_ID ('ASADO_EN_CASA.rubro_autoparte', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.rubro_autoparte;
END

IF OBJECT_ID ('ASADO_EN_CASA.modelos', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.modelos;
END

IF OBJECT_ID ('ASADO_EN_CASA.tipos_cajas', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.tipos_cajas;
END

IF OBJECT_ID ('ASADO_EN_CASA.tipos_autos', 'U') IS NOT NULL
BEGIN	
	DROP TABLE ASADO_EN_CASA.tipos_autos;
END

IF OBJECT_ID ('ASADO_EN_CASA.motores', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.motores;
END

IF OBJECT_ID ('ASADO_EN_CASA.fabricantes', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.fabricantes;
END

IF OBJECT_ID ('ASADO_EN_CASA.tipos_transmisiones', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.tipos_transmisiones;
END

IF OBJECT_ID ('ASADO_EN_CASA.compras', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.compras;
END

IF OBJECT_ID ('ASADO_EN_CASA.facturas', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.facturas;
END

IF OBJECT_ID ('ASADO_EN_CASA.sucursales', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.sucursales;
END

IF OBJECT_ID ('ASADO_EN_CASA.clientes', 'U') IS NOT NULL
BEGIN 
	DROP TABLE ASADO_EN_CASA.clientes;
END
GO

IF EXISTS (SELECT * FROM sys.schemas WHERE name = N'ASADO_EN_CASA')
    DROP SCHEMA [ASADO_EN_CASA]
GO

--------------------------------- PROCEDURE PARA LA CREACION DE LAS TABLAS DEL DER -------------------------------

CREATE SCHEMA [ASADO_EN_CASA]
GO

CREATE PROCEDURE ASADO_EN_CASA.procedure_creates
AS

CREATE TABLE [ASADO_EN_CASA].clientes(
	cliente_nro INTEGER IDENTITY PRIMARY KEY,
	cliente_apellido NVARCHAR(255) NOT NULL,
	cliente_nombre NVARCHAR(255) NOT NULL,
	cliente_direccion NVARCHAR(255) NOT NULL,
	cliente_dni DECIMAL(18,0) NOT NULL,
	cliente_fecha_nac DATETIME2(3) NOT NULL,
	cliente_mail NVARCHAR(255) NOT NULL);


CREATE TABLE [ASADO_EN_CASA].sucursales(
	sucursal_nro INTEGER IDENTITY PRIMARY KEY,
	sucursal_direccion NVARCHAR(255) NOT NULL,
	sucursal_mail NVARCHAR(255) NOT NULL,
	sucursal_telefono DECIMAL(18,0) NOT NULL,
	sucursal_ciudad NVARCHAR(255) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].facturas(
	factura_nro DECIMAL(18,0) PRIMARY KEY,
	factura_fecha  DATETIME2(3) NOT NULL,
	cliente_nro INTEGER NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].clientes,
	sucursal_nro INTEGER NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].sucursales);

CREATE TABLE [ASADO_EN_CASA].compras(
	compra_nro DECIMAL(18,0) PRIMARY KEY,
	compra_fecha DATETIME2(3) NOT NULL,
	cliente_nro INTEGER NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].clientes,
	sucursal_nro INTEGER NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].sucursales);

CREATE TABLE [ASADO_EN_CASA].motores(
	tipo_motor_codigo DECIMAL(18,0) PRIMARY KEY);

CREATE TABLE [ASADO_EN_CASA].fabricantes(
	fabricante_nro INTEGER IDENTITY PRIMARY KEY,
	fabricante_nombre NVARCHAR(255) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].tipos_cajas(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY,
	tipo_caja_desc NVARCHAR(255) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].tipos_transmisiones(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY,
	tipo_transmision_desc NVARCHAR(255) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].tipos_autos(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY,
	tipo_auto_desc NVARCHAR(255) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].modelos(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY,
	modelo_nombre NVARCHAR(255) NOT NULL,
	modelo_potencia DECIMAL(18,0) NOT NULL,
	fabricante_nro INTEGER NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].fabricantes,
	tipo_auto_cod DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].tipos_autos,
	tipo_cajas DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].tipos_cajas,
	tipo_transmision DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].tipos_transmisiones,
	tipo_motor_codigo DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].motores);

CREATE TABLE [ASADO_EN_CASA].rubro_autoparte(
	rubro_auto_parte_codigo INTEGER IDENTITY PRIMARY KEY,
	rubro_descripcion NVARCHAR(155) NOT NULL);

CREATE TABLE [ASADO_EN_CASA].auto_partes(
	auto_parte_codigo DECIMAL(18,0)	PRIMARY KEY,
	auto_parte_descripcion NVARCHAR(255) NOT NULL,
	precio_unitario INTEGER CHECK (precio_unitario > 0), 
	rubro_autoparte_codigo INTEGER FOREIGN KEY REFERENCES [ASADO_EN_CASA].rubro_autoparte);

CREATE TABLE [ASADO_EN_CASA].auto_parte_x_modelo(
	auto_parte_codigo DECIMAL(18,0)	NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].auto_partes,
	modelo_codigo DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].modelos,
	PRIMARY KEY (auto_parte_codigo, modelo_codigo));

CREATE TABLE [ASADO_EN_CASA].autos(
	auto_nro INTEGER IDENTITY PRIMARY KEY,
	auto_nro_chasis NVARCHAR(50) NOT NULL,
	auto_nro_motor NVARCHAR(50) NOT NULL,
	auto_patente NVARCHAR(50) NOT NULL,
	auto_fecha_alta DATETIME2(3) NOT NULL,
	auto_cant_kms DECIMAL(18,0) NOT NULL CHECK (auto_cant_kms > 0),
	modelo_codigo DECIMAL(18,0) NOT NULL FOREIGN KEY REFERENCES [ASADO_EN_CASA].modelos);

CREATE TABLE [ASADO_EN_CASA].item_compra(
	item_nro INTEGER IDENTITY,
	compra_nro DECIMAL(18,0) FOREIGN KEY REFERENCES [ASADO_EN_CASA].compras,
	auto_nro INTEGER FOREIGN KEY REFERENCES [ASADO_EN_CASA].autos,
	auto_parte_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES [ASADO_EN_CASA].auto_partes,
	compra_cant DECIMAL(18,0) NOT NULL CHECK (compra_cant > 0),
	compra_precio DECIMAL(18,2) NOT NULL CHECK(compra_precio > 0),
	PRIMARY KEY (item_nro, compra_nro));

CREATE TABLE [ASADO_EN_CASA].item_factura(
	item_nro INTEGER IDENTITY,
	factura_nro DECIMAL(18,0) FOREIGN KEY REFERENCES [ASADO_EN_CASA].facturas,
	auto_nro INTEGER FOREIGN KEY REFERENCES [ASADO_EN_CASA].autos,
	auto_parte_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES [ASADO_EN_CASA].auto_partes,
	cant_facturada DECIMAL(18,0) NOT NULL CHECK (cant_facturada > 0),
	precio_facturado DECIMAL(18,2) NOT NULL CHECK (precio_facturado > 0),
	PRIMARY KEY (item_nro, factura_nro));

GO


--------------------------------- PROCEDURE CON LOS INSERTS PARA LA MIGRACION DE DATOS ------------------------------

CREATE PROCEDURE ASADO_EN_CASA.procedure_inserts
AS

INSERT INTO [ASADO_EN_CASA].clientes (cliente_apellido, cliente_nombre, cliente_direccion, cliente_dni, cliente_fecha_nac, cliente_mail)
SELECT DISTINCT CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DIRECCION, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL
FROM GD_ESQUEMA.MAESTRA
WHERE CLIENTE_DNI IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].clientes (cliente_apellido, cliente_nombre, cliente_direccion, cliente_dni, cliente_fecha_nac, cliente_mail)
SELECT DISTINCT FAC_CLIENTE_APELLIDO, FAC_CLIENTE_NOMBRE, FAC_CLIENTE_DIRECCION, FAC_CLIENTE_DNI, FAC_CLIENTE_FECHA_NAC, FAC_CLIENTE_MAIL
FROM GD_ESQUEMA.MAESTRA
WHERE FAC_CLIENTE_DNI IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].sucursales (sucursal_direccion, sucursal_mail, sucursal_ciudad, sucursal_telefono)
SELECT DISTINCT SUCURSAL_DIRECCION, SUCURSAL_MAIL, SUCURSAL_CIUDAD, SUCURSAL_TELEFONO
FROM GD_ESQUEMA.MAESTRA
WHERE SUCURSAL_DIRECCION IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].facturas (factura_nro, factura_fecha, cliente_nro, sucursal_nro)
SELECT DISTINCT FACTURA_NRO, FACTURA_FECHA, c.cliente_nro, s.sucursal_nro
FROM GD_ESQUEMA.MAESTRA m JOIN [ASADO_EN_CASA].clientes c ON (c.cliente_apellido = m.FAC_CLIENTE_APELLIDO and
																c.cliente_direccion = m.FAC_CLIENTE_DIRECCION and
																c.cliente_dni = m.FAC_CLIENTE_DNI and 
																c.cliente_fecha_nac = m.FAC_CLIENTE_FECHA_NAC and
																c.cliente_mail = m.FAC_CLIENTE_MAIL and 
																c.cliente_nombre = m.FAC_CLIENTE_NOMBRE)
						   JOIN [ASADO_EN_CASA].sucursales s ON (s.sucursal_ciudad = m.FAC_SUCURSAL_CIUDAD and
																s.sucursal_direccion = m.FAC_SUCURSAL_DIRECCION and
																s.sucursal_mail = m.FAC_SUCURSAL_MAIL and
																s.sucursal_telefono = m.FAC_SUCURSAL_TELEFONO);

INSERT INTO [ASADO_EN_CASA].compras (compra_nro, compra_fecha, cliente_nro, sucursal_nro)
SELECT DISTINCT COMPRA_NRO, COMPRA_FECHA, c.cliente_nro, s.sucursal_nro
FROM GD_ESQUEMA.MAESTRA m JOIN [ASADO_EN_CASA].clientes c ON (c.cliente_apellido = m.CLIENTE_APELLIDO and
																c.cliente_direccion = m.CLIENTE_DIRECCION and
																c.cliente_dni = m.CLIENTE_DNI and 
																c.cliente_fecha_nac = m.CLIENTE_FECHA_NAC and
																c.cliente_mail = m.CLIENTE_MAIL and 
																c.cliente_nombre = m.CLIENTE_NOMBRE)
						   JOIN [ASADO_EN_CASA].sucursales s ON (s.sucursal_ciudad = m.SUCURSAL_CIUDAD and
																s.sucursal_direccion = m.SUCURSAL_DIRECCION and
																s.sucursal_mail = m.SUCURSAL_MAIL and
																s.sucursal_telefono = m.SUCURSAL_TELEFONO);


INSERT INTO [ASADO_EN_CASA].fabricantes (fabricante_nombre)
SELECT DISTINCT FABRICANTE_NOMBRE
FROM GD_ESQUEMA.MAESTRA
WHERE FABRICANTE_NOMBRE IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].motores (tipo_motor_codigo)
SELECT DISTINCT TIPO_MOTOR_CODIGO
FROM GD_ESQUEMA.MAESTRA
WHERE TIPO_MOTOR_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].tipos_autos (tipo_auto_codigo, tipo_auto_desc)
SELECT DISTINCT TIPO_AUTO_CODIGO, TIPO_AUTO_DESC
FROM GD_ESQUEMA.MAESTRA
WHERE TIPO_AUTO_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].tipos_cajas (tipo_caja_codigo, tipo_caja_desc)
SELECT DISTINCT TIPO_CAJA_CODIGO, TIPO_CAJA_DESC
FROM GD_ESQUEMA.MAESTRA
WHERE TIPO_CAJA_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].tipos_transmisiones (tipo_transmision_codigo, tipo_transmision_desc)
SELECT DISTINCT TIPO_TRANSMISION_CODIGO, TIPO_TRANSMISION_DESC
FROM GD_ESQUEMA.MAESTRA
WHERE TIPO_TRANSMISION_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].modelos (modelo_codigo, modelo_nombre, modelo_potencia, fabricante_nro, tipo_auto_cod, tipo_cajas, tipo_motor_codigo, tipo_transmision)
SELECT DISTINCT MODELO_CODIGO, MODELO_NOMBRE, MODELO_POTENCIA, a.fabricante_nro, m.TIPO_AUTO_CODIGO, m.TIPO_CAJA_CODIGO, m.TIPO_MOTOR_CODIGO, m.TIPO_TRANSMISION_CODIGO 
FROM GD_ESQUEMA.MAESTRA m INNER JOIN ASADO_EN_CASA.fabricantes a ON (m.FABRICANTE_NOMBRE = a.fabricante_nombre)
INNER JOIN ASADO_EN_CASA.tipos_autos ta ON (m.TIPO_AUTO_CODIGO = ta.tipo_auto_codigo)
INNER JOIN ASADO_EN_CASA.tipos_cajas tc ON (m.TIPO_CAJA_CODIGO = tc.tipo_caja_codigo)
INNER JOIN ASADO_EN_CASA.motores mot ON (m.TIPO_MOTOR_CODIGO = mot.tipo_motor_codigo)
INNER JOIN ASADO_EN_CASA.tipos_transmisiones tt ON (m.TIPO_TRANSMISION_CODIGO = tt.tipo_transmision_codigo)
WHERE MODELO_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].auto_partes (auto_parte_codigo, auto_parte_descripcion, precio_unitario)
SELECT DISTINCT AUTO_PARTE_CODIGO, AUTO_PARTE_DESCRIPCION, PRECIO_FACTURADO
FROM GD_ESQUEMA.MAESTRA
WHERE AUTO_PARTE_CODIGO IS NOT NULL AND 
PRECIO_FACTURADO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].auto_parte_x_modelo (auto_parte_codigo, modelo_codigo)
SELECT DISTINCT AUTO_PARTE_CODIGO, MODELO_CODIGO
FROM GD_ESQUEMA.MAESTRA
WHERE AUTO_PARTE_CODIGO IS NOT NULL AND
MODELO_CODIGO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].autos (auto_nro_motor, auto_patente, auto_cant_kms, auto_fecha_alta, auto_nro_chasis, modelo_codigo) 
SELECT DISTINCT AUTO_NRO_MOTOR, AUTO_PATENTE, AUTO_CANT_KMS, AUTO_FECHA_ALTA, AUTO_NRO_CHASIS, MODELO_CODIGO 
FROM gd_esquema.Maestra 
WHERE AUTO_PATENTE IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].item_compra (compra_nro, auto_nro, compra_cant, compra_precio)
SELECT DISTINCT COMPRA_NRO, a.auto_nro, 1, COMPRA_PRECIO
FROM gd_esquema.Maestra m INNER JOIN ASADO_EN_CASA.autos a ON (m.AUTO_PATENTE = a.auto_patente)
WHERE COMPRA_NRO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].item_compra (compra_nro, auto_parte_codigo, compra_cant, compra_precio)
SELECT DISTINCT COMPRA_NRO, AUTO_PARTE_CODIGO, COMPRA_CANT, COMPRA_PRECIO
FROM gd_esquema.Maestra
WHERE AUTO_PATENTE IS NULL AND
COMPRA_NRO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].item_factura (factura_nro, auto_nro, cant_facturada, precio_facturado)
SELECT DISTINCT FACTURA_NRO, a.auto_nro, 1, PRECIO_FACTURADO
FROM gd_esquema.Maestra m INNER JOIN ASADO_EN_CASA.autos a ON (m.AUTO_PATENTE = a.auto_patente)
WHERE FACTURA_NRO IS NOT NULL;

INSERT INTO [ASADO_EN_CASA].item_factura (factura_nro, auto_parte_codigo, cant_facturada, precio_facturado)
SELECT DISTINCT FACTURA_NRO, AUTO_PARTE_CODIGO, CANT_FACTURADA, PRECIO_FACTURADO
FROM gd_esquema.Maestra
WHERE AUTO_PATENTE IS NULL AND
FACTURA_NRO IS NOT NULL;

GO

--------------------------------- EJECUCION DE LOS PROCEDURES PARA REALIZAR LA MIGRACION ----------------------------

EXECUTE ASADO_EN_CASA.procedure_creates;
EXECUTE ASADO_EN_CASA.procedure_inserts;
GO

-------- CREACION DE TRIGGERS PARA QUE LA CREACION DE ITEMS DE FACTURAS Y COMPRAS SEA LA CORRECTA -------------------
-------------- LOS ITEMS (DE COMPRA Y FACTURAS) DEBEN TENER O UN AUTO O UNA AUTO PARTE NO AMBAS ---------------------

CREATE TRIGGER [ASADO_EN_CASA].[validacion_item_compra]
ON [ASADO_EN_CASA].[item_compra]
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @NROAUTO INTEGER;
	DECLARE @APCOD DECIMAL(18,0);
	SELECT @NROAUTO = auto_nro, @APCOD = auto_parte_codigo FROM inserted;

	IF (@NROAUTO IS NOT NULL AND @APCOD IS NOT NULL) OR (@NROAUTO IS NULL AND @APCOD IS NULL)
	BEGIN
		RAISERROR ('NO PUEDE HABER UN ITEM CON AUTO Y AUTO_PARTE A LA VEZ, O AMBOS NULOS', 1, 1)
		ROLLBACK
	END
	ELSE
	BEGIN
		INSERT INTO ASADO_EN_CASA.item_compra (compra_nro, auto_nro, auto_parte_codigo, compra_cant, compra_precio)
		SELECT compra_nro, auto_nro, auto_parte_codigo, compra_cant, compra_precio FROM inserted
	END

END
GO

CREATE TRIGGER [ASADO_EN_CASA].[validacion_item_factura]
ON [ASADO_EN_CASA].[item_factura]
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @NROAUTO INTEGER;
	DECLARE @APCOD DECIMAL(18,0);
	SELECT @NROAUTO = auto_nro, @APCOD = auto_parte_codigo FROM inserted;

	IF (@NROAUTO IS NOT NULL AND @APCOD IS NOT NULL) OR (@NROAUTO IS NULL AND @APCOD IS NULL)
	BEGIN
		RAISERROR ('NO PUEDE HABER UN ITEM CON AUTO Y AUTO_PARTE A LA VEZ, O AMBOS NULOS', 1, 1)
		ROLLBACK
	END
	ELSE
	BEGIN
		INSERT INTO ASADO_EN_CASA.item_factura (factura_nro, auto_nro, auto_parte_codigo, cant_facturada, precio_facturado)
		SELECT factura_nro, auto_nro, auto_parte_codigo, cant_facturada, precio_facturado FROM inserted
	END

END

--DROP TABLE gd_esquema.Maestra;
--DROP SCHEMA gd_esquema;

GO