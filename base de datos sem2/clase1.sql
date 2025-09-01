create database empresa;
use empresa;

create table personal(
    id int auto_increment primary key,
    nombre varchar(100) not null,
    apellido varchar(100) not null,    
    email varchar(100) unique,
    salario int,
    departamento varchar(100),
    fecharegistro date
);

create table productos(
    id_producto int auto_increment primary key,
    nombreproducto varchar(255) not null,
    precio decimal(10,2) not null,
    stock int default 0,
    fechacreacion datetime default current_timestamp
);

-- alter table personal add telefono varchar(20);
-- alter table personal drop column fecharegistro;
-- drop table productos;

insert into personal(nombre, apellido,salario,departamento) values("Juan","Perez",700000,"Ventas");

insert into personal(nombre, apellido,salario,departamento)
values("Maria","Garcia",650000,"Marketing"),
("Carlos","Lopez",680000,"IT"),
("Ana","Martin",620000,"Ventas");

-- insertar sin especificar
insert into personal values(5,"Pedro","Sanchez","ps@gmail.com",900000,"Gerencia","2025-08-21");

insert into productos
values(1,"Cuaderno",4500,20,"2025-08-21"),
(2,"Lapiz",2800,35,"2024-09-11"),
(3,"Goma",1200,15,"2023-10-31");

update personal set salario = 750000 where id = 1;

update personal set salario = salario * 1.1, departamento = "Ventas Senior"
where departamento = "Ventas" and salario > 700000;

update productos set precio = precio * 1.05;

-- delete from personal where id = 3;
-- delete from personal where salario > 600000 and departamento = "Marketing";
-- delete from personal;

select * from personal;
select nombre, email from personal;
select * from personal where departamento = "Ventas";

select * from personal where nombre like "A%";
select * from personal where departamento in("Ventas","IT");

select * from personal order by nombre asc;
select * from personal order by nombre desc;

select distinct departamento from personal;