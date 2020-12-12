USE [GD2C2020]
GO
----------------------------------------------------------------
-----------------------------DROPS------------------------------
----------------------------------------------------------------

-- Elimino todos los objetos para poder actualizarlos y evitar errores de colisión --

--drops de vistas BI
	IF OBJECT_ID('ASADO_EN_CASA.BI_v_tiempo_stock_autos',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_tiempo_stock_autos
    IF OBJECT_ID('ASADO_EN_CASA.BI_v_ganancia_autos_x_suc_x_mes',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_ganancia_autos_x_suc_x_mes
    IF OBJECT_ID('ASADO_EN_CASA.BI_v_precio_promedio_autos',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_precio_promedio_autos
    IF OBJECT_ID('ASADO_EN_CASA.BI_v_cant_autos_x_suc_x_mes',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_cant_autos_x_suc_x_mes
	IF OBJECT_ID('ASADO_EN_CASA.BI_v_precio_promedio_autopartes',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_precio_promedio_autopartes
	IF OBJECT_ID('ASADO_EN_CASA.BI_v_ganancia_autopartes_x_suc_x_mes',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_ganancia_autopartes_x_suc_x_mes
	IF OBJECT_ID('ASADO_EN_CASA.BI_v_stock_autopartes_x_sucursal',N'V') is not null
        DROP VIEW ASADO_EN_CASA.BI_v_stock_autopartes_x_sucursal
	

--drops de tablas de hechos
    IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ventas_autos',N'U') is not null
        DROP TABLE ASADO_EN_CASA.BI_hechos_ventas_autos
    IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_compras_autos',N'U') is not null
        DROP TABLE ASADO_EN_CASA.BI_hechos_compras_autos
    IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_ventas_autopartes',N'U') is not null
        DROP TABLE ASADO_EN_CASA.BI_hechos_ventas_autopartes
    IF OBJECT_ID('ASADO_EN_CASA.BI_hechos_compras_autopartes',N'U') is not null
        DROP TABLE ASADO_EN_CASA.BI_hechos_compras_autopartes

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
	IF OBJECT_ID('ASADO_EN_CASA.BI_tipo_de_transmision',N'U') is not null
		DROP TABLE ASADO_EN_CASA.BI_tipo_de_transmision
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
		SELECT COALESCE(SUM(cantidad_compras),0)
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
		SELECT COALESCE(SUM(cantidad_ventas),0)
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

	CREATE TABLE ASADO_EN_CASA.BI_tipo_de_transmision (
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
	
	CREATE TABLE ASADO_EN_CASA.BI_hechos_ventas_autos (
		id_tiempo int REFERENCES ASADO_EN_CASA.BI_tiempo(id_tiempo),
		id_sucursal int REFERENCES ASADO_EN_CASA.BI_sucursal(id_sucursal),
		id_modelo int REFERENCES ASADO_EN_CASA.BI_modelo(id_modelo),
		id_fabricante int REFERENCES ASADO_EN_CASA.BI_fabricante(id_fabricante),
		id_tipo_automovil int REFERENCES ASADO_EN_CASA.BI_tipo_automovil(id_tipo_automovil),
		id_caja_cambio int REFERENCES ASADO_EN_CASA.BI_tipo_caja_cambio(id_caja_cambio),
		id_motor int REFERENCES ASADO_EN_CASA.BI_tipo_motor(id_motor),
		id_transmision int REFERENCES ASADO_EN_CASA.BI_tipo_de_transmision(id_transmision),
		id_potencia int REFERENCES ASADO_EN_CASA.BI_potencia(id_potencia),
		id_cliente int REFERENCES ASADO_EN_CASA.BI_cliente(id_cliente),
		cantidad_ventas int,
		monto_ventas decimal(18,2),
		PRIMARY KEY (id_tiempo, id_sucursal, id_modelo, id_fabricante, id_tipo_automovil, 
			id_caja_cambio, id_motor, id_transmision, id_potencia, id_cliente)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_ventas_autopartes (
		id_tiempo int REFERENCES ASADO_EN_CASA.BI_tiempo(id_tiempo),
		id_sucursal int REFERENCES ASADO_EN_CASA.BI_sucursal(id_sucursal),
		id_autoparte int REFERENCES ASADO_EN_CASA.BI_autoparte(id_autoparte),
		--id_rubro_autoparte int REFERENCES ASADO_EN_CASA.BI_rubro_autoparte(id_rubro_autoparte),
		id_cliente int REFERENCES ASADO_EN_CASA.BI_cliente(id_cliente),
		cantidad_ventas int,
		monto_ventas decimal(18,2),
		PRIMARY KEY (id_tiempo, id_sucursal, id_autoparte, id_cliente)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_compras_autos (
		id_tiempo int REFERENCES ASADO_EN_CASA.BI_tiempo(id_tiempo),
		id_sucursal int REFERENCES ASADO_EN_CASA.BI_sucursal(id_sucursal),
		id_modelo int REFERENCES ASADO_EN_CASA.BI_modelo(id_modelo),
		id_fabricante int REFERENCES ASADO_EN_CASA.BI_fabricante(id_fabricante),
		id_tipo_automovil int REFERENCES ASADO_EN_CASA.BI_tipo_automovil(id_tipo_automovil),
		id_caja_cambio int REFERENCES ASADO_EN_CASA.BI_tipo_caja_cambio(id_caja_cambio),
		id_motor int REFERENCES ASADO_EN_CASA.BI_tipo_motor(id_motor),
		id_transmision int REFERENCES ASADO_EN_CASA.BI_tipo_de_transmision(id_transmision),
		id_potencia int REFERENCES ASADO_EN_CASA.BI_potencia(id_potencia),
		cantidad_compras int,
		monto_compras decimal(18,2),
		tiempo_en_stock decimal(18,2)
		PRIMARY KEY (id_tiempo, id_sucursal, id_modelo, id_fabricante, id_tipo_automovil, 
			id_caja_cambio, id_motor, id_transmision, id_potencia)
	)

	CREATE TABLE ASADO_EN_CASA.BI_hechos_compras_autopartes (
		id_tiempo int REFERENCES ASADO_EN_CASA.BI_tiempo(id_tiempo),
		id_sucursal int REFERENCES ASADO_EN_CASA.BI_sucursal(id_sucursal),
		id_autoparte int REFERENCES ASADO_EN_CASA.BI_autoparte(id_autoparte),
		--id_rubro_autoparte int REFERENCES ASADO_EN_CASA.BI_rubro_autoparte(id_rubro_autoparte),
		cantidad_compras int,
		monto_compras decimal(18,2),
		PRIMARY KEY (id_tiempo, id_sucursal, id_autoparte)
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

	INSERT INTO ASADO_EN_CASA.BI_tipo_de_transmision (tipo_transmision_codigo)
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

	INSERT INTO ASADO_EN_CASA.BI_hechos_ventas_autos (id_tiempo, id_sucursal, id_modelo, id_fabricante, id_tipo_automovil, 
			id_caja_cambio, id_motor, id_transmision, id_potencia, id_cliente, cantidad_ventas, monto_ventas)
	SELECT bt.id_tiempo, bs.id_sucursal, bm.id_modelo, bf.id_fabricante, bta.id_tipo_automovil, btc.id_caja_cambio,
		btm.id_motor, btt.id_transmision, bp.id_potencia, bc.id_cliente, SUM(itf.cant_facturada), SUM(itf.cant_facturada*itf.precio_facturado)
	FROM ASADO_EN_CASA.item_factura itf 
	JOIN ASADO_EN_CASA.facturas f ON itf.factura_nro = f.factura_nro
	JOIN ASADO_EN_CASA.clientes c ON f.cliente_nro = c.cliente_nro
	JOIN ASADO_EN_CASA.autos a ON itf.auto_nro = a.auto_nro
	JOIN ASADO_EN_CASA.modelos m ON a.modelo_codigo = m.modelo_codigo
	JOIN ASADO_EN_CASA.BI_tiempo bt ON bt.mes = MONTH(f.factura_fecha) AND bt.anio = YEAR(f.factura_fecha)
	JOIN ASADO_EN_CASA.BI_sucursal bs ON bs.sucursal_nro = f.sucursal_nro
	JOIN ASADO_EN_CASA.BI_modelo bm ON bm.modelo_codigo = m.modelo_codigo
	JOIN ASADO_EN_CASA.BI_fabricante bf ON bf.fabricante_nro = m.fabricante_nro
	JOIN ASADO_EN_CASA.BI_tipo_automovil bta ON bta.tipo_auto_codigo = m.tipo_auto_cod
	JOIN ASADO_EN_CASA.BI_tipo_caja_cambio btc ON btc.tipo_caja_codigo = m.tipo_cajas
	JOIN ASADO_EN_CASA.BI_tipo_motor btm ON btm.tipo_motor_codigo =  m.tipo_motor_codigo
	JOIN ASADO_EN_CASA.BI_tipo_de_transmision btt ON btt.tipo_transmision_codigo = m.tipo_transmision
	JOIN ASADO_EN_CASA.BI_potencia bp ON bp.potencia = ASADO_EN_CASA.getPotencia(m.modelo_potencia)
	JOIN ASADO_EN_CASA.BI_cliente bc ON bc.edad = ASADO_EN_CASA.categoriaPorEdad(c.cliente_fecha_nac)
	GROUP BY bt.id_tiempo, bs.id_sucursal, bm.id_modelo, bf.id_fabricante, bta.id_tipo_automovil, btc.id_caja_cambio,
		btm.id_motor, btt.id_transmision, bp.id_potencia, bc.id_cliente

	INSERT INTO ASADO_EN_CASA.BI_hechos_compras_autos (id_tiempo, id_sucursal, id_modelo, id_fabricante, id_tipo_automovil, 
			id_caja_cambio, id_motor, id_transmision, id_potencia, cantidad_compras, monto_compras, tiempo_en_stock)
	SELECT bt.id_tiempo, bs.id_sucursal, bm.id_modelo, bf.id_fabricante, bta.id_tipo_automovil, btc.id_caja_cambio,
		btm.id_motor, btt.id_transmision, bp.id_potencia, SUM(itc.compra_cant), SUM(itc.compra_cant*itc.compra_precio), AVG(DATEDIFF(DAY, c.compra_fecha, ISNULL(f.factura_fecha, GETDATE())))
	FROM ASADO_EN_CASA.item_compra itc
	JOIN ASADO_EN_CASA.compras c ON itc.compra_nro = c.compra_nro
	JOIN ASADO_EN_CASA.autos a ON itc.auto_nro = a.auto_nro
	LEFT JOIN ASADO_EN_CASA.item_factura itf ON itf.auto_nro = itc.auto_nro
	LEFT JOIN ASADO_EN_CASA.facturas f ON f.factura_nro = itf.factura_nro
	JOIN ASADO_EN_CASA.modelos m ON a.modelo_codigo = m.modelo_codigo
	JOIN ASADO_EN_CASA.BI_tiempo bt ON bt.mes = MONTH(c.compra_fecha) AND bt.anio = YEAR(c.compra_fecha)
	JOIN ASADO_EN_CASA.BI_sucursal bs ON bs.sucursal_nro = c.sucursal_nro
	JOIN ASADO_EN_CASA.BI_modelo bm ON bm.modelo_codigo = m.modelo_codigo
	JOIN ASADO_EN_CASA.BI_fabricante bf ON bf.fabricante_nro = m.fabricante_nro
	JOIN ASADO_EN_CASA.BI_tipo_automovil bta ON bta.tipo_auto_codigo = m.tipo_auto_cod
	JOIN ASADO_EN_CASA.BI_tipo_caja_cambio btc ON btc.tipo_caja_codigo = m.tipo_cajas
	JOIN ASADO_EN_CASA.BI_tipo_motor btm ON btm.tipo_motor_codigo =  m.tipo_motor_codigo
	JOIN ASADO_EN_CASA.BI_tipo_de_transmision btt ON btt.tipo_transmision_codigo = m.tipo_transmision
	JOIN ASADO_EN_CASA.BI_potencia bp ON bp.potencia = ASADO_EN_CASA.getPotencia(m.modelo_potencia)
	GROUP BY bt.id_tiempo, bs.id_sucursal, bm.id_modelo, bf.id_fabricante, bta.id_tipo_automovil, btc.id_caja_cambio,
		btm.id_motor, btt.id_transmision, bp.id_potencia


	INSERT INTO ASADO_EN_CASA.BI_hechos_ventas_autopartes (id_tiempo, id_sucursal, id_autoparte,-- id_rubro_autoparte, 
		id_cliente, cantidad_ventas, monto_ventas)
	SELECT bt.id_tiempo, bs.id_sucursal, ba.id_autoparte,-- bra.id_rubro_autoparte, 
		bc.id_cliente, SUM(itf.cant_facturada), SUM(itf.cant_facturada*itf.precio_facturado)
	FROM ASADO_EN_CASA.item_factura itf 
	JOIN ASADO_EN_CASA.facturas f ON itf.factura_nro = f.factura_nro
	JOIN ASADO_EN_CASA.clientes c ON f.cliente_nro = c.cliente_nro
	JOIN ASADO_EN_CASA.auto_partes a ON itf.auto_parte_codigo = a.auto_parte_codigo
	JOIN ASADO_EN_CASA.BI_tiempo bt ON bt.mes = MONTH(f.factura_fecha) AND bt.anio = YEAR(f.factura_fecha)
	JOIN ASADO_EN_CASA.BI_sucursal bs ON bs.sucursal_nro = f.sucursal_nro
	JOIN ASADO_EN_CASA.BI_autoparte ba ON ba.auto_parte_codigo = a.auto_parte_codigo
	--LEFT JOIN ASADO_EN_CASA.BI_rubro_autoparte bra ON bra.rubro_auto_parte_codigo = a.rubro_autoparte_codigo
	JOIN ASADO_EN_CASA.BI_cliente bc ON bc.edad = ASADO_EN_CASA.categoriaPorEdad(c.cliente_fecha_nac)
	GROUP BY bt.id_tiempo, bs.id_sucursal, ba.id_autoparte, bc.id_cliente--, bra.id_rubro_autoparte

	INSERT INTO ASADO_EN_CASA.BI_hechos_compras_autopartes (id_tiempo, id_sucursal, id_autoparte,
			cantidad_compras, monto_compras)
	SELECT bt.id_tiempo, bs.id_sucursal, ba.id_autoparte, SUM(itc.compra_cant), SUM(itc.compra_cant*itc.compra_precio)
	FROM ASADO_EN_CASA.item_compra itc
	JOIN ASADO_EN_CASA.compras c ON itc.compra_nro = c.compra_nro
	JOIN ASADO_EN_CASA.auto_partes a ON itc.auto_parte_codigo = a.auto_parte_codigo
	JOIN ASADO_EN_CASA.BI_tiempo bt ON bt.mes = MONTH(c.compra_fecha) AND bt.anio = YEAR(c.compra_fecha)
	JOIN ASADO_EN_CASA.BI_sucursal bs ON bs.sucursal_nro = c.sucursal_nro
	JOIN ASADO_EN_CASA.BI_autoparte ba ON ba.auto_parte_codigo = a.auto_parte_codigo
	GROUP BY bt.id_tiempo, bs.id_sucursal, ba.id_autoparte

	END
GO

EXECUTE ASADO_EN_CASA.llenar_hechos
GO
CREATE VIEW ASADO_EN_CASA.BI_v_cant_autos_x_suc_x_mes
AS
SELECT anio, mes, sucursal_nro, ISNULL(sum(cantidad_compras), 0) cantidad_comprada, ISNULL(sum(cantidad_ventas), 0) cantidad_vendida
    FROM ASADO_EN_CASA.BI_hechos_compras_autos hc
    FULL OUTER JOIN ASADO_EN_CASA.BI_hechos_ventas_autos hv on hc.id_tiempo = hv.id_tiempo AND hc.id_sucursal = hv.id_sucursal
    JOIN ASADO_EN_CASA.BI_tiempo t on t.id_tiempo = hc.id_tiempo OR t.id_tiempo = hv.id_tiempo
    JOIN ASADO_EN_CASA.BI_sucursal s on s.id_sucursal = hc.id_sucursal OR s.id_sucursal = hv.id_sucursal
    GROUP BY anio, mes, sucursal_nro
GO

CREATE VIEW ASADO_EN_CASA.BI_v_precio_promedio_autos
AS
SELECT hv.id_modelo modelo, CAST(AVG(hc.monto_compras/hc.cantidad_compras) AS decimal(18,2)) promedio_compra, CAST(AVG(hv.monto_ventas/hv.cantidad_ventas) AS decimal(18,2)) promedio_ventas
    FROM ASADO_EN_CASA.BI_hechos_compras_autos hc
    FULL OUTER JOIN ASADO_EN_CASA.BI_hechos_ventas_autos hv on hc.id_modelo = hv.id_modelo
	GROUP BY hv.id_modelo
GO

CREATE VIEW ASADO_EN_CASA.BI_v_ganancia_autos_x_suc_x_mes
AS
SELECT anio, mes, sucursal_nro, ISNULL(sum(monto_ventas), 0) - ISNULL(sum(monto_compras), 0) ganancia
    FROM ASADO_EN_CASA.BI_hechos_compras_autos hc
    FULL OUTER JOIN ASADO_EN_CASA.BI_hechos_ventas_autos hv on hc.id_tiempo = hv.id_tiempo AND hc.id_sucursal = hv.id_sucursal
    JOIN ASADO_EN_CASA.BI_tiempo t on t.id_tiempo = hc.id_tiempo OR t.id_tiempo = hv.id_tiempo
    JOIN ASADO_EN_CASA.BI_sucursal s on s.id_sucursal = hc.id_sucursal OR s.id_sucursal = hv.id_sucursal
    GROUP BY anio, mes, sucursal_nro
GO

CREATE VIEW ASADO_EN_CASA.BI_v_tiempo_stock_autos
AS
SELECT id_modelo modelo, CAST(AVG(tiempo_en_stock) as decimal(18,2)) promedio_tiempo_stock_dias
    FROM ASADO_EN_CASA.BI_hechos_compras_autos hc
	GROUP BY id_modelo
GO

CREATE VIEW ASADO_EN_CASA.BI_v_precio_promedio_autopartes
AS
SELECT hv.id_autoparte autoparte, CAST(AVG(hc.monto_compras/hc.cantidad_compras) as decimal(18,2)) promedio_compra, CAST(AVG(hv.monto_ventas/hv.cantidad_ventas) as decimal(18,2)) promedio_ventas
    FROM ASADO_EN_CASA.BI_hechos_compras_autopartes hc
    FULL OUTER JOIN ASADO_EN_CASA.BI_hechos_ventas_autopartes hv on hc.id_autoparte = hv.id_autoparte
	GROUP BY hv.id_autoparte
GO

CREATE VIEW ASADO_EN_CASA.BI_v_ganancia_autopartes_x_suc_x_mes
AS
SELECT anio, mes, sucursal_nro, ISNULL(sum(monto_ventas), 0) - ISNULL(sum(monto_compras), 0) ganancia
    FROM ASADO_EN_CASA.BI_hechos_compras_autopartes hc
    FULL OUTER JOIN ASADO_EN_CASA.BI_hechos_ventas_autopartes hv on hc.id_tiempo = hv.id_tiempo AND hc.id_sucursal = hv.id_sucursal
    JOIN ASADO_EN_CASA.BI_tiempo t on t.id_tiempo = hc.id_tiempo OR t.id_tiempo = hv.id_tiempo
    JOIN ASADO_EN_CASA.BI_sucursal s on s.id_sucursal = hc.id_sucursal OR s.id_sucursal = hv.id_sucursal
    GROUP BY anio, mes, sucursal_nro
GO

CREATE VIEW ASADO_EN_CASA.BI_v_stock_autopartes_x_sucursal
AS
SELECT id_sucursal, anio, MAX(ASADO_EN_CASA.acumuladoCompras(s.id_sucursal, t.id_tiempo) - ASADO_EN_CASA.acumuladoVenta(s.id_sucursal, t.id_tiempo)) maxCantStockAnual
	FROM ASADO_EN_CASA.BI_tiempo t, ASADO_EN_CASA.BI_sucursal s
	GROUP BY id_sucursal, anio