--crear y usar base de datos libreria
create database libreria;

use libreria;

--Tabla autor

create table libreria.autor(
    id_autor int AUTO_INCREMENT primary key,
    nombre varchar(100),
    nacionalidad varchar(50)
);

--crear tabla libro
create table libreria.libro(
    id_libro int AUTO_INCREMENT primary key,
    titulo varchar(100),
    id_autor int,
    precio int,
    stock int,
    FOREIGN key(id_autor)references autor(id_autor)
    );

--agregar 3 autores
insert into libreria.autor(nombre,nacionalidad)values('Gabriel Garcia Márquez',"Colombiana");
insert into libreria.autor(nombre,nacionalidad)values('Isabel Allende',"Chilena");
insert into libreria.autor(nombre,nacionalidad)values('J.K Rownling',"Británica");
--agregar 3 libros
insert into libreria.libro(titulo,id_autor,precio,stock) values ('Cien años de Soledad',1,15000,10);
insert into libreria.libro(titulo,id_autor,precio,stock) values ('La casa de los espiritus',2,12000,5);
insert into libreria.libro(titulo,id_autor,precio,stock) values ('Harry Potter',3,18000,10);

select * from libreria.autor;
select nombre, nacionalidad from libreria.autor;

--consultar por todos los libros
select * from libreria.libro;

--consultar solo nombre autores
select nombre from libreria.autor;

--consultar solo nombre libros
select titulo from libreria.libro;

--buscar libros con stock mayor o igual 5
select * from libreria.libro where stock >= 5;

--buscar libros con precio menos o igual 15000
select * from libreria.libro where precio <= 15000;a