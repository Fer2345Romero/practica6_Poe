CREATE DATABASE RegistroBiblioteca
GO

USE RegistroBiblioteca
GO

CREATE TABLE Libros(
id_libro INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
codigo_Libro VARCHAR(50) NOT NULL,
precio MONEY NOT NULL,
fecha_publicacion DATETIME NOT NULL
)

CREATE TABLE Autores(
id_autor INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(70) NOT NULL,
FechaAlta DATETIME NOT NULL,
FechaBaja DATETIME NOT NULL
)

CREATE TABLE CompraLibros(
id_compra INT PRIMARY KEY IDENTITY(1,1),
id_autor INT,
vendido CHAR,
fechaVenta DATETIME
)

CREATE TABLE Registro_Ventas(
id_registro_venta INT PRIMARY KEY IDENTITY(1,1),
id_compra INT NOT NULL,
cantidad INT NOT NULL,
id_libro INT NOT NULL
)


CREATE TABLE Facturas(
id_facturas INT PRIMARY KEY IDENTITY(1,1),
id_compra INT,
TotalFactura FLOAT NOT NULL,
Fecha DATE NOT NULL
)


ALTER TABLE CompraLibros
ADD FOREIGN KEY(id_autor) REFERENCES 
Autores(id_autor)

ALTER TABLE Registro_Ventas
ADD FOREIGN KEY(id_compra) REFERENCES 
CompraLibros(id_compra)

ALTER TABLE Registro_Ventas
ADD FOREIGN KEY(id_libro) REFERENCES
Libros(id_libro)

ALTER TABLE Facturas
ADD FOREIGN KEY(id_compra) REFERENCES
CompraLibros(id_compra)

INSERT INTO Autores VALUES('Alfredo Espino', 'algredoespino@gmail.com', '2023/09/15', '2023/09/18')

SELECT * FROM Autores where nombre ='Manlio Argueta'

SELECT * FROM Autores where id_autor=4

UPDATE Autores SET nombre = 'Alfredo Espino' WHERE id_autor = 5

DELETE FROM Autores WHERE id_autor =3

INSERT INTO Libros VALUES('878980', $700, '2023/09/15')

SELECT * FROM Libros where codigo_Libro ='8890'

SELECT * FROM Libros where id_libro=489

UPDATE Libros SET codigo_Libro = 'Alfredo Espino' WHERE id_libro = 5

DELETE FROM Libros WHERE id_libro =3