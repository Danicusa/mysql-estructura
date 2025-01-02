CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE `clientes` (
  `id_cliente` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `apellidos` varchar(255),
  `direccion` varchar(255),
  `codigo_postal` varchar(255),
  `id_localidad` int,
  `telefono` varchar(255)
);

CREATE TABLE `localidad` (
  `id_localidad` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `id_provincia` int
);

CREATE TABLE `provincia` (
  `id_provincia` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255)
);

CREATE TABLE `productos` (
  `id_producto` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `descripcion` text,
  `imagen` varchar(255),
  `precio` float,
  `tipo` varchar(255) COMMENT 'Possible values: pizza, hamburguesa, bebida'
);

CREATE TABLE `pedidos` (
  `id_pedido` int PRIMARY KEY AUTO_INCREMENT,
  `id_client` int,
  `id_tienda` int,
  `id_repartidor` int COMMENT 'Only for Reparto',
  `fecha_hora` datetime,
  `tipo_pedido` varchar(255) COMMENT 'Reparto, recogida',
  `precio_total` float
);

CREATE TABLE `pedido_productos` (
  `id_pedido` int,
  `id_producto` int,
  `cantidad` int
);

CREATE TABLE `categorias` (
  `id_categoria` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255)
);

CREATE TABLE `pizzas` (
  `id_pizza` int PRIMARY KEY AUTO_INCREMENT,
  `id_producto` int,
  `id_categoria` int
);

CREATE TABLE `tiendas` (
  `id_tienda` int PRIMARY KEY AUTO_INCREMENT,
  `direccion` varchar(255),
  `codigo_postal` varchar(255),
  `id_localidad` int
);

CREATE TABLE `empleados` (
  `id_empleado` int PRIMARY KEY AUTO_INCREMENT,
  `id_tienda` int NOT NULL,
  `nombre` varchar(255),
  `apellidos` varchar(255),
  `nif` varchar(255) NOT NULL,
  `telefono` varchar(255),
  `rol` ENUM('Cocinero', 'Repartidor') NOT NULL
);

ALTER TABLE `clientes` ADD FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`);

ALTER TABLE `localidad` ADD FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_client`) REFERENCES `clientes` (`id_cliente`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_repartidor`) REFERENCES `empleados` (`id_empleado`);

ALTER TABLE `pedido_productos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

ALTER TABLE `pedido_productos` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `pizzas` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `pizzas` ADD FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

ALTER TABLE `tiendas` ADD FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`);

ALTER TABLE `empleados` ADD FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`);
