/*
Expresiones condicionales

Que son las expresiones condicionales en SQL?

    Las expresiones condicionales en SQL son sentencias que permiten evaluar condiciones y
    retornar diferentes valores segun el resultado de estas evaluaciones. Funcionan como una
    estructura del tipo "Si - entonces - sino" dentro de una consulta SQL.

SQL ofrece varias expresiones condicionales:

    *IF()
    *CASE
    *IFNULL()
    *NULLIF()
    *COALESCE()

IF():

    IF(condicion,valor_si_es_verdadero,valor_si_es_falso)

CASE:

    Tiene dos formas:
        Simple: Compara una expresion con valores especificos
        Buscada: Evalua multiples condiciones booleanas
    
    CASE
        WHEN condicion1 THEN resultado1
        WHEN condicion2 THEN resultado2
        ...
        ELSE resultado_default
    END


IFNULL():

    IFNULL(expresion,valor_si_es_nulo)

NULLIF():

    NULLIF(expresion1,expresion2)

COALESCE():

    Significa "Uniser" o "Fusionar"

    COALESCE(valor1,valor2,...,valorN)

Ejemplo IF():

    SELECT
        nombreproducto,
        precio,
        IF(precio > 3000,"Caro","Economico") AS categoria
    from productos;

    Si precio es mayor a 3000, categoria es "Caro", si es menor, categoria es "Economico"


Ejemplo CASE:

    SELECT
        nombre,
        CASE talla
            WHEN "S" THEN "Pequeña"
            WHEN "M" THEN "Mediana"
            WHEN "L" THEN "Grande"
            ELSE "Desconocida"
        END AS descripcion_talla
    FROM ropa;

Forma Buscada:
    
    SELECT
        apellido,
        salario,
        CASE
            WHEN salario < 500000 THEN "Bajo"
            WHEN salario BETWEEN 500000 AND 1000000 "Medio"
            WHEN salario > 1000000 THEN "Alto"
            ELSE "No especificado"
        END AS rango_salarial
    FROM personal;


IFNULL():
    Retorna el primer valor si no es NULL, de lo contrario retorna el segundo

    Ejemplo:

        SELECT
            apellido,
            IFNULL(departamento,"Sin departamento") AS contacto
        FROM personal;

NULLIF():
    Retorna NULL si ambas expresiones son iguales, de lo contrario retorna la primera

    SELECT
        nombreproducto,
        NULLIF(stock,0) as cantidad_valida
    FROM producto;

COALESCE():

    Retorna el primer valor no NULL de la lista

        SELECT
            nombre,
            COALESCE(email,celular,"Sin contacto") AS contacto_disponible
        FROM usuario;
*/