CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

INSERT INTO clientes (cliente_id, nombre, email, ciudad)
VALUES
(1, 'Carlos Pérez', 'carlos@mail.com', 'Madrid'),
(2, 'Ana Gómez', 'ana@mail.com', 'Barcelona'),
(3, 'Luis Martínez', 'luis@mail.com', 'Valencia');

INSERT INTO productos (producto_id, nombre_producto, precio)
VALUES
(1, 'Camiseta', 15.99),
(2, 'Pantalón', 25.50),
(3, 'Zapatos', 40.00);

INSERT INTO pedidos (pedido_id, cliente_id, producto_id, cantidad, fecha_pedido)
VALUES
(1, 1, 2, 2, '2025-01-10'),
(2, 2, 1, 1, '2025-01-12'),
(3, 1, 3, 1, '2025-01-13'),
(4, 3, 1, 3, '2025-01-14'),
(5, 2, 2, 1, '2025-01-14');

-- Consultas basicas 
SELECT nombre, email FROM clientes;

SELECT SUM(precio) AS suma_precios
FROM productos;

SELECT MAX(precio) AS precio_maximo
FROM productos;

SELECT MIN(precio) 
FROM productos;




