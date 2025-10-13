-- ORACLE LiveSQL
/*
-- Crear sinonimo privado
create synonym nombre_sinonimo for esquema.objeto;

-- Crear sinonimo publico
create public synonym nombre_sinonimo for esquema.objeto;

-- eliminar sinonimo
drop synonym nombre_sinonimo;
drop public synonym nombre_sinonimo;

-- consultar sinonimos

-- sinonimos privados del usuario
select * from user_synonyms;
-- todos los sinonimos
select * from all_synonyms
--sinonimos publicos
select * from dba_synonyms where owner = 'PUBLIC';

cuando se usan los sinonimos en SQL?

*se utilizan en sentencias sql (select,insert, update, delete) como si fueran nombre del objeto real
*cuando necesitas simplificar nombres largos de objetos
*al migrar aplicaciones entre esquemas o bases de datos
*para abstraer la ubicacion fisica de los objetos
*cuando quieres ocultar la estructura real de la base de datos

Porque se usan los sinonimos en sql?

*simplicidad: evitar escribir nombres largos
*transparencia: ocultar la ubicacion real del objeto
*seguridad: no exponer nombres reales de objetos
*flexibilidad: cambiar objetos subyacentes sin modificar codigo
*portabilidad: facilitar migraciones entre ambientes
*independencia: desacoplar aplicaciones de la estructura fisica

Tips importantes

*documentar siempre que el obejto real referencia cada sinonimo
*evitar cadenas largas de sinonimos (sinonimo>sinonimo>tabla)
*

*/

create table clientes(
    id_cliente int primary key,
    nombre varchar2(100),
    ciudad varchar2(100),
    fecha_registro date);

insert into clientes(id_cliente,nombre,ciudad,fecha_registro)
values  (21,'Juan perez','Puerto montt',to_date('2023-05-15','YYYY-MM-DD')),
        (22,'Ana gomez','Temuco',to_date('2023-06-20','YYYY-MM-DD')),
        (23,'Luis martinez','Santiago',to_date('2023-07-01','YYYY-MM-DD')),
        (24,'Maria Fernandez','Temuco',to_date('2023-08-10','YYYY-MM-DD')),
        (25,'Francisca Fuenzalida','Valdivia',to_date('2023-07-09','YYYY-MM-DD'));

-- Crear sinonimo
create synonym syn_clientes for clientes;

-- seleccionar desde el sinonimo
select * from syn_clientes;

-- crear vista simple
create view clientes_temuco as
select id_cliente,nombre,ciudad
from clientes
where ciudad = 'Temuco';

-- crear sinonimo
create synonym syn_clientes_temuco for clientes_temuco;

-- Selecciona desde el sinonimo
select * from syn_clientes_temuco;

-- Crear vista simple
create view clientes_a as
select nombre
from clientes
where nombre like 'A%';

-- crear sinonimo
create synonym syn_clientes_a for clientes_a;

-- seleccionar desde el sinonimo
select * from syn_clientes_a;

-- eliminar sinonimo
drop synonym syn_clientes_a;