create database empresa;
use empresa;

create table personal(
    id int primary key,
    nombre varchar(100) not null,
    email varchar(100) unique,
    fecharegistro date
);

create table productos(
    id_producto int auto_increment primary key,
    nombreproducto varchar(255) not null,
    precio decimal(10,2) not null,
    stock int default 0,
    fechacreacion datetime default current_timestamp
);

alter table personal add telefono varchar(20);
alter table personal drop column fecharegistro;

drop table productos;

insert into personal(nombre, apellido,salario,departamento) values("Juan","Perez",700000,"Ventas");

insert into personal(nombre, apellido,salario,departamento)
values("Maria","Garcia",650000,"Marketing"),
values("Carlos","Lopez",680000,"IT"),
values("Ana","Martin",620000,"Ventas");

-- insertar sin especificar
insert into personal values(5,"Pedro","Sanchez","ps@gmail.com",900000,"Gerencia","2025-08-21");