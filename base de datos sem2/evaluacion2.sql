-- Crea base de datos
CREATE DATABASE techstore_db;
USE techstore_db;

-- Crea tabla productos
CREATE TABLE productos
    (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(200),
    categoria VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT,
    fecha_ingreso DATE
    );

-- Crea tabla ventas
CREATE TABLE ventas
    (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    cantidad INT,
    fecha_venta DATE,
    nombre_cliente VARCHAR(150),
    ciudad_cliente VARCHAR(100)
    );

-- Inserta datos en productos
INSERT INTO productos (nombre_producto, categoria, precio, stock, fecha_ingreso) VALUES
    ('Laptop Dell XPS', 'Electrónica', 1250000.00, 15, '2025-01-15'),
    ('Mouse Logitech', 'Accesorios', 25000.00, 50, '2025-02-20'),
    ('Teclado Mecánico', 'Accesorios', 85000.00, 30, '2025-03-10'),
    ('Monitor Samsung 27"', 'Electrónica', 350000.00, 20, '2025-01-25'),
    ('Auriculares Sony', 'Electrónica', 120000.00, 40, '2025-04-05'),
    ('Webcam HD', 'Accesorios', 55000.00, 25, '2025-02-15'),
    ('Disco Duro 1TB', 'Almacenamiento', 75000.00, 35, '2025-03-20'),
    ('Memoria RAM 16GB', 'Componentes', 95000.00, 28, '2025-01-30');

-- Inserta datos en ventas
INSERT INTO ventas (id_producto, cantidad, fecha_venta, nombre_cliente, ciudad_cliente) VALUES
    (1, 2, '2025-05-10', 'Juan Pérez', 'Santiago'),
    (2, 5, '2025-05-12', 'Ana Gómez', 'Valparaíso'),
    (3, 3, '2025-05-15', 'Luis Martínez', 'Santiago'),
    (4, 1, '2025-05-18', 'María Fernández', 'Concepción'),
    (5, 2, '2025-05-20', 'Pedro Silva', 'Santiago'),
    (1, 1, '2025-05-22', 'Carmen Torres', 'Temuco'),
    (6, 4, '2025-05-25', 'Jorge Ramírez', 'Valparaíso'),
    (7, 2, '2025-05-28', 'Sofía Muñoz', 'Santiago'),
    (8, 3, '2025-06-01', 'Diego Castro', 'Concepción'),
    (2, 10, '2025-06-05', 'Isabel Rojas', 'Temuco');

-- Crear indice no unico llamado idx_categoria
CREATE INDEX idx_categoria ON productos(categoria);

-- Crear indice no unico llamado idx_ciudad_cliente
CREATE INDEX idx_ciudad_cliente ON ventas(ciudad_cliente);

-- Mostrar indices
SHOW INDEX FROM productos;
SHOW INDEX FROM ventas;

-- Crear vista llamada productos_electronicos

CREATE VIEW productos_electronicos AS
SELECT  nombre_producto,categoria,precio,stock
FROM productos
WHERE categoria = "Electrónica";

-- Crear sinonimo llamado syn_prod_elec
CREATE SYNONYM syn_prod_elec for productos_electronicos;

-- Crear sinonimo llamado syn_ventas
CREATE SYNONYM syn_ventas for ventas;

-- Consultar syn_prod_elec
SELECT * FROM syn_prod_elec;

-- Mostrar nombe productos en mayusculas y categoria en minusculas en columnas separadas
SELECT UPPER(productos.nombre_producto) AS nombre_producto,lower(productos.categoria) AS categoria_producto FROM productos;

-- Generar codigo producto
SELECT CONCAT(SUBSTRING(UPPER(productos.nombre_producto),1,3),"-",productos.id_producto) AS codigo_producto from productos;

-- Mostrar nombre completo y ciudad cliente
SELECT CONCAT(TRIM(ventas.nombre_cliente)," - ",ventas.ciudad_cliente) AS nombre_ciudad_cliente FROM ventas;

-- Calcular valor total del inventario de cada producto
SELECT round(precio*stock,0) AS total_precio_producto FROM productos;

-- Mostrar precio, valor absoluto y precioe elevado al cuadrado
SELECT productos.nombre_producto,productos.precio,ABS(productos.precio) AS valor_absoluto,POWER(productos.precio,2) AS valor_al_cuadrado FROM productos;

-- Mostrar nombre, fecha de ingreso y el año de ingreso
SELECT productos.nombre_producto, productos.fecha_ingreso, YEAR(productos.fecha_ingreso) AS año_ingreso from productos;

-- Mostrar cuanto tiempo ha transcurrido desde la fecha  de cada venta hasta la actual
SELECT ventas.id_venta, DATEDIFF(NOW(),ventas.fecha_venta) AS dias_transcurridas FROM ventas;

-- Mostrar precio con signo $
SELECT CONCAT("$",CAST(productos.precio AS CHAR)) AS Precio FROM productos;

-- Mostrar stock tipo unsigned junto al nombre del producto
SELECT CONCAT(CAST(productos.stock as UNSIGNED)," - ",productos.nombre_producto) AS stock_nombre_producto FROM productos;