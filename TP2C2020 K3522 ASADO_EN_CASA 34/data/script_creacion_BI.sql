
USE [GD2C2020]
GO
----------------------------------------------------------------
-----------------------------DROPS------------------------------
----------------------------------------------------------------

-- Elimino todos los objetos para poder actualizarlos y evitar errores de colisión --

--drops de vistas BI
	IF OBJECT_ID('ASADO_EN_CASA.BI_ventas_y_compras_x_suc_x_mes',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_ventas_y_compras_x_suc_x_mes
	IF OBJECT_ID('ASADO_EN_CASA.BI_precio_promedio_autos_vendidos_y_comprados',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_precio_promedio_autos_vendidos_y_comprados
	IF OBJECT_ID('ASADO_EN_CASA.BI_ganancias_por_sucursal_mes',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_ganancias_por_sucursal_mes
	IF OBJECT_ID('ASADO_EN_CASA.BI_ganancias_por_sucursal_mes_autopartes',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_ganancias_por_sucursal_mes_autopartes
	IF OBJECT_ID('ASADO_EN_CASA.BI_promedio_tiempo_stock',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_promedio_tiempo_stock
	IF OBJECT_ID('ASADO_EN_CASA.BI_precio_promedio_autopartes_vendidos_y_comprados',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_precio_promedio_autopartes_vendidos_y_comprados
	IF OBJECT_ID('ASADO_EN_CASA.BI_maxima_cantidad_stock_por_sucursal_anual',N'V') is not null
		DROP VIEW ASADO_EN_CASA.BI_maxima_cantidad_stock_por_sucursal_anual
		
--drops de tablas de hechos
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_compras_autos',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_compras_autos
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ventas_autos',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_ventas_autos
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_precios_promedios_autos_vendidos',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autos_vendidos
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_precios_promedios_autos_comprados',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autos_comprados
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ganancias',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_ganancias
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ganancias_autopartes',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_ganancias_autopartes
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_promedio_tiempo_stock_auto',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_promedio_tiempo_stock_auto
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_vendidos',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_vendidos
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_comprados',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_comprados
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_compras_autopartes', N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_compras_autopartes
	IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ventas_autopartes',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_hechos_ventas_autopartes
--drops de funciones
	IF OBJECT_ID('ASADO_EN_CASA.categoriaPorEdad',N'FN') is not null
		DROP FUNCTION ASADO_EN_CASA.categoriaPorEdad
	IF OBJECT_ID('ASADO_EN_CASA.getPotencia',N'FN') is not null
		DROP FUNCTION ASADO_EN_CASA.getPotencia
	IF OBJECT_ID('ASADO_EN_CASA.acumuladoVenta',N'FN') is not null
		DROP FUNCTION ASADO_EN_CASA.acumuladoVenta
	IF OBJECT_ID('ASADO_EN_CASA.acumuladoCompras',N'FN') is not null
		DROP FUNCTION ASADO_EN_CASA.acumuladoCompras
--drops de dimensiones
	IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_de_transimision',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_tipo_de_transimision
	IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_motor',N'U') is not null
	 DROP TABLE ASADO_EN_CASA.BI_tipo_motor
	IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_caja_cambio',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_tipo_caja_cambio
	IF OBJECT_ID('ASADO_EN_CASA.BI_fabricante',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_fabricante
	IF OBJECT_ID('ASADO_EN_CASA.BI_rubro_autoparte',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_rubro_autoparte 
	IF OBJECT_ID('ASADO_EN_CASA.BI_autoparte',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_autoparte
	IF OBJECT_ID('ASADO_EN_CASA.BI_cliente',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_cliente
	IF OBJECT_ID('ASADO_EN_CASA.BI_modelo',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_modelo 
	IF OBJECT_ID('ASADO_EN_CASA.BI_sucursal',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_sucursal
	IF OBJECT_ID('ASADO_EN_CASA.BI_tiempo',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_tiempo 
	IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_automovil',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_tipo_automovil
	IF OBJECT_ID('ASADO_EN_CASA.BI_potencia',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_potencia
	--dropeado de los stored procedures
	IF OBJECT_ID('ASADO_EN_CASA.crear_tablas_bi','P') is not null
		DROP PROCEDURE ASADO_EN_CASA.crear_tablas_bi
	IF OBJECT_ID('ASADO_EN_CASA.llenar_dimensiones','P') is not null
		DROP PROCEDURE ASADO_EN_CASA.llenar_dimensiones
	IF OBJECT_ID('ASADO_EN_CASA.llenar_hechos','P') is not null
		DROP PROCEDURE ASADO_EN_CASA.llenar_hechos
GO

--------------------------------------------------------------------------
-----------------------------FUNCIONES UTILES-----------------------------
--------------------------------------------------------------------------

GO
	CREATE FUNCTION ASADO_EN_CASA.categoriaPorEdad(@fechanac datetime) 
	RETURNS varchar(12)
	AS 
	BEGIN
		DECLARE @añosPersona INT
		SET @añosPersona = DATEDIFF(year,@fechanac,GETDATE())
		RETURN CASE WHEN @añosPersona < 31 THEN '18 - 30 años' WHEN @añosPersona < 51 THEN '31 - 50 años' ELSE '> 50 años' END
	END 
GO

GO
	CREATE FUNCTION ASADO_EN_CASA.getPotencia(@potencia decimal(18,0)) 
	RETURNS varchar(10)
	AS 
	BEGIN
		RETURN CASE WHEN @potencia > 299 THEN '>300cv' WHEN @potencia > 150 THEN '151-300cv' WHEN @potencia > 49 THEN '50-150cv' ELSE '<50cv'END
	END 
GO

GO

	CREATE FUNCTION ASADO_EN_CASA.acumuladoCompras(@id_sucursal INT, @id_tiempo INT) 
	RETURNS INT
	AS 
	BEGIN
		RETURN (
		SELECT COALESCE(SUM(cantidad_comprada),0)
		FROM ASADO_EN_CASA.BI_hechos_compras_autopartes
		WHERE id_sucursal = @id_sucursal AND id_tiempo <= @id_tiempo)
	END 
GO

GO
	CREATE FUNCTION ASADO_EN_CASA.acumuladoVenta(@id_sucursal INT, @id_tiempo INT) 
	RETURNS INT
	AS 
	BEGIN
		RETURN (
		SELECT COALESCE(SUM(cantidad_vendida),0)
		FROM ASADO_EN_CASA.BI_hechos_ventas_autopartes
		WHERE id_sucursal = @id_sucursal AND id_tiempo <= @id_tiempo)
	END 
GO

----------------------------------------------------------------------------
-----------------------------CREACION DE TABLAS-----------------------------
----------------------------------------------------------------------------

GO
	CREATE PROCEDURE ASADO_EN_CASA.crear_tablas_bi
	AS
	BEGIN
	----------------------------------------------------------------------------------------------------------------------------------------------
	-------------------------------DIMENSIONES--------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------

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
	)

	CREATE TABLE ASADO_EN_CASA.BI_autoparte (
		id_autoparte int identity primary key,
		auto_parte_codigo decimal(18,2),
		precio_unitario int 
	)

	CREATE TABLE ASADO_EN_CASA.BI_potencia (
		id_potencia int identity primary key,
		potencia varchar(10) check (potencia in ('>300cv','151-300cv','50-150cv','<50cv'))
	)
		----------------------------------------------------------------
		-------------------------------HECHOS---------------------------
		----------------------------------------------------------------

	CREATE TABLE ASADO_EN_CASA.BI_hechos_compras_autos (
		id_tiempo int,
		id_sucursal int,
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
		cantidad_comprada int
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_ventas_autos (
		id_tiempo int,
		id_sucursal int,
		id_modelo int,
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
		cantidad_vendida int
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_ganancias (
		id_tiempo int,
		id_sucursal int,
		ganancia decimal(18, 2)
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal
	)

		CREATE TABLE ASADO_EN_CASA.BI_hechos_ganancias_autopartes (
		id_tiempo int,
		id_sucursal int,
		ganancia decimal(18, 2)
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autos_vendidos (
		id_modelo int,
		primary key (id_modelo),
		foreign key (id_modelo) references ASADO_EN_CASA.BI_modelo,
		precio_promedio_venta decimal(18,2)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autos_comprados (
		id_modelo int,
		primary key (id_modelo),
		foreign key (id_modelo) references ASADO_EN_CASA.BI_modelo,
		precio_promedio_compra decimal(18,2)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_promedio_tiempo_stock_auto (
		id_modelo int primary key,
		foreign key (id_modelo) references ASADO_EN_CASA.BI_modelo,
		promedio_dias int
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_vendidos (
		id_autoparte int,
		primary key (id_autoparte),
		foreign key (id_autoparte) references ASADO_EN_CASA.BI_autoparte,
		precio_promedio_venta decimal(18,2)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_comprados (
		id_autoparte int,
		primary key (id_autoparte),
		foreign key (id_autoparte) references ASADO_EN_CASA.BI_autoparte,
		precio_promedio_compra decimal(18,2)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_compras_autopartes(
		id_tiempo int,
		id_sucursal int,
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
		cantidad_comprada int
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_ventas_autopartes(
		id_tiempo int,
		id_sucursal int,
		primary key (id_tiempo, id_sucursal),
		foreign key (id_tiempo) references ASADO_EN_CASA.BI_tiempo,
		foreign key (id_sucursal) references ASADO_EN_CASA.BI_sucursal,
		cantidad_vendida int
	)


	END
GO

--------------------------------
-----LLENADO DE DIMENSIONES-----
--------------------------------
GO
	CREATE PROCEDURE ASADO_EN_CASA.llenar_dimensiones
	AS
	BEGIN

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

	INSERT INTO ASADO_EN_CASA.BI_potencia (potencia)
	SELECT DISTINCT ASADO_EN_CASA.getPotencia( modelo_potencia )
	FROM ASADO_EN_CASA.modelos

	END
GO

-- Creo las tablas y lleno las dimensiones --
EXECUTE ASADO_EN_CASA.CREAR_TABLAS_BI
EXECUTE ASADO_EN_CASA.LLENAR_DIMENSIONES

-------------------------------------------------------------
-------------------LLENADO DE LAS TABLAS DE HECHOS-----------
-------------------------------------------------------------

GO
	CREATE PROCEDURE ASADO_EN_CASA.llenar_hechos
	AS
	BEGIN

	--llenado para compras de automoviles x mes y sucursal
	INSERT INTO ASADO_EN_CASA.BI_hechos_compras_autos (id_tiempo, id_sucursal, cantidad_comprada)
	SELECT id_tiempo, id_sucursal, SUM(compra_cant)
	FROM ASADO_EN_CASA.item_compra ic JOIN ASADO_EN_CASA.compras c ON ic.compra_nro = c.compra_nro
	LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(c.compra_fecha) and bt.anio = YEAR(c.compra_fecha))
	LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = c.sucursal_nro)
	GROUP BY id_tiempo, id_sucursal

	--llenado para ventas de automoviles x mes y sucursal
	INSERT INTO ASADO_EN_CASA.BI_hechos_ventas_autos (id_tiempo, id_sucursal, cantidad_vendida)
	SELECT id_tiempo, id_sucursal, SUM(cant_facturada) cant_vend
	FROM ASADO_EN_CASA.item_factura i JOIN ASADO_EN_CASA.facturas f ON i.factura_nro = f.factura_nro
	LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(f.factura_fecha) and bt.anio = YEAR(f.factura_fecha))
	LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = f.sucursal_nro)
	GROUP BY id_tiempo, id_sucursal

	--insercion de los hechos para el promedio de venta de un modelo
	INSERT INTO ASADO_EN_CASA.BI_hechos_precios_promedios_autos_vendidos (id_modelo, precio_promedio_venta)
	SELECT id_modelo, CONVERT(DECIMAL(10,2),AVG(precio_facturado/cant_facturada)) as promedio_venta
	FROM ASADO_EN_CASA.item_factura ifc JOIN ASADO_EN_CASA.autos aut ON (aut.auto_nro = ifc.auto_nro)
	JOIN ASADO_EN_CASA.BI_modelo bm ON (bm.id_modelo = aut.modelo_codigo)
	GROUP BY id_modelo

	--insercion de los hechos para el promedio de compra de un modelo
	INSERT INTO ASADO_EN_CASA.BI_hechos_precios_promedios_autos_comprados (id_modelo, precio_promedio_compra)
	SELECT id_modelo, CONVERT(DECIMAL(10,2),AVG(compra_precio/compra_cant)) as promedio_compra
	FROM ASADO_EN_CASA.item_compra ifc JOIN ASADO_EN_CASA.autos aut ON (aut.auto_nro = ifc.auto_nro)
	JOIN ASADO_EN_CASA.BI_modelo bm ON (bm.id_modelo = aut.modelo_codigo)
	GROUP BY id_modelo

	--Inserción de los hechos de ganancia
	INSERT INTO ASADO_EN_CASA.BI_hechos_ganancias (id_tiempo, id_sucursal, ganancia)
	SELECT t.id_tiempo, s.id_sucursal, SUM(it.precio_facturado) - SUM(ic.compra_precio) as ganancia
    FROM ASADO_EN_CASA.item_compra ic JOIN ASADO_EN_CASA.compras c ON (ic.compra_nro = c.compra_nro)
        JOIN ASADO_EN_CASA.BI_tiempo t ON (MONTH(c.compra_fecha) = t.mes AND YEAR(c.compra_fecha) = t.anio)
        JOIN ASADO_EN_CASA.BI_sucursal s ON (c.sucursal_nro = s.sucursal_nro)
        JOIN ASADO_EN_CASA.facturas f ON (MONTH(f.factura_fecha) = t.mes AND YEAR(f.factura_fecha) = t.anio AND f.sucursal_nro = s.sucursal_nro)
        JOIN ASADO_EN_CASA.item_factura it ON (f.factura_nro = it.factura_nro)
	WHERE ic.auto_nro IS NOT NULL AND it.auto_nro IS NOT NULL
    GROUP BY t.id_tiempo, s.id_sucursal

	--Inserción de los hechos de ganancia de autopartes
	INSERT INTO ASADO_EN_CASA.BI_hechos_ganancias_autopartes (id_tiempo, id_sucursal, ganancia)
	SELECT t.id_tiempo, s.id_sucursal, SUM(it.precio_facturado*it.cant_facturada) - SUM(ic.compra_precio*ic.compra_cant) as ganancia
    FROM ASADO_EN_CASA.item_compra ic JOIN ASADO_EN_CASA.compras c ON (ic.compra_nro = c.compra_nro)
        JOIN ASADO_EN_CASA.BI_tiempo t ON (MONTH(c.compra_fecha) = t.mes AND YEAR(c.compra_fecha) = t.anio)
        JOIN ASADO_EN_CASA.BI_sucursal s ON (c.sucursal_nro = s.sucursal_nro)
        JOIN ASADO_EN_CASA.facturas f ON (MONTH(f.factura_fecha) = t.mes AND YEAR(f.factura_fecha) = t.anio AND f.sucursal_nro = s.sucursal_nro)
        JOIN ASADO_EN_CASA.item_factura it ON (f.factura_nro = it.factura_nro)
	WHERE ic.auto_parte_codigo IS NOT NULL AND it.auto_parte_codigo IS NOT NULL
    GROUP BY t.id_tiempo, s.id_sucursal

	--Inserción de los promedios de tiempo en stock por auto
	INSERT INTO ASADO_EN_CASA.BI_hechos_promedio_tiempo_stock_auto (id_modelo, promedio_dias)
	select id_modelo, AVG(DATEDIFF(DAY, compra_fecha, COALESCE(factura_fecha,GETDATE()))) dias_promedio_stock
	from ASADO_EN_CASA.autos a JOIN ASADO_EN_CASA.BI_modelo m ON (a.modelo_codigo = m.modelo_codigo)
		LEFT JOIN ASADO_EN_CASA.item_compra ic on (a.auto_nro = ic.auto_nro)
		LEFT JOIN ASADO_EN_CASA.compras c on (ic.compra_nro = c.compra_nro)
		LEFT JOIN ASADO_EN_CASA.item_factura ift ON ( ift.auto_nro =  a.auto_nro)
		LEFT JOIN ASADO_EN_CASA.facturas f ON (f.factura_nro = ift.factura_nro)
	group by id_modelo

	--insercion de los hechos para el promedio de venta de una autoparte
	INSERT INTO ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_vendidos (id_autoparte, precio_promedio_venta)
	SELECT id_autoparte, CONVERT(DECIMAL(10,2),AVG(precio_facturado/cant_facturada)) as promedio_venta
	FROM ASADO_EN_CASA.item_factura ifc JOIN ASADO_EN_CASA.auto_partes aut ON (aut.auto_parte_codigo = ifc.auto_parte_codigo)
	JOIN ASADO_EN_CASA.BI_autoparte bm ON (bm.id_autoparte = aut.auto_parte_codigo)
	GROUP BY id_autoparte

	--insercion de los hechos para el promedio de compra de una autoparte
	INSERT INTO ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_comprados (id_autoparte, precio_promedio_compra)
	SELECT id_autoparte, CONVERT(DECIMAL(10,2),AVG(compra_precio/compra_cant)) as promedio_compra
	FROM ASADO_EN_CASA.item_compra ifc JOIN ASADO_EN_CASA.auto_partes aut ON (aut.auto_parte_codigo = ifc.auto_parte_codigo)
	JOIN ASADO_EN_CASA.BI_autoparte bm ON (bm.id_autoparte = aut.auto_parte_codigo)
	GROUP BY id_autoparte

	--llenado para compras de autopartes x mes y sucursal
	INSERT INTO ASADO_EN_CASA.BI_hechos_compras_autopartes (id_tiempo, id_sucursal, cantidad_comprada)
	SELECT id_tiempo, id_sucursal, SUM(compra_cant)
	FROM ASADO_EN_CASA.item_compra ic 
	JOIN ASADO_EN_CASA.compras c ON ic.compra_nro = c.compra_nro
	LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(c.compra_fecha) and bt.anio = YEAR(c.compra_fecha))
	LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = c.sucursal_nro)
	WHERE ic.auto_nro IS NULL
	GROUP BY id_tiempo, id_sucursal

	--llenado para ventas de autopartes x mes y sucursal
	INSERT INTO ASADO_EN_CASA.BI_hechos_ventas_autopartes (id_tiempo, id_sucursal, cantidad_vendida)
	SELECT id_tiempo, id_sucursal, SUM(cant_facturada) cant_vend
	FROM ASADO_EN_CASA.item_factura i 
	JOIN ASADO_EN_CASA.facturas f ON i.factura_nro = f.factura_nro
	LEFT JOIN ASADO_EN_CASA.BI_tiempo bt ON (bt.mes = MONTH(f.factura_fecha) and bt.anio = YEAR(f.factura_fecha))
	LEFT JOIN ASADO_EN_CASA.BI_sucursal bs ON (bs.sucursal_nro = f.sucursal_nro)
	WHERE i.auto_nro IS NULL
	GROUP BY id_tiempo, id_sucursal

	END
GO

EXECUTE ASADO_EN_CASA.llenar_hechos

GO
		-------------------------------------------------------------
		---------CREACION DE VISTAS DE BI----------------------------
		-------------------------------------------------------------
GO
	CREATE VIEW ASADO_EN_CASA.BI_ventas_y_compras_x_suc_x_mes
	AS
	SELECT t.anio anio, t.mes mes, s.sucursal_nro, COALESCE(total_comprado,0) as total_comprado, COALESCE(total_vendido,0) as total_vendido
	FROM (SELECT  t.id_tiempo, s.sucursal_nro as sucursal, cantidad_vendida as total_vendido
	FROM ASADO_EN_CASA.BI_hechos_ventas_autos hv JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hv.id_tiempo)
	JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hv.id_sucursal)) ventas 
	FULL OUTER JOIN (SELECT t.id_tiempo, s.sucursal_nro as sucursal, cantidad_comprada as total_comprado
	FROM ASADO_EN_CASA.BI_hechos_compras_autos hc JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hc.id_tiempo)
	JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hc.id_sucursal)) compras
	ON (ventas.id_tiempo = compras.id_tiempo and ventas.sucursal = compras.sucursal)
	JOIN ASADO_EN_CASA.sucursales s ON (ventas.sucursal = s.sucursal_nro or compras.sucursal =s.sucursal_nro )
	JOIN ASADO_EN_CASA.BI_tiempo t ON (ventas.id_tiempo = t.id_tiempo or compras.id_tiempo =t.id_tiempo )
GO

	CREATE VIEW ASADO_EN_CASA.BI_maxima_cantidad_stock_por_sucursal_anual
	AS
	SELECT id_sucursal, anio, MAX(ASADO_EN_CASA.acumuladoCompras(s.id_sucursal, t.id_tiempo) - ASADO_EN_CASA.acumuladoVenta(s.id_sucursal, t.id_tiempo)) maxCantStockAnual
	FROM ASADO_EN_CASA.BI_tiempo t, ASADO_EN_CASA.BI_sucursal s
	GROUP BY id_sucursal, anio

GO
	CREATE VIEW ASADO_EN_CASA.BI_precio_promedio_autos_vendidos_y_comprados
	AS
	SELECT comprados.id_modelo, precio_promedio_compra, precio_promedio_venta
	FROM ASADO_EN_CASA.BI_hechos_precios_promedios_autos_comprados comprados 
	JOIN ASADO_EN_CASA.BI_hechos_precios_promedios_autos_vendidos vendidos ON (vendidos.id_modelo = comprados.id_modelo) 
GO

GO
	CREATE VIEW ASADO_EN_CASA.BI_ganancias_por_sucursal_mes
	AS
	SELECT t.anio anio, t.mes mes, s.sucursal_nro, hg.ganancia
	FROM ASADO_EN_CASA.BI_hechos_ganancias hg JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hg.id_tiempo)
	JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hg.id_sucursal)
GO

GO
	CREATE VIEW ASADO_EN_CASA.BI_ganancias_por_sucursal_mes_autopartes
	AS
	SELECT t.anio anio, t.mes mes, s.sucursal_nro, hg.ganancia
	FROM ASADO_EN_CASA.BI_hechos_ganancias_autopartes hg JOIN ASADO_EN_CASA.BI_tiempo t on (t.id_tiempo = hg.id_tiempo)
	JOIN ASADO_EN_CASA.BI_sucursal s on (s.id_sucursal = hg.id_sucursal)
GO

GO
	CREATE VIEW ASADO_EN_CASA.BI_promedio_tiempo_stock
	AS
	SELECT modelo_codigo, promedio_dias 
	FROM ASADO_EN_CASA.BI_hechos_promedio_tiempo_stock_auto h JOIN ASADO_EN_CASA.BI_modelo m ON (h.id_modelo = m.id_modelo)
GO

GO
	CREATE VIEW ASADO_EN_CASA.BI_precio_promedio_autopartes_vendidos_y_comprados
	AS
	SELECT comprados.id_autoparte, precio_promedio_compra, precio_promedio_venta
	FROM ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_comprados comprados 
	JOIN ASADO_EN_CASA.BI_hechos_precios_promedios_autopartes_vendidos vendidos ON (vendidos.id_autoparte = comprados.id_autoparte) 
GO