-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 20:39:40
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
-- Base de datos: `carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `imagen` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Mujeres', 'Ropar para dama', 'women.jpg'),
(2, 'Hombres', 'Ropa para hombre', 'men.jpg'),
(3, 'Niños', 'Ropa para niños', 'children.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id`, `color`, `codigo`) VALUES
(1, 'Rojo', '#F00'),
(2, 'Blue', '#00F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_vencimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`id`, `codigo`, `status`, `tipo`, `valor`, `fecha_vencimiento`) VALUES
(5, '17491', 'Utilizado', 'porcentaje', '25', '2024-06-27'),
(6, '50964', 'Utilizado', 'moneda', '10', '2024-06-27'),
(7, '46147', 'Utilizado', 'porcentaje', '32', '2024-06-29'),
(8, '16198', 'Utilizado', 'porcentaje', '12', '2024-06-15'),
(9, '33020', 'Utilizado', 'porcentaje', '50', '2024-07-06'),
(10, '51030', 'Utilizado', 'porcentaje', '17', '2024-06-21'),
(11, '38102', 'Utilizado', 'porcentaje', '13', '2024-07-05'),
(12, '28865', 'Utilizado', 'porcentaje', '25', '2024-07-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `Contacto` varchar(100) NOT NULL,
  `Provincia` varchar(50) NOT NULL,
  `Distrito` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `Contacto`, `Provincia`, `Distrito`, `direccion`, `cp`, `id_venta`) VALUES
(1, '2', 'asd', 'asd', '123', '123', 12),
(2, '3', '', 'asd', 'asd', '123', 14),
(3, '3', 'asa', 'asasa', 'asas', '111', 15),
(4, '3', 'asas', 'asasa', 'sas', '121', 16),
(5, '1', '', '', '', '', 17),
(6, '4', '', 'AAHH Año Nuevo Comas 5 de marzo Mz E Lt3', 'Lima Lima Comas', '15011', 18),
(7, '4', '', 'AAHH Año Nuevo Comas 5 de marzo Mz E Lt3', 'Lima Lima Comas', '15011', 21),
(8, '6', '', 'AAHH Año Nuevo Comas 5 de marzo Mz E Lt3', 'Lima Lima Comas', '15011', 22),
(9, '1', '', '', '', '', 23),
(10, '1', '', '', '', '', 24),
(11, '1', '', '', '', '', 25),
(12, '1', '', '', '', '', 26),
(13, '1', '', '', '', '', 27),
(14, '1', '', '', '', '', 28),
(15, '1', '', '', '', '', 29),
(16, '1', '', '', '', '', 30),
(17, '4', '', 'AAHH Año Nuevo Comas 5 de marzo Mz E Lt3', 'Lima Lima Comas', '15011', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `metodo` varchar(100) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `metodo`, `id_venta`) VALUES
(3, 'mercadopago', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `inventario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `talla` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `inventario`, `id_categoria`, `talla`, `color`) VALUES
(1, 'Tank Top', 'Finding perfect t-shirt', 60, 'cloth_1.jpg', 2, 3, 'XL', 'white'),
(2, 'Corater', 'Finding perfect products', 20, 'shoe_1.jpg', -4, 2, '25.5', 'blue'),
(3, 'Producto 0', 'Esta es la descripcion', 705, 'cloth_1.jpg', 35, 1, 'L', 'Azul'),
(4, 'Producto 1', 'Esta es la descripcion', 838, 'cloth_1.jpg', 3, 1, 'L', 'Azul'),
(5, 'Producto 2', 'Esta es la descripcion', 769, 'cloth_1.jpg', 85, 1, 'L', 'Azul'),
(6, 'Producto 3', 'Esta es la descripcion', 85, 'cloth_1.jpg', 100, 1, 'L', 'Azul'),
(7, 'Producto 4', 'Esta es la descripcion', 851, 'cloth_1.jpg', 77, 1, 'L', 'Azul'),
(8, 'Producto 5', 'Esta es la descripcion', 43, 'cloth_1.jpg', 74, 1, 'L', 'Azul'),
(9, 'Producto 6', 'Esta es la descripcion', 206, 'cloth_1.jpg', 35, 1, 'L', 'Azul'),
(10, 'Producto 7', 'Esta es la descripcion', 145, 'cloth_1.jpg', 11, 1, 'L', 'Azul'),
(11, 'Producto 8', 'Esta es la descripcion', 897, 'cloth_1.jpg', 31, 1, 'L', 'Azul'),
(12, 'Producto 9', 'Esta es la descripcion', 818, 'cloth_1.jpg', 83, 1, 'L', 'Azul'),
(13, 'Producto 10', 'Esta es la descripcion', 207, 'cloth_1.jpg', 4, 1, 'L', 'Azul'),
(14, 'Producto 11', 'Esta es la descripcion', 543, 'cloth_1.jpg', 93, 1, 'L', 'Azul'),
(15, 'Producto 12', 'Esta es la descripcion', 54, 'cloth_1.jpg', 78, 1, 'L', 'Azul'),
(16, 'Producto 13', 'Esta es la descripcion', 68, 'cloth_1.jpg', 97, 1, 'L', 'Azul'),
(17, 'Producto 14', 'Esta es la descripcion', 705, 'cloth_1.jpg', 71, 1, 'L', 'Azul'),
(18, 'Producto 15', 'Esta es la descripcion', 815, 'cloth_1.jpg', 77, 1, 'L', 'Azul'),
(19, 'Producto 16', 'Esta es la descripcion', 354, 'cloth_1.jpg', 36, 1, 'L', 'Azul'),
(20, 'Producto 17', 'Esta es la descripcion', 587, 'cloth_1.jpg', 68, 1, 'L', 'Azul'),
(21, 'Producto 18', 'Esta es la descripcion', 902, 'cloth_1.jpg', 50, 1, 'L', 'Azul'),
(22, 'Producto 19', 'Esta es la descripcion', 125, 'cloth_1.jpg', 46, 1, 'L', 'Azul'),
(23, 'Producto 20', 'Esta es la descripcion', 539, 'cloth_1.jpg', 100, 1, 'L', 'Azul'),
(24, 'Producto 21', 'Esta es la descripcion', 815, 'cloth_1.jpg', 66, 1, 'L', 'Azul'),
(25, 'Producto 22', 'Esta es la descripcion', 733, 'cloth_1.jpg', 13, 1, 'L', 'Azul'),
(26, 'Producto 23', 'Esta es la descripcion', 665, 'cloth_1.jpg', 26, 1, 'L', 'Azul'),
(27, 'Producto 24', 'Esta es la descripcion', 501, 'cloth_1.jpg', 12, 1, 'L', 'Azul'),
(28, 'Producto 25', 'Esta es la descripcion', 166, 'cloth_1.jpg', 89, 1, 'L', 'Azul'),
(29, 'Producto 26', 'Esta es la descripcion', 269, 'cloth_1.jpg', 17, 1, 'L', 'Azul'),
(30, 'Producto 27', 'Esta es la descripcion', 738, 'cloth_1.jpg', 46, 1, 'L', 'Azul'),
(31, 'Producto 28', 'Esta es la descripcion', 93, 'cloth_1.jpg', 32, 1, 'L', 'Azul'),
(32, 'Producto 29', 'Esta es la descripcion', 702, 'cloth_1.jpg', 94, 1, 'L', 'Azul'),
(33, 'Producto 30', 'Esta es la descripcion', 803, 'cloth_1.jpg', 12, 1, 'L', 'Azul'),
(34, 'Producto 31', 'Esta es la descripcion', 598, 'cloth_1.jpg', 100, 1, 'L', 'Azul'),
(35, 'Producto 32', 'Esta es la descripcion', 329, 'cloth_1.jpg', 32, 1, 'L', 'Azul'),
(36, 'Producto 33', 'Esta es la descripcion', 592, 'cloth_1.jpg', 82, 1, 'L', 'Azul'),
(37, 'Producto 34', 'Esta es la descripcion', 496, 'cloth_1.jpg', 59, 1, 'L', 'Azul'),
(38, 'Producto 35', 'Esta es la descripcion', 750, 'cloth_1.jpg', 19, 1, 'L', 'Azul'),
(39, 'Producto 36', 'Esta es la descripcion', 677, 'cloth_1.jpg', 55, 1, 'L', 'Azul'),
(40, 'Producto 37', 'Esta es la descripcion', 875, 'cloth_1.jpg', 22, 1, 'L', 'Azul'),
(41, 'Producto 38', 'Esta es la descripcion', 299, 'cloth_1.jpg', 70, 1, 'L', 'Azul'),
(42, 'Producto 39', 'Esta es la descripcion', 119, 'cloth_1.jpg', 4, 1, 'L', 'Azul'),
(43, 'Producto 40', 'Esta es la descripcion', 621, 'cloth_1.jpg', 95, 1, 'L', 'Azul'),
(44, 'Producto 41', 'Esta es la descripcion', 336, 'cloth_1.jpg', 33, 1, 'L', 'Azul'),
(45, 'Producto 42', 'Esta es la descripcion', 321, 'cloth_1.jpg', 62, 1, 'L', 'Azul'),
(46, 'Producto 43', 'Esta es la descripcion', 161, 'cloth_1.jpg', 32, 1, 'L', 'Azul'),
(47, 'Producto 44', 'Esta es la descripcion', 755, 'cloth_1.jpg', 57, 1, 'L', 'Azul'),
(48, 'Producto 45', 'Esta es la descripcion', 499, 'cloth_1.jpg', 18, 1, 'L', 'Azul'),
(49, 'Producto 46', 'Esta es la descripcion', 568, 'cloth_1.jpg', 85, 1, 'L', 'Azul'),
(50, 'Producto 47', 'Esta es la descripcion', 964, 'cloth_1.jpg', 78, 1, 'L', 'Azul'),
(51, 'Producto 48', 'Esta es la descripcion', 255, 'cloth_1.jpg', 36, 1, 'L', 'Azul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta`
--

CREATE TABLE `productos_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productos_venta`
--

INSERT INTO `productos_venta` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio`, `subtotal`) VALUES
(3, 5, 2, 1, 20, 20),
(4, 6, 2, 1, 20, 20),
(5, 7, 2, 1, 20, 20),
(6, 8, 2, 1, 20, 20),
(7, 9, 2, 1, 20, 20),
(8, 10, 2, 1, 20, 20),
(9, 11, 2, 1, 20, 20),
(10, 12, 2, 1, 20, 20),
(11, 14, 51, 1, 255, 255),
(12, 15, 51, 1, 255, 255),
(13, 16, 49, 1, 568, 568),
(14, 17, 1, 1, 60, 60),
(15, 18, 1, 11, 60, 660),
(16, 19, 1, 4, 60, 240),
(17, 20, 1, 4, 60, 240),
(18, 21, 1, 4, 60, 240),
(19, 22, 1, 2, 60, 120),
(20, 23, 2, 7, 20, 140),
(21, 24, 4, 1, 838, 838),
(22, 25, 7, 3, 851, 2553),
(23, 26, 3, 8, 705, 5640),
(24, 27, 5, 1, 769, 769),
(25, 28, 3, 1, 705, 705),
(26, 29, 11, 2, 897, 1794),
(27, 30, 10, 8, 145, 1160),
(28, 31, 1, 2, 60, 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_perfil` varchar(300) NOT NULL,
  `nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `telefono`, `email`, `password`, `img_perfil`, `nivel`) VALUES
(8, 'asd asd', '123', 'miguel@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'default.jpg', 'admin'),
(25, 'Fernando Chamba', '123', 'fernandoalejo68@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'default.jpg', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_cupon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_usuario`, `total`, `fecha`, `status`, `id_pago`, `id_cupon`) VALUES
(19, 24, 240, '2024-06-25 10:06:02', 'preparacion', 0, 0),
(20, 25, 240, '2024-06-25 10:06:13', 'preparacion', 0, 0),
(21, 26, 240, '2024-06-25 10:06:35', 'preparacion', 0, 7),
(22, 27, 120, '2024-06-25 10:06:10', 'preparacion', 0, 6),
(23, 28, 140, '2024-06-25 10:06:24', 'preparacion', 0, 8),
(24, 29, 838, '2024-06-25 10:06:05', 'preparacion', 0, 9),
(25, 30, 2553, '2024-06-25 10:06:31', 'preparacion', 0, 10),
(26, 31, 5640, '2024-06-25 10:06:41', 'preparacion', 0, 0),
(27, 32, 769, '2024-06-25 10:06:52', 'preparacion', 0, 11),
(28, 33, 705, '2024-06-25 10:06:06', 'preparacion', 0, 11),
(29, 34, 1794, '2024-06-25 10:06:55', 'preparacion', 0, 11),
(30, 35, 1160, '2024-06-25 11:06:12', 'preparacion', 0, 12),
(31, 25, 120, '2024-06-25 13:06:58', 'preparacion', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
