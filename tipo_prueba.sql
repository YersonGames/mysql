-- base de datos
-- tabla 1
-- tabla 2
-- tabla 3
-- tabla 4
-- insert tabla 1
-- insert tabla 2
-- insert tabla 3
-- insert tabla 4


-- 10 consultas con evidencia

-- 5 alter
-- agregar columnas
ALTER TABLE nombre_tabla ADD nombreColumna TipoDato;
-- cambiar el nombre de columnas
ALTER TABLE nombre_tabla CHANGE nombreAntiguoColumna nombreNuevoColumna;
-- cambiar nombre de tablas
ALTER TABLE nombre_tabla RENAME TO NuevoNombreTabla
-- agregar claves foraneas
ALTER TABLE nombre_tabla
ADD CONSTRAINT fk_NOMBRE
FOREIGN KEY(nombreColumnaActual) REFERENCES NombreTablaRelacion(nombreColumnaRelacion)
-- agregar claves foraneas
ALTER TABLE nombre_tabla
ADD CONSTRAINT fk_NOMBRE
FOREIGN KEY(nombreColumnaActual) REFERENCES NombreTablaRelacion(nombreColumnaRelacion)

-- 3 update 
-- actualizar registros especificos 
UPDATE nombre_tabla 
SET nombreColumnaACtualizar = NuevoValor
WHERE criterio de busqueda;
-- actualizar registros especificos 
UPDATE nombre_tabla 
SET nombreColumnaACtualizar = NuevoValor
WHERE criterio de busqueda;
-- actualizar registros especificos 
UPDATE nombre_tabla 
SET nombreColumnaACtualizar = NuevoValor
WHERE criterio de busqueda;

-- 2 delete
-- eliminar registros especificos 
DELETE nombre_tabla WHERE criterio de busqueda;
-- eliminar registros especificos 
DELETE nombre_tabla WHERE criterio de busqueda;
a