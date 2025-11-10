
/*
estudiar esta wea:

https://virtual.inacap.cl/repositorio/TI3022_TFL/U2/TI3022_U2_S6/content/index.php?sci=47e69484258ca61d56c65764821450b3#/lessons/EKbn5xTIHAg2KIgR5ldB5Qa9FvhZFUq4

cast(): convierte un valor da in tipo de dato diferente | Ejemplo: select cast('123' as unsigned); |Result: 123 (como numero)
cast: Convierte a un numero a una cadena | Ejemplo: select cast(123 as char)| Result: 123 (como texto)

Funciones fecha y hora:
now(): devuelve la fecha y hora actual; select now();
curdate(): devuelve la fecha actual
year(): extrae el anio de una fecha: select year("2025-08-10") = 2025
month(): extrae el mes de una fecha
day(): extrae el dia de una fecha
datediff(): calcula de diferencia de dias entre2 fechas: datediff(date,date)
date_format(): Cambiar formato de la fecha: date_format(fecha,"%d-%m-%y")

%d = 01-31
%D = 1st,2nd
%m = 01,02
%M = Enero, Febrero
%y = muestra solo los ultimos 2 digitos 2025 = 25
%Y = 2024,2025

Funciones numericas:
abs(): devuelve un valor absolute:: select abs(-32) = 32
round(): redondea un numero: round(numero,cantidad_decimales)
ceil(): redondea hacia arriba al numero entero mas cercano
floor(): redondea hacia abajo al numero entero mas cercano
mod(): devuelve elr esto de una division: mod(10,3) = 10/3=9 sobra:1
power(): eleva el numero a potencia: power(2,3)=8

Funciones en cadena:
concat(): concatena dos a mas cadenas
upper(): convieret una cadenas a mayusculas
lower(): convierte una cadena a minusculas
substring(): extrae una subcadena: substring('MYSQL',1,2)='My'
length(): devuelve la longitud de una cadena: length(MYSQL)=5
trim(): elimina los espacios al inicio y final


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
