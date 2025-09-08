create database empresa2;
use empresa2;

create table departamentos(
    id int primary key,
    nombre varchar(50),
    presupuesto decimal(12,2)
);

create table empleados(
    id int primary key,
    nombre varchar(50),
    departamento_id int,
    salario decimal(10,2),
    fecha_contrato date,
    FOREIGN key(departamento_id) references departamentos(departamento_id)
);

insert into departamentos(id,nombre,presupuesto) values(0,"Ventas",1200000);
insert into departamentos(id,nombre,presupuesto) values(1,"Contabilidad",1300000); 

insert into empleados(id,nombre,departamento_id,salario,fecha_contrato) values(0,"Martin Herrera",0,1100000,"2024-08-02");
insert into empleados(id,nombre,departamento_id,salario,fecha_contrato) values(1,"Felipe Antio",0,900000,"2025-08-02");
insert into empleados(id,nombre,departamento_id,salario,fecha_contrato) values(2,"Juan Herrera",1,1000000,"2023-07-04");
insert into empleados(id,nombre,departamento_id,salario,fecha_contrato) values(3,"Maria Jose Antimilla",1,800000,"2025-07-04");

-- Vista simple: empleados con salario mas alto
create view empleados_alto_salario as
    select id, nombre,salario
    from empleados
    where salario > 1000000;

-- Vista simple: empleados nuevos
create view empleados_nuevos as
    select id,nombre,fecha_contrato,salario
    from empleados
    where year(fecha_contrato) = year(curdate());

create view empleados_detalle as
    select
        e.id,
        e.nombre as empleado,
        e.salario,
        d.nombre as departamento,
        d.presupuesto,
            case
                when e.salario > 1200000 then "Alto"
                when e.salario > 900000 then "Medio"
                else "Bajo"
            end as nivel_salario
        from empleados e
        inner join departamentos d on e.departamento_id = d.id;