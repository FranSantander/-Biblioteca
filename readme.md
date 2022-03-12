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
    cod_autor SERIAL PRIMARY KEY NOT NULL,
    nom_autor VARCHAR (20) NOT NULL,
    ape_autor VARCHAR (20) NOT NULL,
    nac_muerte VARCHAR (9) NOT NULL,
    tipo_autor VARCHAR (9) NOT NULL,
    isbn_libro VARCHAR (13) NOT NULL,
    FOREIGN KEY (isbn_libro) REFERENCES libro(isbn)
);

CREATE TABLE socio(
    rut VARCHAR (13) PRIMARY KEY NOT NULL,
    isbn_id VARCHAR (13) NOT NULL,
    nom_socio VARCHAR (20) NOT NULL,
    ape_socio VARCHAR (20) NOT NULL,
    direccion VARCHAR (100) UNIQUE,
    telefono INT UNIQUE,
    FOREIGN KEY (isbn_id) REFERENCES libro(isbn)
);

CREATE TABLE historial_prestamo (
    id_prestamo INT PRIMARY KEY NOT NULL,
    cod_autor_id SERIAL NOT NULL,
    rut_id VARCHAR(9),
    fecha_prest DATE NOT NULL,
    fecha_dev DATE NOT NULL,
    FOREIGN KEY (cod_autor_id) REFERENCES autor (cod_autor),
    FOREIGN KEY (rut_id) REFERENCES socio(rut)
);