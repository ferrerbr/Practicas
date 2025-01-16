CREATE DATABASE PracticarJoin;
USE PracticarJoin;
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    salario DECIMAL(10, 2),
    id_departamento INT
);
CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50)
);
INSERT INTO Departamentos (nombre_departamento)
VALUES 
    ('Recursos Humanos'),
    ('Desarrollo'),
    ('Ventas'),
    ('Marketing');
    
INSERT INTO Empleados (nombre, salario, id_departamento)
VALUES
    ('Juan Pérez', 25000.00, 1),
    ('María López', 30000.00, 2),
    ('Luis Gómez', 28000.00, 3),
    ('Ana García', 27000.00, NULL),
    ('Carlos Torres', 35000.00, 2);

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
INNER JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
lEFT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
RIGHT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;
    
INSERT INTO Departamentos (nombre_departamento)
VALUES 
    ('I+D'),
    ('Intendencia'),
    ('Compras');
    
INSERT INTO Empleados (nombre, salario, id_departamento)
VALUES
    ('Brandon Ferrer', 25000.00, 4),
    ('Circe Delgadillo ', 30000.00, 5),
    ('Jose de jesus', 28000.00, 6),
    ('Brenda Rosas', 27000.00, NULL),
    ('Luis Vazquesz', 35000.00, NULL);
    
ALTER TABLE Empleados ADD COLUMN  edad INT;

UPDATE Empleados SET edad = 45 WHERE id_empleado  = 1;
UPDATE Empleados SET edad = 30 WHERE id_empleado  = 2;
UPDATE Empleados SET edad = 35 WHERE id_empleado  = 3;
UPDATE Empleados SET edad = 28 WHERE id_empleado  = 4;
UPDATE Empleados SET edad = 40 WHERE id_empleado  = 5;
UPDATE Empleados SET edad = 26 WHERE id_empleado  = 6;
UPDATE Empleados SET edad = 27 WHERE id_empleado  = 7;
UPDATE Empleados SET edad = 23 WHERE id_empleado  = 8;
UPDATE Empleados SET edad = 29 WHERE id_empleado  = 9;
UPDATE Empleados SET edad = 33 WHERE id_empleado  = 10;

SELECT nombre, edad FROM Empleados; 

SELECT nombre, salario
FROM empleados
WHERE salario > 30000;

SELECT Empleados.nombre AS empleado, Departamentos.nombre_departamento AS departamento
FROM Empleados
INNER JOIN Departamentos
ON Empleados.departamento_id = Departamentos.id_departamento;

SELECT 
    nombre_departamento AS departamento
FROM
    Departamentos;
    
SELECT 
    nombre
FROM
    Empleados
WHERE
    id_departamento = (SELECT 
            id_departamento
        FROM
            Departamentos
        WHERE
            nombre_departamento = 'Ventas');
            
SELECT Empleados.nombre, Empleados.salario, Departamentos.nombre_departamento AS departamento
FROM Empleados
INNER JOIN Departamentos
ON Empleados.id_departamento = Departamentos.id_departamento;

SELECT nombre, salario  
FROM empleados  
WHERE salario > (SELECT AVG(salario) FROM empleados);

ALTER TABLE Empleados ADD COLUMN  region VARCHAR(50);
ALTER TABLE Empleados ADD COLUMN  ventas INT;

UPDATE Empleados 
SET region = 'America', ventas = 100 
WHERE id_empleado = 1;

UPDATE Empleados 
SET region = 'Africa', ventas = 200 
WHERE id_empleado = 2;

UPDATE Empleados 
SET region = 'Asia', ventas = 300 
WHERE id_empleado = 3;

UPDATE Empleados 
SET region = 'Europa', ventas = 400 
WHERE id_empleado = 4;

UPDATE Empleados 
SET region = 'America', ventas = 150 
WHERE id_empleado = 5;

UPDATE Empleados 
SET region = 'Asia', ventas = 250 
WHERE id_empleado = 6;

UPDATE Empleados 
SET region = 'America', ventas = 350 
WHERE id_empleado = 7;

UPDATE Empleados 
SET region = 'America', ventas = 450 
WHERE id_empleado = 8;

UPDATE Empleados 
SET region = 'Asia', ventas = 500 
WHERE id_empleado = 9;

UPDATE Empleados 
SET region = 'Oceania', ventas = 600 
WHERE id_empleado = 10;

SELECT * FROM Empleados;

SELECT 
    region, SUM(ventas) AS total_ventas
FROM
    Empleados
GROUP BY region;

SELECT SUM(ventas) AS ventas_totales FROM empleados;


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);


