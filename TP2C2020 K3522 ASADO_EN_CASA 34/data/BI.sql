
USE [GD2C2020]
GO

----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- CREACION DE DIMENSIONES --------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


-- Elimino todos los objetos para poder actualizarlos y evitar errores de colisión --

IF OBJECT_ID('ASADO_EN_CASA.categoriaPorEdad',N'FN') is not null
	DROP FUNCTION ASADO_EN_CASA.categoriaPorEdad
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_de_transimision',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_tipo_de_transimision
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_motor',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_tipo_motor
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_caja_cambio',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_tipo_caja_cambio
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_fabricante',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_fabricante
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_rubro_autoparte',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_rubro_autoparte 
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_autoparte',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_autoparte
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_cliente',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_cliente
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_modelo',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_modelo 
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_sucursal',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_sucursal
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_tiempo',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_tiempo 
GO
IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_automovil',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_tipo_automovil
GO

-- Funciones Útiles --

CREATE FUNCTION ASADO_EN_CASA.categoriaPorEdad(@fechanac datetime) 
RETURNS varchar(12)
AS 
BEGIN
    DECLARE @añosPersona INT
    SET @añosPersona = DATEDIFF(hour,@fechanac,GETDATE())/8766
    RETURN CASE WHEN @añosPersona < 31 THEN '18 - 30 años' WHEN @añosPersona < 51 THEN '31 - 50 años' ELSE '> 50 años' END
END 
GO



-- Creación de tablas

CREATE TABLE ASADO_EN_CASA.BI_cliente (
	id_cliente int identity primary key,
	edad varchar(12) check (edad in ('18 - 30 años', '31 - 50 años', '> 50 años')),
	sexo char(1) check (sexo in ('M', 'F'))
)

CREATE TABLE ASADO_EN_CASA.BI_tiempo (
	id_tiempo int identity primary key,
	anio smallint,
	mes smallint
)

CREATE TABLE ASADO_EN_CASA.BI_sucursal (
	id_sucursal int identity primary key,
	sucursal_nro int not null,
	--sucursal_direccion varchar(255) not null,
	--sucursal_mail varchar(255) not null,
	--sucursal_telefono decimal(18,0) not null,
	--sucursal_ciudad varchar(255) not null
)

CREATE TABLE ASADO_EN_CASA.BI_modelo (
	id_modelo int identity primary key,
	modelo_codigo decimal(18,0) not null
)

CREATE TABLE ASADO_EN_CASA.BI_fabricante (
	id_fabricante int identity primary key,
	fabricante_nro int not null
)

CREATE TABLE ASADO_EN_CASA.BI_tipo_automovil (
	id_tipo_automovil int identity primary key,
	tipo_auto_codigo decimal(18,0) not null
)

CREATE TABLE ASADO_EN_CASA.BI_tipo_de_transimision (
    id_transmision int identity primary key,
    tipo_transmision_codigo decimal(18,0) not null
)

CREATE TABLE ASADO_EN_CASA.BI_tipo_motor (
    id_motor int identity primary key,
    tipo_motor_codigo decimal(18,0) not null
)

CREATE TABLE ASADO_EN_CASA.BI_tipo_caja_cambio (
    id_caja_cambio int identity primary key,
    tipo_caja_codigo decimal(18,0) not null
)

CREATE TABLE ASADO_EN_CASA.BI_rubro_autoparte (
    id_rubro_autoparte int identity primary key,
	rubro_auto_parte_codigo int not null
    --rubro_descripcion varchar(255)
)

CREATE TABLE ASADO_EN_CASA.BI_autoparte (
    id_autoparte int identity primary key,
	auto_parte_codigo decimal(18,0),
    precio_unitario int 
)

-- Migración

INSERT INTO ASADO_EN_CASA.BI_cliente (edad, sexo)
SELECT DISTINCT ASADO_EN_CASA.categoriaPorEdad( cliente_fecha_nac ), null
FROM ASADO_EN_CASA.clientes

INSERT INTO ASADO_EN_CASA.BI_tiempo (anio, mes)
(SELECT DISTINCT YEAR(compra_fecha), MONTH(compra_fecha) FROM ASADO_EN_CASA.compras)
UNION
(SELECT DISTINCT YEAR(factura_fecha), MONTH(factura_fecha) FROM ASADO_EN_CASA.facturas)

INSERT INTO ASADO_EN_CASA.BI_sucursal (sucursal_nro)
SELECT DISTINCT sucursal_nro FROM ASADO_EN_CASA.sucursales

