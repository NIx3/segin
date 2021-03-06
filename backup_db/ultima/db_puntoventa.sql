-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2017 a las 06:03:35
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_puntoventa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `proveedor` smallint(5) UNSIGNED NOT NULL,
  `linea` smallint(5) UNSIGNED NOT NULL,
  `grupo` smallint(5) UNSIGNED NOT NULL,
  `imagen` varchar(80) NOT NULL,
  `codigostock` varchar(50) NOT NULL,
  `fecha_cad` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `codigo`, `descripcion`, `costo`, `precio`, `proveedor`, `linea`, `grupo`, `imagen`, `codigostock`, `fecha_cad`) VALUES
(1, '123', 'LICITACION ENAP', '88.80', '95.50', 2, 1, 1, '', '40', '2016-05-17'),
(2, '1234', 'LICITACION ENAP', '68.70', '105.50', 3, 2, 1, '', '48', '2016-09-25'),
(5, '12345', 'LICITACION ENAP', '65.50', '98.40', 6, 1, 2, '', '90', '2017-06-19'),
(4, '123457', 'sasf', '45645.00', '4565645.00', 2, 2, 2, '', '4564', '2017-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `id` int(11) NOT NULL,
  `numero` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`id`, `numero`, `nombre`) VALUES
(1, 1, 'MATRIZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `domicilio`, `telefono`, `ciudad`) VALUES
(1, 'CMPC', 'cerca', '9557844', 'conce'),
(2, 'ENAP', 'al lado', '515545128', 'concepcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias`
--

CREATE TABLE `existencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `existencias`
--

INSERT INTO `existencias` (`id`, `codigo`, `cantidad`) VALUES
(1, '123', '64.00'),
(2, '1234', '62.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `numero_fact` varchar(20) NOT NULL DEFAULT ' ',
  `proveedor` varchar(50) NOT NULL DEFAULT ' ',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `edo` varchar(10) NOT NULL DEFAULT ' ',
  `user` varchar(45) NOT NULL DEFAULT ' ',
  `concepto` varchar(200) NOT NULL DEFAULT ' ',
  `user_cancela` varchar(45) NOT NULL DEFAULT ' '
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `fecha`, `numero_fact`, `proveedor`, `subtotal`, `iva`, `total`, `edo`, `user`, `concepto`, `user_cancela`) VALUES
(1, '2017-06-26', '1234', '2', '14566.00', '1464.00', '18456.00', 'ACTIVO', 'niko', ' prueba', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL DEFAULT ' ',
  `cantidad` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo` varchar(5) NOT NULL DEFAULT ' ',
  `fecha` date NOT NULL,
  `user` varchar(50) NOT NULL DEFAULT ' ',
  `costou` decimal(10,2) NOT NULL DEFAULT '0.00',
  `preciou` decimal(10,2) NOT NULL DEFAULT '0.00',
  `proveedor` int(10) NOT NULL,
  `descuento_porcentaje` decimal(10,2) NOT NULL,
  `impuesto_porcentaje` decimal(10,2) NOT NULL,
  `serie` int(2) NOT NULL,
  `numero` int(10) NOT NULL,
  `fecha_proceso` date NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `referencia1` varchar(45) NOT NULL,
  `referencia2` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`id`, `codigo`, `cantidad`, `tipo`, `fecha`, `user`, `costou`, `preciou`, `proveedor`, `descuento_porcentaje`, `impuesto_porcentaje`, `serie`, `numero`, `fecha_proceso`, `referencia`, `referencia1`, `referencia2`) VALUES
(1, ' 123', '5.12', 'A', '2017-06-28', 'Chris', '4.30', '6.82', 2, '0.00', '0.19', 1, 456, '2017-06-22', '1', '', ''),
(12, ' 123', '5.12', 'B', '2017-06-25', 'Chris', '4.30', '6.82', 2, '0.00', '0.19', 1, 456, '2017-06-21', '1', '', ''),
(14, '1234567', '45645.00', 'B', '2017-06-27', 'NIKO', '125000.00', '150000.00', 2, '0.00', '0.19', 2, 120, '2017-06-27', '2', '', ''),
(4, '1234', '45.00', 'A', '2017-06-26', 'administrador', '125887.00', '158741.00', 2, '0.00', '0.19', 12, 1543, '2017-06-22', '2', '', ''),
(15, '1234567', '45645.00', 'A', '2017-06-27', 'NIKO', '125000.00', '150000.00', 2, '0.00', '0.19', 2, 120, '2017-06-27', '1', '2', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id` int(10) UNSIGNED NOT NULL,
  `linea` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `grupo` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `descripcion` varchar(80) NOT NULL DEFAULT ' ',
  `marca_eliminada` char(2) NOT NULL DEFAULT 'NO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lineas`
--

INSERT INTO `lineas` (`id`, `linea`, `grupo`, `descripcion`, `marca_eliminada`) VALUES
(4, 2, 1, 'Credito', 'NO'),
(1, 1, 2, 'Contado', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(10) UNSIGNED NOT NULL,
  `entrada_x_compra` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nombre_empresa` varchar(50) NOT NULL,
  `domicilio_empresa` varchar(50) NOT NULL,
  `caja1` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `caja2` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `caja3` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `caja4` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `nombre_emp_corto` varchar(25) NOT NULL DEFAULT ' '
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `entrada_x_compra`, `nombre_empresa`, `domicilio_empresa`, `caja1`, `caja2`, `caja3`, `caja4`, `nombre_emp_corto`) VALUES
(1, 12, 'emse', 'cerca', 1, 0, 0, 0, ' credito'),
(2, 12, 'emse', 'cerca', 1, 0, 0, 0, ' credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `telefono`, `domicilio`, `ciudad`) VALUES
(1, 'XGSD', 'XCV', 'SDFSD', 'B'),
(2, 'fuqe', '851568', 'hhhrtre', 'conce'),
(3, 'tyfvb', '865266895', 'tghheywyq', 'conce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

CREATE TABLE `temp` (
  `id` int(8) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `proveedor` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `num_fact_nota` varchar(15) NOT NULL DEFAULT ' ',
  `impuesto_porcentaje` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc_porcentaje` decimal(10,2) NOT NULL DEFAULT '0.00',
  `articulo` varchar(50) NOT NULL DEFAULT ' ',
  `costo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cantidad` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo` varchar(5) NOT NULL DEFAULT ' ',
  `descripcion_articulo` varchar(100) NOT NULL DEFAULT ' ',
  `descripcion_prov` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(50) NOT NULL DEFAULT ' ',
  `tipo` varchar(5) NOT NULL DEFAULT ' '
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `password` varchar(535) NOT NULL,
  `bodega` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `clave`, `password`, `bodega`) VALUES
(1, 'administrador', 'admin', 'admin', '1'),
(3, 'CHRIS', 'CHRIS', 'crhis123', '1'),
(4, 'NICO', 'NIKO', 'niko123', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `existencias`
--
ALTER TABLE `existencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `existencias`
--
ALTER TABLE `existencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
