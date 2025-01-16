CREATE DATABASE IF NOT EXISTS TiendaDB;
USE TiendaDB;

CREATE TABLE IF NOT EXISTS Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10, 2),
    fecha_ultimo_precio DATE
);
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
INSERT INTO Productos (nombre_producto, precio, fecha_ultimo_precio) VALUES
('Camiseta', 20.00, '2025-01-01'),
('Pantalón', 30.00, '2025-01-01'),
('Zapatos', 50.00, '2025-01-01'),
('Chaqueta', 70.00, '2025-01-01');
INSERT INTO Clientes (nombre_cliente) VALUES
('Juan Pérez'),
('Ana Gómez'),
('Carlos López'),
('María Rodríguez');
INSERT INTO Ventas (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 2, '2025-01-10'),
(1, 3, 1, '2025-01-12'),
(2, 2, 1, '2025-01-11'),
(3, 1, 3, '2025-01-14');

-- Obtener ventas con detalles de productos  
SELECT 
    V.id_venta, V.cantidad, P.nombre_producto, P.precio
FROM
    Ventas V
        INNER JOIN
    Productos P ON V.id_producto = P.id_producto;

 