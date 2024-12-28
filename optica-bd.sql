CREATE TABLE `proveedor` (
  `nif_proveedor` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `telefono` varchar(255),
  `fax` varchar(255),
  `id_direccion` integer
);

CREATE TABLE `direccion` (
  `id_direccion` integer PRIMARY KEY AUTO_INCREMENT,
  `calle` varchar(255),
  `numero` integer,
  `piso` integer,
  `puerta` integer,
  `ciudad` varchar(255),
  `codigo_postal` varchar(255),
  `pais` varchar(255)
);

CREATE TABLE `gafas` (
  `id_gafa` integer PRIMARY KEY,
  `marca` varchar(255),
  `graduacion_derecho` float,
  `graduacion_izquierdo` float,
  `tipo_montura` varchar(255),
  `color_montura` varchar(255),
  `color_vidrio` varchar(255),
  `precio` float,
  `nif_proveedor` varchar(255)
);

CREATE TABLE `cliente` (
  `id_cliente` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `telefono` varchar(255),
  `correo_electronico` varchar(255),
  `fecha_registro` date,
  `id_recomendador` integer,
  `id_empleado` integer,
  `id_direccion` integer
);

CREATE TABLE `empleado` (
  `id_empleado` integer PRIMARY KEY,
  `nombre` varchar(255)
);

CREATE TABLE `venta` (
  `id_venta` integer PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` integer,
  `id_empleado` integer,
  `id_gafa` integer,
  `fecha_venta` date
);

ALTER TABLE `proveedor` ADD FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

ALTER TABLE `gafas` ADD FOREIGN KEY (`nif_proveedor`) REFERENCES `proveedor` (`nif_proveedor`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`id_recomendador`) REFERENCES `cliente` (`id_cliente`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

ALTER TABLE `venta` ADD FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

ALTER TABLE `venta` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `venta` ADD FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id_gafa`);
