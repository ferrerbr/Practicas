CREATE DATABASE tienda_articuos;
USE tienda_articuos;
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10 , 2 ),
    id_categoria INT,
    stock INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    email VARCHAR(50)
);
CREATE TABLE ventas(
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_cliente INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );
    
INSERT INTO categorias (nombre_categoria)
 VALUES ('Xbox'), ('Tenis'), ('Ropa'), ('Artículos para jóvenes');
 
INSERT INTO productos (nombre_producto, precio, id_categoria, stock) 
VALUES
('Xbox Series X', 499.99, 1, 30), 
('Xbox Series S', 299.99, 1, 50), 
('Tenis Nike Air Max', 120.00, 2, 100), 
('Tenis Adidas Ultraboost', 180.00, 2, 80), 
('Camiseta Nike', 25.00, 3, 200), 
('Pantalón Levi\'s', 45.00, 3, 150), 
('Mochila para jóvenes', 35.00, 4, 120),
('Auriculares para jóvenes', 60.00, 4, 75);
 
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha) 
VALUES
(1, 1, 2, '2025-01-05'),
(2, 3, 1, '2025-01-10'),
(3, 5, 3, '2025-01-12'),
(4, 7, 1, '2025-01-14');

-- Consultas 
--  Obtener el total de compras realizadas por cada cliente (usando INNER JOIN)

 
    