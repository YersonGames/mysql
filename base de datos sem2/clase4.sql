create database empresa3;
use empresa3;

create table usuarios(
    id int auto_increment primary key,
    nombre varchar(50),
    email varchar(100)
);

create table productos(
    codigo int auto_increment primary key,
    nombre varchar(100),
    precio decimal(10,2)
)auto_increment = 1000;

set session auto_increment_increment = 5;
set session auto_increment_offset = 1;

create table pedidos(
    numero_pedido int auto_increment primary key,
    fecha date,
    cliente_id int
);

insert into usuarios(nombre,email) values("Fernando Perez","fp@email.com");
insert into usuarios(nombre,email) values("Antonieta Garcia","ag@email.com");

insert into productos(nombre,precio)
values  ("Laptop",899.99),
        ("Mouse",25.50);

insert into pedidos(fecha,cliente_id)
values  ("2024-01-15",1),
        ("2024-01-16",2),
        ("2024-01-17",3);
