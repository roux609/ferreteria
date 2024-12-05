-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 05:14:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Herramientas Manuales'),
(2, 'Herramientas Eléctricas'),
(3, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_usuario`, `id_producto`, `cantidad`, `fecha_compra`, `nombre`, `precio`) VALUES
(1, 1, 3, 1, '2024-11-28 06:05:44', 'Llave Inglesa', 220.00),
(2, 1, 2, 1, '2024-11-28 06:05:44', 'Taladro', 850.00),
(3, 1, 2, 1, '2024-11-28 06:05:44', 'Taladro', 850.00),
(4, 1, 2, 1, '2024-11-28 06:21:02', 'Taladro', 850.00),
(5, 1, 2, 1, '2024-11-28 06:30:41', 'Taladro', 850.00),
(6, 1, 2, 1, '2024-11-28 06:30:41', 'Taladro', 850.00),
(7, 1, 1, 1, '2024-11-28 06:30:41', 'Martillo', 120.50),
(8, 1, 7, 1, '2024-11-28 07:36:44', 'Sierra Manual', 150.00),
(9, 1, 2, 1, '2024-11-28 07:36:44', 'Taladro', 850.00),
(10, 1, 6, 1, '2024-11-28 07:36:44', 'Alicate', 90.00),
(11, 1, 1, 1, '2024-11-28 07:41:46', 'Martillo', 120.50),
(12, 1, 2, 1, '2024-11-28 07:41:46', 'Taladro', 850.00),
(13, 1, 2, 1, '2024-12-02 00:37:48', 'Taladro', 850.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `imagen`, `descripcion`, `stock`, `categoria`, `id_categoria`) VALUES
(1, 'Martillo', 120.50, '/static/img/martillo.jpg', 'Martillo de acero inoxidable.', 50, 'Manuales', 1),
(2, 'Taladro', 850.00, '/static/img/taladro.jpg', 'Taladro eléctrico con velocidad ajustable.', 30, 'Manuales', 1),
(3, 'Llave Inglesa', 220.00, '/static/img/llave_inglesa.jpg', 'Llave ajustable de alta precisión.', 40, 'Manuales', 1),
(4, 'Destornillador', 50.00, '/static/img/destornillador.jpg', 'Destornillador multiuso con mango ergonómico.', 100, 'Eléctricas', 2),
(5, 'Cinta Métrica', 35.00, '/static/img/cinta_metrica.jpg', 'Cinta métrica de 5 metros.', 70, 'Eléctricas', 2),
(6, 'Alicate', 90.00, '/static/img/alicate.jpg', 'Alicate de corte de alta calidad.', 60, 'Eléctricas', 2),
(7, 'Sierra Manual', 150.00, '/static/img/sierra_manual.jpg', 'Sierra manual para cortes precisos.', 25, 'Medición', 3),
(8, 'Llave de Tubo', 180.00, '/static/img/llave_tubo.jpg', 'Llave de tubo resistente para plomería.', 20, 'Medición', 3),
(9, 'Nivel de Burbuja', 120.00, '/static/img/nivel_burbuja.jpg', 'Nivel de burbuja de alta precisión.', 15, 'Medición', 3),
(10, 'Caja de Herramientas', 950.00, '/static/img/caja_herramientas.jpg', 'Caja completa con herramientas básicas.', 10, 'Otros', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `correo`, `contrasena`) VALUES
(1, '2324493', 'luciormz70@gmail.com', '3333'),
(2, 'Polo', 'Eri@gmail.com', '111'),
(5, 'Polo', 'es12@gmail.com', '123444'),
(6, '2324493', 'orlo@gmail.com', '3333');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
