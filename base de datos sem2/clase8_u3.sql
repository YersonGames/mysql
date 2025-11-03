/*
Funciones de conversion de expresiones condicionales.

Funciones de conversion:

Que son las funciones de conversion?

Las funciones de conversion en SQL son herramientas que permiten transformar datos de un tipo a otro.
Permten convertir numeros a texto, texto a numeros, fechas a cadenas, y muchas otras combinaciones necesarias
para el manejo eficiente de datos.

Elementos de las funciones de conversion:

Las funciones de conversion tipicamente contienen...

    -Nombre de la funcion: Identifica la funcion (CAST).
    -Expresion o valor:  El dato sera convertido.
    -Tipo de destino: El tipo de dato al que se quiere convertir.
    -Parametros opcionales: Como charset, longitud, precision.

Como se usa?

> CAST()
    CAST(expresion as tipo_dato)

Tipos de datos mas comunes para conversion.
    -Char/Varchar: cadena de texto.
    -Date/Datetime/Time: Fecha y horas.
    -Decimal: Numeros decimales.
    -Signed/Unsigned: Enteros o sin signo.

Signed y Unsigned: la diferencia principal es que Signed permite numeros positivos,
negativos y cero, mientras que unsigned solo permite numeros positivos y cero.
Unsigned duplica el rango de valores positivos posibles para un tipo de dato, ya que
reserba el bit de signo para el valor en si.

Cuando se usan?
    -Cuando los tipos de datos no coinciden en comparaciones.
    -Al realizar operaciones matematicas co datos almacenados como texto.
    -Al formatear salidas de consultas.
    -Al importar/exportar datos entre diferentes sistemas.

Donde se usan?
    -En clausulas SELECT: Para formato de resultados.
    -En clausulas WHERE: Para comparaciones correctas.
    -En JOIN: Para unir tablas con tipos diferentes.
    -En ORDER BY: Para ordenamiento correcto.
    -En INSERT/UPDATE: Para asegurar tipos correctos.

Conversion de texto a numero:
    *Convertir string a entero (resultado: 123)
    *Notas: Entre "CAST"y el "(" no puede haber ningun espacio
    SELECT CAST('123' AS SIGNED) AS numero;

    *Convertir string a decimal (Resultado: 45.67)
    SELECT CAST('45.67' AS DECIMAL(10,2)) AS precio;

Conversion de numero a texto:
    *Numero a string (Resultado: '12345')
    SELECT CAST(12345 AS CHAR) AS codigo;

    *Con longitud especifica (Resultado: '789')
    SELECT CAST(789 AS CHAR(10)) AS codigo_fijo;

Conversion de fechas:
    *String a fecha
    SELECT CAST('2025-10-13' AS DATE) AS fecha;

    *Fecha a string
    SELECT CAST(NOW() AS CHAR) AS fecha_texto;

    *Extraser solo la fecha de un datetime (Resultado: 2025-10-13)
    SELECT CAST('2027-09-03 15:30:00' AS DATE) AS solo_fecha;

*/

create database prueba1;
use prueba1;

create table ventas(
    id int primary key,
    producto varchar(100),
    precio varchar(20),
    cantidad varchar(10),
    fecha_venta varchar(50)
);

insert into ventas
values  (1,"Notebook","1500.50","3","2025-10-01"),
        (2,"Mouse","25.99","5","2025-10-07"),
        (3,"Teclado","75.00","3","2025-10-13"),
        (4,"Monitor","450.75","3","2025-10-20");


-- Mostrar nombre del producto y el precio total (precio*cantidad)
select producto,round(cast(precio as decimal(10,2))*cast(cantidad as signed),2) as total from ventas;

-- Filtrar ventas entre el 05 y 15 de octubre 2025
select * from ventas where cast(fecha_venta as date) > "2025-10-05" and cast(fecha_venta as date) < "2025-10-15";
select * from ventas where cast(fecha_venta as date) between "2025-10-05" and "2025-10-15";