INSERT INTO ASADO_EN_CASA.BI_modelo (modelo_codigo)
SELECT DISTINCT modelo_codigo FROM ASADO_EN_CASA.modelos

INSERT INTO ASADO_EN_CASA.BI_fabricante (fabricante_nro)
SELECT DISTINCT fabricante_nro FROM ASADO_EN_CASA.fabricantes

INSERT INTO ASADO_EN_CASA.BI_tipo_automovil (tipo_auto_codigo)
SELECT DISTINCT tipo_auto_codigo FROM ASADO_EN_CASA.tipos_autos

INSERT INTO ASADO_EN_CASA.BI_tipo_de_transimision (tipo_transmision_codigo)
SELECT DISTINCT tipo_transmision_codigo FROM ASADO_EN_CASA.tipos_transmisiones

INSERT INTO ASADO_EN_CASA.BI_tipo_motor (tipo_motor_codigo)
SELECT DISTINCT tipo_motor_codigo FROM ASADO_EN_CASA.motores

INSERT INTO ASADO_EN_CASA.BI_tipo_caja_cambio (tipo_caja_codigo)
SELECT DISTINCT tipo_caja_codigo FROM ASADO_EN_CASA.tipos_cajas

INSERT INTO ASADO_EN_CASA.BI_rubro_autoparte (rubro_auto_parte_codigo) 
SELECT DISTINCT rubro_auto_parte_codigo FROM ASADO_EN_CASA.rubro_autoparte

INSERT INTO ASADO_EN_CASA.BI_autoparte (auto_parte_codigo, precio_unitario) 
SELECT DISTINCT auto_parte_codigo, precio_unitario FROM ASADO_EN_CASA.auto_partes


----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- CREACION DE HECHOS  --------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


-- Drops

IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_compras_autos',N'U') is not null
    DROP TABLE ASADO_EN_CASA.BI_hechos_compras_autos
GO


-- Creación tablas de hechos

CREATE TABLE ASADO_EN_CASA.BI_hechos_compras_autos (
	id_tiempo int,
	id_sucursal int,
	--id_fabricante int,
	--id_modelo int,
	primary key (id_tiempo, id_sucursal/*, id_fabricante, id_modelo*/),
	foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
	foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
	--foreign key (id_fabricante) references ASADO_EN_CASA.BI_fabricante,
	--foreign key (id_modelo) references ASADO_EN_CASA.BI_modelo,
	cantidad_comprada int
)

CREATE TABLE ASADO_EN_CASA.BI_hechos_ventas_autos (
	id_tiempo int,
	id_sucursal int,
	--id_fabricante int,
	--id_modelo int,
	primary key (id_tiempo, id_sucursal/*, id_fabricante, id_modelo*/),
	foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
	foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
	--foreign key (id_fabricante) references ASADO_EN_CASA.BI_fabricante,
	--foreign key (id_modelo) references ASADO_EN_CASA.BI_modelo,
	cantidad_vendida int
)


INSERT INTO ASADO_EN_CASA.BI_hechos_compras_autos (id_tiempo, id_sucursal, cantidad_comprada)
SELECT id_tiempo, id_sucursal, SUM(compra_cant)
FROM ASADO_EN_CASA.item_compra ic JOIN ASADO_EN_CASA.compras c ON ic.compra_nro = c.compra_nro
LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(c.compra_fecha) and bt.anio = YEAR(c.compra_fecha))
LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = c.sucursal_nro)
GROUP BY id_tiempo, id_sucursal

INSERT INTO ASADO_EN_CASA.BI_hechos_ventas_autos (id_tiempo, id_sucursal, cantidad_vendida)
SELECT id_tiempo, id_sucursal, SUM(cant_facturada) cant_vend
FROM ASADO_EN_CASA.item_factura i JOIN ASADO_EN_CASA.facturas f ON i.factura_nro = f.factura_nro
LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(f.factura_fecha) and bt.anio = YEAR(f.factura_fecha))
LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = f.sucursal_nro)
GROUP BY id_tiempo, id_sucursal


GO
CREATE VIEW vista_BI
AS
SELECT t.anio, t.mes, s.sucursal_nro, cantidad_comprada, null
FROM ASADO_EN_CASA.BI_hechos_compras_autos hc JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hc.id_tiempo)
JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hc.id_sucursal)
UNION
SELECT t.anio, t.mes, s.sucursal_nro, null, cantidad_vendida
FROM ASADO_EN_CASA.BI_hechos_ventas_autos hv JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hv.id_tiempo)
JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hv.id_sucursal)

