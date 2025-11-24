/*
Funciones de grupo y agrupamiento de filas usando las clausulas GROUP BY y 
HAVING

Ques es GROUP BY?

GROUP BY es una clausula de QSL que agrupa filas que tienen los mismos valores en las columnas especificadas,
permitiendo aplicar funciones de agregacion (COUNT, SUM. AVG, MAX MIN) sobre cada grupo, Basicamente,
convierte multiples filas en una sola fila resumen por grupo

Elementos que componen GROUP BY

    SELECT columna1,columna2, ... , funciones_de_agregacion()
    FROM tabla
    WHERE condicion
    GROUP BY columna1,columna2, ...
    HAVING  CONDICION_DE_AGREGACION()
    ORDER BY columna1,columna2, ...;

Componentes del GROUP BY

    *SELECT:    columnas a mostrar
    *Funciones de agregacion: COUNT(), SUM(), AVG(), MAX(), MIN()
    *WHERE: filtra filas antes de agrupar (opcionales)
    *GROUP BY: define las columnas por las cuales agrupar
    *HAVING: filtra grupos despues de la agrupacion
    *ORDER BY: ordena el resultado final


Funciones de agregacion

    COUNT(): se utiliza para contar el numero de filas que cumplen un criterio especifico. Se usa para obtener el tamaño de filas de un conjunto de datos o subconjunto dentro de una base de datos
    SUM(): suma un conjunto de valores en una columna numerica
    AVG(): calcula el valor promedio de una columna numerica
    MAX(): nos entrega el valor mas alto de un conjunto de valores en una fila
    MIN(): nos entrega el valor mas bajo de un conjunto de valores en una fila

Como se usa group by?

la sintaxis basica requiere que todas la columnas en SELECT que no sean funciones de agregacion esten ibncluidas en GROUP BY

    *Consulta la cantidad de personas que trabajan en cada departamento
    SELECT departamento, COUNT(*) as total
    FROM personal
    GROUP BY departamento;

    *Error: semanticamente incorrecto
    *el select incluye el nombre lo que es incoherente

    SELECT departamento, nombre, COUNT(*) as total
    FROM personal
    GROUP BY departamento;

    *Solo retiorna los departamentos que tienen mas de 170 empleados
    SELECT departamento, COUNT(*) as total
    FROM personal
    GROUP BY departamento
    HAVING COUNT(*) > 170;

    *Error: sintaxis incorrecta (where no puede usar funciones de agrupacion)
    SELECT departamento, COUNT(*) AS total
    FROM personal
    WHERE COUNT(*)>5
    GROUP BY departamento;


Regla de uso:

    Si se usar GROUP BY, cualquier columna en SELECT debe ser...
        
        *Unas de las columnas por las que se esta agrupando
        *O bien, una funcion de agregacion (como sum(), count(),etc.)

Diferencia clave:

    WHERE: filtra las filas individuales antes de que se agrupn
    Ejemplo: WHERE categoria = "Electronica"

    HAVING: filtra grupos enteros despues de que se agrupen

Cuando se usa GROUP BY?

    Se usa cuando necesitas...

        *Calcular totales, promedios o conteos por categorias
        *Resumir datos de multiples filas en estadisticas
        *Encontrar valores maximos/minimos por grupo
        *Generear reportes
        *Analizar datos agrupados por criteris especificos

Ejemplos:

    *Contar personas por ciudad 
    SELECT ciudad, COUNT(*) as cantidad 
    FROM personal 
    GROUP BY ciudad; 

    *Ventas totales por vendedor 
    SELECT vendedor, SUM(precio) as ventas_totales 
    FROM ventas 
    GROUP BY vendedor 
    ORDER BY ventas_totales DESC; 

    *Promedio de sueldo por ciudad, pero solo de 
    *aquellas en que el promedio es superior a $1.500.000 
    SELECT ciudad, AVG(sueldo) as sueldo_promedio 
    FROM personal 
    GROUP BY ciudad 
    HAVING AVG(sueldo) > 1500000; 

    *Agrupar por múltiples columnas 
    SELECT departamento, ciudad, COUNT(*) as personas 
    FROM personal 
    GROUP BY departamento, ciudad 
    ORDER BY departamento, ciudad; 

    *Con WHERE y HAVING 
    SELECT categoria, COUNT(*) as productos, AVG(precio) as precio_promedio 
    FROM productos 
    WHERE stock > 0 
    GROUP BY categoria 
    HAVING COUNT(*) >= 5 
    ORDER BY precio_promedio DESC;

    *Encontrar máximos y mínimos 
    SELECT cliente, 
        MIN(fecha_pedido) as primera_compra, 
        MAX(fecha_pedido) as ultima_compra, 
        COUNT(*) as total_compras 
    FROM pedidos 
    GROUP BY cliente; 

*/

-- Cuenta cuantos ciudadanos hay en cada ciudad
select ciudad, count(*) as personas
from personal
group by ciudad;

-- Muesta cantidad de pedidos qye ha realizado cada cliente
select cliente, count(*) as total_pedidos
from pedidos
group by cliente;

-- Muestra monto total de compras de cada cliente que acumulen mas de 1.000.000
select cliente, sum(total_pedido) as gasto_total
from pedidos
group by cliente
having gasto_total > 1000000;