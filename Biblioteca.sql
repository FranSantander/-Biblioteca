--Parte 2 - Creando el modelo en la base de datos
--1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. 

--Creando base de datos 
CREATE DATABASE biblioteca;
\c biblioteca

--Creando tablas
CREATE TABLE libro(
    isbn VARCHAR(13) NOT NULL,
    titulo VARCHAR (100) NOT NULL,
    pagina INT NOT NULL, 
    PRIMARY KEY (isbn)
);

CREATE TABLE autor(
    cod_autor SERIAL  NOT NULL,
    nom_autor VARCHAR (20) NOT NULL,
    ape_autor VARCHAR (20) NOT NULL,
    nac_muerte VARCHAR (9) NOT NULL,
    PRIMARY KEY(cod_autor)
);

CREATE TABLE tipo_autor(
    id_tipo INT PRIMARY KEY NOT NULL,
    cod_autor_tipo SERIAL NOT NULL,
    isbn_tipo VARCHAR (13) NOT NULL,
    tipo VARCHAR (9) NOT NULL,
    FOREIGN KEY (cod_autor_tipo) REFERENCES autor (cod_autor),
    FOREIGN KEY (isbn_tipo) REFERENCES libro (isbn)
);

CREATE TABLE socio(
    rut VARCHAR (9) PRIMARY KEY NOT NULL,
    nom_socio VARCHAR (20) NOT NULL,
    ape_socio VARCHAR (20) NOT NULL,
    direccion VARCHAR (100) UNIQUE,
    telefono INT UNIQUE
    );

CREATE TABLE historial_prestamo (
    id_prestamo VARCHAR (100) PRIMARY KEY NOT NULL,
    cod_autor_id SERIAL NOT NULL,
    rut_id VARCHAR(9),
    isbn_prestamo VARCHAR(13) NOT NULL,
    fecha_prest DATE NOT NULL,
    fecha_dev DATE NOT NULL,
    FOREIGN KEY (cod_autor_id) REFERENCES autor (cod_autor),
    FOREIGN KEY (rut_id) REFERENCES socio(rut),
    FOREIGN KEY (isbn_prestamo) REFERENCES libro (isbn)
);

--2. Se deben insertar los registros en las tablas correspondientes

--Datos tabla libro
INSERT INTO libro (isbn, titulo, pagina) VALUES
('1111111111111', 'CUENTOS DE TERROR', 344);
INSERT INTO libro (isbn, titulo, pagina) VALUES
('2222222222222', 'POESÍAS CONTEMPO RANEAS', 167);
INSERT INTO libro (isbn, titulo, pagina) VALUES
('3333333333333', 'HISTORIA DE ASIA', 344);
INSERT INTO libro (isbn, titulo, pagina) VALUES
('4444444444444', 'MANUAL DE MECÁNICA', 298);

--Datos tabla autor
INSERT INTO autor (cod_autor, nom_autor, ape_autor, nac_muerte)
VALUES (1, 'Andres', 'Ulloa', '1982-' );
INSERT INTO autor (cod_autor, nom_autor, ape_autor, nac_muerte)
VALUES (2, 'Sergio', 'Mardones', '1950-2012' );
INSERT INTO autor (cod_autor, nom_autor, ape_autor, nac_muerte)
VALUES (3, 'Jose', 'Salgado', '1968-2020' );
INSERT INTO autor (cod_autor, nom_autor, ape_autor, nac_muerte)
VALUES (4, 'Ana', 'Salgado', '1972-' );
INSERT INTO autor (cod_autor, nom_autor, ape_autor, nac_muerte)
VALUES (5, 'Martin', 'Porta', '1976-' );

--Datos tabla tipo_autor
INSERT INTO tipo_autor(id_tipo, cod_autor_tipo, isbn_tipo, tipo )
VALUES (1,1, '2222222222222', 'Principal');
INSERT INTO tipo_autor(id_tipo, cod_autor_tipo, isbn_tipo, tipo  )
VALUES (2,2, '3333333333333', 'Principal');
INSERT INTO tipo_autor(id_tipo, cod_autor_tipo, isbn_tipo, tipo)
VALUES (3,3, '1111111111111', 'Principal');
INSERT INTO tipo_autor(id_tipo, cod_autor_tipo, isbn_tipo, tipo )
VALUES (4,4, '1111111111111', 'Coautor');
INSERT INTO tipo_autor(id_tipo, cod_autor_tipo, isbn_tipo, tipo )
VALUES (5,5, '4444444444444','Principal');

--Datos tabla socios
INSERT INTO socio(rut, nom_socio, ape_socio, direccion, telefono)
VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socio(rut, nom_socio, ape_socio, direccion, telefono)
VALUES ('2222222-2', 'ANA', 'PEREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socio(rut, nom_socio, ape_socio, direccion, telefono)
VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socio(rut, nom_socio, ape_socio, direccion, telefono)
VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO socio(rut, nom_socio, ape_socio, direccion, telefono)
VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');


--Datos tabla historial_prestamo
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (1, 3, '1111111-1', '1111111111111', '2020-01-20', '2020-01-27');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (2, 1, '5555555-5', '2222222222222', '2020-01-20', '2020-01-30');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (3, 2, '3333333-3', '3333333333333', '2020-01-22', '2020-01-30');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (4, 5, '4444444-4', '4444444444444', '2020-01-23', '2020-01-30');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (5, 3, '2222222-2', '1111111111111', '2020-01-27', '2020-02-04');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (6, 5, '1111111-1', '4444444444444', '2020-01-31', '2020-02-12');
INSERT INTO historial_prestamo(id_prestamo, cod_autor_id, rut_id, isbn_prestamo, fecha_prest, fecha_dev)
VALUES (7, 3, '3333333-3', '1111111111111', '2020-01-20', '2020-01-27');

--Realizar las siguientes consultas:
--a. Mostrar todos los libros que posean menos de 300 páginas.
SELECT titulo FROM libro WHERE pagina < 300;

--b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
SELECT nom_autor, ape_autor FROM autor where nac_muerte > '1970-1970';

--¿Cuál es el libro más solicitado?
SELECT titulo, COUNT(*) AS solicitado
FROM libro JOIN historial_prestamo
ON libro.isbn = historial_prestamo.isbn_prestamo
GROUP BY libro.titulo
ORDER BY solicitado DESC;

--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.
SELECT l.titulo, nom_socio, ape_socio, (fecha_dev - fecha_prest - 7)*100
AS multa FROM historial_prestamo AS h 
JOIN socio AS s ON h.rut_id = s.rut
JOIN libro AS l on l.isbn = h.isbn_prestamo
WHERE fecha_dev - fecha_prest > 7
ORDER BY multa DESC;