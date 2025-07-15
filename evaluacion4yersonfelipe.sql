create database cine;
use cine;
CREATE TABLE pelicula (
id_pelicula INT PRIMARY KEY,
titulo VARCHAR(100),
director VARCHAR(100),
duracion INT, -- en minutos
clasificacion VARCHAR(10)
);

INSERT INTO pelicula VALUES
(1, 'Inception', 'Christopher Nolan', 148, 'PG-13'),
(2, 'Toy Story', 'John Lasseter', 81, 'G'),
(3, 'El Padrino', 'Francis Ford Coppola', 175, 'R');

CREATE TABLE sala (
id_sala INT PRIMARY KEY,
nombre VARCHAR(50),
capacidad INT
);

INSERT INTO sala VALUES
(1, 'Sala 1', 100),
(2, 'Sala 2', 80),
(3, 'Sala 3', 120);

CREATE TABLE funcion (
id_funcion INT PRIMARY KEY,
id_pelicula INT,
id_sala INT,
fecha DATE,
hora TIME
);

INSERT INTO funcion VALUES
(1, 1, 1, '2025-07-11', '18:00:00'),
(2, 2, 2, '2025-07-10', '16:30:00'),
(3, 3, 3, '2025-07-09', '20:00:00');

CREATE TABLE entrada (
id_entrada INT PRIMARY KEY,
id_funcion INT,
asiento VARCHAR(10),
precio DECIMAL(10,2)
);

INSERT INTO entrada VALUES
(1, 1, 'A1', 5000),
(2, 1, 'A2', 5000),
(3, 2, 'B1', 4500),
(4, 3, 'C1', 6000);

-- PREGUNTAS

-- 1. Agregue la columna region a la tabla entrada
alter table entrada add region varchar(20);
-- 2. Agregue la columna id_pelicula como clave foranea para la tabla funcion
alter table funcion add CONSTRAINT FOREIGN key(id_pelicula) references pelicula(id_pelicula);
-- 3. Agregue la columna id_sala como clave foranea para la tabla funcion
alter table funcion add CONSTRAINT FOREIGN key(id_sala) references sala(id_sala);
-- 4. Agregue la columna id_funcion como clave foranea para la tabla entrada
alter table entrada add CONSTRAINT FOREIGN key(id_funcion) references funcion(id_funcion);
-- 5. Cambie el nombre de la columna capacidad por cap
alter table sala CHANGE capacidad cap int;
-- 6. Actualice el precio de la entradas que tengan un precio de 5000 a 2500
update entrada set precio = 2500 where precio = 5000;
-- 7. Actualice la region de todas las engtradas por Araucanía
update entrada set region = "Araucanía";
-- 8. Actualice la fecha de la funcion 3 por la fecha de hoy
update funcion set fecha = '2025-07-15' where id_funcion = 3;
-- 9. Elimine la entrada con el asiento B1
delete from entrada where id_entrada = 3;-- asiento = "B1";
-- 10. Elimine la funcion con fecha del 09/07
delete from funcion where id_funcion = 3; -- fecha = "2025-07-09"