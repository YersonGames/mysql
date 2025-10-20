
/*
estudiar esta wea:

https://virtual.inacap.cl/repositorio/TI3022_TFL/U2/TI3022_U2_S6/content/index.php?sci=47e69484258ca61d56c65764821450b3#/lessons/EKbn5xTIHAg2KIgR5ldB5Qa9FvhZFUq4

cast(): convierte un valor da in tipo de dato diferente | Ejemplo: select cast('123' as unsigned); |Result: 123 (como numero)
cast: Convierte a un numero a una cadena | Ejemplo: select cast(123 as char)| Result: 123 (como texto)

*/
create database empresa;
use empresa;


create table empleados(
    id int primary key,
    nombre varchar(50),
    apellido varchar(50),
    salario decimal(10),
    fecha_contratacion date
);

insert into empleados
values  (1," ana ","Gómes",150000.19,'2022-01-15'),
        (2,"juan","perez",120000.28,'2021-06-20'),
        (3,"MARIA","lopez",185000.37,'2023-03-10'),
        (4,"Marcela","Latorre",175000.46,'2023-03-10'),
        (5,"aNDRES","gARRIDO",950000.55,'2023-03-10');


-- mostrar nombre en mayusculas y apellido en minuscula, sin espacios a los lados


select concat(upper(trim(nombre))," ",lower(apellido)) as nombre_completo from empleados;

select nombre,round(salario,1) as salario_redondeado from empleados;

select nombre, year(fecha_contratacion) as contratacion from empleados;

select * from empleados where month(fecha_contratacion) = "03";