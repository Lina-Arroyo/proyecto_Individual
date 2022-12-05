CREATE DATABASE proyecto_individual; #Creamos la clase de datos
USE proyecto_individual; #Especificamos que en esta base de datos es la que vamos a trabajar

/*Visualizar los primeros 10 registros de la tabla*/
SELECT *FROM precios_semana_20200413
LIMIT 10;

SELECT *FROM precios_semana_20200503
LIMIT 10;

SELECT *FROM precios_semana_20200518
LIMIT 10;

SELECT * FROM precios_semana_20200419_20200426
LIMIT 10;

SELECT *FROM producto
LIMIT 10;

SELECT * FROM sucursal
LIMIT 10;

/*Creamos una tabla llamada ventas que almacenara la informacion de todas las tablas de precios*/
CREATE TABLE ventas (
	id_venta 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	precio 		DOUBLE,
    producto_id VARCHAR (30),
    sucursal_id VARCHAR(30),
    fecha 		VARCHAR(20)
);

/*Insertamos en la tabla ventas todos los registros contenidos en cada una de las tablas de precios*/
INSERT INTO ventas (precio, producto_id, sucursal_id)
SELECT * FROM precios_semana_20200413;
UPDATE ventas SET fecha = '20200413' WHERE fecha = '' OR ISNULL(fecha); #CON ESTE CODIGO ESTAMOS SETEANDO A LA COLUMNA FECHA LA SEMANA A LA CUAL PERTENECEN ESOS REGISTROS

INSERT INTO ventas (precio, producto_id, sucursal_id)
SELECT * FROM precios_semana_20200503;
UPDATE ventas SET fecha = '20200503' WHERE fecha = '' OR ISNULL(fecha);

INSERT INTO ventas (precio, producto_id, sucursal_id)
SELECT * FROM precios_semana_20200518;
UPDATE ventas SET fecha = '20200518' WHERE fecha = '' OR ISNULL(fecha);

/*Creamos un trigger que nos permitira actualizar la tabla de cambios cada que se insertan nuevos registros*/
DROP TRIGGER IF EXISTS cambios_ventas;
CREATE TRIGGER cambios_ventas
AFTER INSERT ON ventas
FOR EACH ROW 
INSERT INTO venta_cambios (IdCambio, Precio, Sucursal_id, Producto_id, fechaModificacion)
VALUES (NEW.Precio, NEW.Sucursal_id, NEW.Producto_id, now(), user());

/*Creamos una tabla de auditoria para guardar los cambios/actualizacion de los registros en la tabla*/
CREATE TABLE venta_cambios (
	 IdCambio  	  	    INT NOT NULL AUTO_INCREMENT,
     Precio  		  		FLOAT(50,30),
     Producto_id     		VARCHAR(20),
  	 Sucursal_id     		VARCHAR(20),
     fechaModificacion 	DATETIME,
	 Usuario              VARCHAR(15),
     PRIMARY KEY (IdCambio)
);

/*Con esta sentencia vamos a cambiar de lugar la columna producto_id para que los datos en esta columna coincidan con la columna producto_id en la tabla de venta*/
ALTER TABLE precios_semana_20200419_20200426 
CHANGE COLUMN producto_id producto_id TEXT NULL DEFAULT NULL AFTER precio;

/*Realizamos la carga incremental con la tabla creada con SqlAlchemy ya que esta contiene los registros limpios y normalizados*/
INSERT INTO ventas (precio, producto_id, sucursal_id)
SELECT * FROM precios_semana_20200419_20200426;
UPDATE ventas SET fecha = '20200419_20200426' WHERE fecha = '' OR ISNULL(fecha);


/*REALIZAMOS LA CONSULTA*/
SELECT AVG(precio) FROM ventas
WHERE sucursal_id = '9-1-688';




