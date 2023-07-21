CREATE DATABASE GlobalWay;

USE GlobalWay;

-- Creacion de Tablas.

DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario (
	cedula INT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(60) NOT NULL,
	email VARCHAR(60),
	telefono INT NOT NULL,	
);

DROP TABLE IF EXISTS Moneda;
CREATE TABLE Moneda(
	id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	comision INT
);

DROP TABLE IF EXISTS Reserva;
CREATE TABLE Reserva(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_moneda_compra INT NOT NULL,
	id_moneda_venta INT NOT NULL,
	monto INT NOT NULL,
	comision INT NOT NULL,
	FOREIGN KEY (id_moneda_compra) REFERENCES Moneda(id),
	FOREIGN KEY (id_moneda_venta) REFERENCES Moneda(id),
);


-- Stored Procedures

CREATE PROCEDURE spGlobalWay_RegistrarUsuario
	@nombre VARCHAR(30),
	@apellidos VARCHAR(60),
	@cedula INT,
	@telefono INT,
	@email VARCHAR(60)
AS	
BEGIN
	INSERT INTO Usuario VALUES(@cedula, @nombre, @apellidos, @email, @telefono)
END

EXEC spGlobalWay_RegistrarUsuario 'Brandon', 'Gomez Carvajal', 117970823, 70428451, 'bransti20@gmail.com';

SELECT * FROM Usuario;


CREATE PROCEDURE spGlobalWay_RegistroMoneda
	@nombre VARCHAR(30),
	@valor DECIMAL(10,2),
	@comision INT
AS	
BEGIN
	INSERT INTO Moneda (nombre, valor, comision) VALUES(@nombre, @valor, @comision);
END

SELECT * FROM Moneda;

DELETE FROM Moneda;


CREATE PROCEDURE spGlobalWay_ObtenerInfoMonedas
AS	
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Moneda;
END

EXEC spGlobalWay_ObtenerInfoMonedas;


DROP TABLE IF EXISTS Reserva;
CREATE TABLE Reserva(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_moneda_deseada INT NOT NULL,
	id_moneda_pago INT NOT NULL,
	monto_cambiar INT NOT NULL,
	monto_pagar DECIMAL(10,2),
	monto_comision INT NOT NULL,
	monto_pagar_total DECIMAL(10,2),
	FOREIGN KEY (id_moneda_deseada) REFERENCES Moneda(id),
	FOREIGN KEY (id_moneda_pago) REFERENCES Moneda(id),
);

CREATE PROCEDURE spGlobalWay_GuardarReserva
	@id_moneda_deseada INT,
    @id_moneda_pago INT,
	@monto_cambiar INT
AS	
BEGIN
	-- Declarar variables para almacenar los datos seleccionados
    DECLARE @valor_moneda_deseada DECIMAL(10,2);
    DECLARE @valor_moneda_pago DECIMAL(10,2);
    DECLARE @comision_moneda_pago INT;

    -- Obtener los datos de la moneda deseada.
    SELECT @valor_moneda_deseada = valor
    FROM Moneda
    WHERE id = @id_moneda_deseada;

    -- Obtener los datos de la moneda de pago.
    SELECT @valor_moneda_pago = valor, @comision_moneda_pago = comision
    FROM Moneda
    WHERE id = @id_moneda_pago;

	-- Calcular el monto a pagar.
	DECLARE @monto_pagar DECIMAL(10,2) = @monto_cambiar * @valor_moneda_pago;

	-- Calcular el monto de la comision.
	DECLARE @monto_comision DECIMAL(10,2) = @monto_pagar * (@comision_moneda_pago / 100.0);

	-- Calcular el monto de la comision.
	DECLARE @monto_pagar_total DECIMAL(10,2) = @monto_pagar + @monto_comision;

    -- Insertar los datos en la tabla Reserva
    INSERT INTO Reserva (id_moneda_deseada, id_moneda_pago, monto_cambiar, monto_pagar, monto_comision, monto_pagar_total)
    VALUES (@id_moneda_deseada, @id_moneda_pago, @monto_cambiar, @monto_pagar, @monto_comision, @monto_pagar_total);
END

EXEC spGlobalWay_GuardarReserva 7, 2, 1000;

DELETE FROM Reserva;
SELECT * FROM Moneda;
SELECT * FROM Reserva;
SELECT * FROM Usuario;

SELECT valor, comision
FROM Moneda
WHERE id = 2;
