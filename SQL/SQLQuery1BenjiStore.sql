--CREA BASE DE DATOS
create database BenjiStore

--CREA TABLA CAJEROS
CREATE TABLE Cajeros(
codigo_cajero int identity(101,1),
nombre_cajero nvarchar(50)not null, --no puede ser nulo
apellido_cajero nvarchar(50)not null, --no puede ser nulo
CONSTRAINT PK_cCajero PRIMARY KEY (codigo_cajero)
)

INSERT INTO Cajeros (nombre_cajero, apellido_cajero) values  ('Keylor', 'Navas'), ('Joel', 'Campbel')
select * from Cajeros

--drop table Productos

--CREA TABLA PRODUCTOS
CREATE TABLE Productos(
codigo_producto int identity (1001, 1),
nombre_producto nvarchar(50) not NULL,
precio float (20) DEFAULT 0, --por defecto el precio eta en 0
CONSTRAINT PK_cProducto PRIMARY KEY (codigo_producto)
)

INSERT INTO Productos (nombre_producto, precio) values ('Guantes', 10000), ('Balon', 15000), ('Camiseta', 20000)
SELECT * FROM Productos

UPDATE Productos SET nombre_producto = 'Jacket', precio = 25000 WHERE codigo_producto = 1003


--CREA TABLA MAQUINAS
CREATE TABLE Maquinas(
codigo_maquina int identity(11,1),
id_piso int,
CONSTRAINT PK_cMaquina PRIMARY KEY (codigo_maquina),
)

INSERT INTO Maquinas VALUES (1), (2)
SELECT * FROM Maquinas

--CREA TABLA VENTAS
CREATE TABLE Ventas(
numero_factura int identity(10000,5), --consecutivo cita
codigo_cajero int,
codigo_producto int,
codigo_maquina int,
fecha datetime DEFAULT GETDATE()
CONSTRAINT PK_nFactura PRIMARY KEY (numero_factura),
CONSTRAINT FK_codigo_cajero FOREIGN KEY (codigo_cajero) REFERENCES Cajeros(codigo_cajero),
CONSTRAINT FK_codigo_producto FOREIGN KEY (codigo_producto) REFERENCES Productos(codigo_producto),
CONSTRAINT FK_codigo_maquina FOREIGN KEY (codigo_maquina) REFERENCES Maquinas(codigo_maquina)
)

INSERT INTO Ventas (codigo_cajero, codigo_producto, codigo_maquina) VALUES (101,1001, 11), (102,1002, 12)
SELECT * FROM Ventas

SELECT Ventas.numero_factura, Cajeros.nombre_cajero, Productos.nombre_producto, Maquinas.id_piso from Ventas 
inner join Maquinas on Ventas.codigo_maquina = Maquinas.codigo_maquina 
inner join Cajeros on Ventas.codigo_cajero = Cajeros.codigo_cajero 
inner join Productos on Ventas.codigo_producto = Productos.codigo_producto