INSERT INTO productos (nombre, precio) VALUES
('Producto 1', 150.00),
('Producto 2', 300.00),
('Producto 3', 450.00),
('Producto 4', 250.00),
('Producto 5', 500.00),
('Producto 6', 100.00),
('Producto 7', 350.00),
('Producto 8', 700.00),
('Producto 9', 800.00),
('Producto 10', 600.00),
('Producto 11', 120.00),
('Producto 12', 400.00),
('Producto 13', 200.00),
('Producto 14', 550.00),
('Producto 15', 650.00);

SELECT nombre, precio  
FROM productos  
ORDER BY precio DESC  
LIMIT 5; 

-- Crear la tabla clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- Crear la tabla pedidos
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

-- Insertar datos de ejemplo en la tabla clientes
INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Sánchez', 'carlos.sanchez@example.com'),
('Ana Gómez', 'ana.gomez@example.com'),
('Luis Martínez', 'luis.martinez@example.com');

-- Insertar datos de ejemplo en la tabla pedidos
INSERT INTO pedidos (cliente_id, fecha_pedido, total) VALUES
(1, '2025-01-05', 150.00),
(2, '2025-01-12', 250.00),
(3, '2025-01-20', 300.00),
(1, '2025-01-25', 100.00),
(4, '2025-02-03', 200.00),
(5, '2025-01-18', 180.00),
(3, '2024-12-30', 120.00);
 
SELECT nombre  
FROM clientes  
WHERE cliente_id IN (SELECT cliente_id  
                     FROM pedidos  
                     WHERE fecha_pedido BETWEEN '2025-01-01' AND '2025-01-31');

-- Agregar la columna 'categoria' a la tabla 'productos'
ALTER TABLE productos
ADD COLUMN categoria VARCHAR(50);

-- Actualizar algunos datos de ejemplo con categorías
UPDATE productos
SET categoria = 'Electrónica'
WHERE id_producto IN (1, 2, 3, 4);

UPDATE productos
SET categoria = 'Hogar'
WHERE id_producto IN (5, 6, 7);

UPDATE productos
SET categoria = 'Deportes'
WHERE id_producto IN (8, 9);

UPDATE productos
SET categoria = 'Moda'
WHERE id_producto IN (10, 11, 12);

UPDATE productos
SET categoria = 'Alimentos'
WHERE id_producto IN (13, 14, 15);

-- Consulta para obtener el promedio y la suma de las ventas por categoría
SELECT categoria, 
       AVG(precio) AS promedio_ventas, 
       SUM(precio) AS suma_ventas
FROM productos
GROUP BY categoria;

SELECT * FROM empleados;
Select * from pedidos;


CREATE TABLE ventas (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
-- Insertar ventas para el empleado Juan Pérez
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(1, 500.00, '2025-01-05'),
(1, 600.00, '2025-01-10'),
(1, 700.00, '2025-01-15');

-- Insertar ventas para el empleado María López
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(2, 800.00, '2025-01-06'),
(2, 750.00, '2025-01-12'),
(2, 900.00, '2025-01-18');

-- Insertar ventas para el empleado Luis Gómez
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(3, 400.00, '2025-01-07'),
(3, 500.00, '2025-01-13'),
(3, 450.00, '2025-01-19');

-- Insertar ventas para el empleado Ana García
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(4, 550.00, '2025-01-08'),
(4, 600.00, '2025-01-14'),
(4, 650.00, '2025-01-20');

-- Insertar ventas para el empleado Carlos Torres
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(5, 950.00, '2025-01-09'),
(5, 800.00, '2025-01-16'),
(5, 850.00, '2025-01-22');

-- Insertar ventas para el empleado Brandon Ferrer
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(6, 700.00, '2025-01-10'),
(6, 750.00, '2025-01-17'),
(6, 800.00, '2025-01-23');

-- Insertar ventas para el empleado Circe Delgadillo
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(7, 950.00, '2025-01-11'),
(7, 1000.00, '2025-01-18'),
(7, 1100.00, '2025-01-24');

-- Insertar ventas para el empleado Jose de Jesus
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(8, 600.00, '2025-01-12'),
(8, 650.00, '2025-01-19'),
(8, 700.00, '2025-01-25');

-- Insertar ventas para el empleado Brenda Rosas
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(9, 450.00, '2025-01-13'),
(9, 500.00, '2025-01-20'),
(9, 550.00, '2025-01-26');

-- Insertar ventas para el empleado Luis Vazquesz
INSERT INTO ventas (id_empleado, monto, fecha_venta) VALUES
(10, 800.00, '2025-01-14'),
(10, 850.00, '2025-01-21'),
(10, 900.00, '2025-01-27');

SELECT * FROM ventas;

SELECT id_empleado, MIN(monto) AS monto_venta_mas_baja
FROM ventas
GROUP BY id_empleado;


SELECT e.nombre, MIN(v.monto) AS monto_venta_mas_baja
FROM ventas v
JOIN Empleados e ON v.id_empleado = e.id_empleado
GROUP BY e.id_empleado;



