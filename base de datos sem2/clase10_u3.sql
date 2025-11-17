-- Crea la base de datos condicionales y tablas

CREATE DATABASE condicionales;

USE condicionales;

CREATE TABLE inventario
    (
    producto VARCHAR(50),
    cantidad INT,
    precio DECIMAL(10,2)
    );

INSERT INTO inventario VALUES
    ('Estufa', 5, 75000),
    ('Sofa', 25, 170000),
    ('Ventilador', 75, 35000),
    ('Lampara', 120, 17000);

CREATE TABLE empleados
    (
    nombre VARCHAR (100),
    sueldo INT,
    antiguedad_años INT,
    departamento VARCHAR (50)
    );

INSERT INTO empleados VALUES
    ('Diego Hernández', 600000, 1, 'Administración'),
    ('Ernesto Ibañez', 750000, 2, 'Ventas'),
    ('Fernando Jorquera', 1200000, 3, 'Administración'),
    ('Gastón Kramer', 2350000, 4, 'Ventas'),
    ('Hugo López', 1600000, 5, 'Logística'),
    ('Ignacia Manríquez', 1250000, 6, 'Logística'),
    ('Josefina Opazo', 950000, 7, 'Compras');

CREATE TABLE clientes
    (
    cliente_id INT,
    nombre VARCHAR (100),
    total_compras INT
    );

INSERT INTO clientes VALUES
    (1, 'Heriberto Fuenzalida', NULL),
    (2, 'Iván Guzmán', 12000),
    (3, 'Mabél López', 300000),
    (4, 'Olga Olivares', 950000),
    (5, 'Renata Salgado', 1500000);


select *,
        case
        when antiguedad_años < 2 then sueldo*0.05
        when antiguedad_años between 2 and 5 then sueldo*0.1
        when antiguedad_años > 5 then sueldo*0.15
        end as bono_extra
from empleados;



select *,
        case
            when total_compras > 1000000  then "VIP"
            when total_compras between 500000 and 1000000 then "Premium"
            when total_compras between 20000 and 500000 then "Regular"
            when total_compras < 20000 then "Nuevo"
            else "Nuevo"
        end as categoria_cliente
from clientes;