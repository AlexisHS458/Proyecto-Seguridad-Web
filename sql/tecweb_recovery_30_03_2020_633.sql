-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2020 a las 02:33:27
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecweb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Estado` (`E_Nombre` VARCHAR(255), `E_Descripcion` VARCHAR(200), `E_Id` BIGINT(20))  UPDATE estado SET nombre=E_Nombre, descripcion= E_Descripcion WHERE id=E_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Grupo` (`G_Nombre` VARCHAR(255), `G_Descripcion` VARCHAR(200), `G_Id` BIGINT(20))  UPDATE grupo SET nombre=G_Nombre, descripcion= G_Descripcion WHERE id=G_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Nivel` (`N_Nombre` VARCHAR(255), `N_Descripcion` VARCHAR(200), `N_Id` BIGINT(20))  UPDATE nivel SET nombre=N_Nombre, descripcion= N_Descripcion WHERE id=N_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Profesor` (`P_Nombre` VARCHAR(255), `P_Descripcion` VARCHAR(200), `P_Id` BIGINT(20))  UPDATE estado SET nombre=P_Nombre, descripcion= P_Descripcion WHERE id=P_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Programa_A` (`PA_Nombre` VARCHAR(255), `PA_Descripcion` VARCHAR(200), `PA_Id` BIGINT(20))  UPDATE programa_academico SET nombre=PA_Nombre, descripcion= PA_Descripcion WHERE id=PA_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Semestre` (`S_nombre` INT(11), `S_Descripcion` VARCHAR(45), `S_Id` BIGINT(15))  UPDATE semestre SET nombre=S_nombre, descripcion=S_Descripcion WHERE id=S_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Tipo_P` (`TP_Nombre` VARCHAR(255), `TP_Descripcion` VARCHAR(255), `TP_ID` BIGINT(15))  UPDATE tipo SET nombre=TP_Nombre, descripcion=TP_Descripcion WHERE id= TP_ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Unidad_A` (`UA_Nombre` INT(11), `UA_Descripcion` VARCHAR(200), `UA_Id` BIGINT(20))  UPDATE unidad_aprendizaje SET nombre=UA_Nombre, descripcion= UA_Descripcion WHERE id=UA_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Estado` (`E_Id` BIGINT(20))  DELETE FROM estado WHERE id=E_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Grupo` (`G_Id` BIGINT(20))  DELETE FROM grupo WHERE id=G_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Nivel` (`N_Id` BIGINT(20))  DELETE FROM nivel WHERE id=N_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Profesor` (`P_Id` BIGINT(20))  DELETE FROM profesor WHERE id=P_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Programa_A` (`PA_Id` BIGINT(20))  DELETE FROM programa_academico WHERE id=PA_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Semestre` (IN `S_ID` BIGINT(15))  DELETE FROM semestre WHERE id=S_ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Tipo_P` (`TP_ID` BIGINT(20))  DELETE FROM tipo WHERE id=TP_ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Unidad_A` (`UA_Id` BIGINT(20))  DELETE FROM unidad_aprendizaje WHERE id=UA_Id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Estado` (`E_Nombre` VARCHAR(255), `E_descripcion` VARCHAR(255))  INSERT INTO estado(nombre,descripcion) VALUES (E_Nombre,E_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Grupo` (`G_Nombre` VARCHAR(255), `G_descripcion` VARCHAR(255))  INSERT INTO grupo(nombre,descripcion) VALUES (G_Nombre,G_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Nivel` (`N_Nombre` VARCHAR(255), `N_descripcion` VARCHAR(255))  INSERT INTO nivel(nombre,descripcion) VALUES (N_Nombre,N_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Profesor` (`P_Nombre` VARCHAR(255), `P_descripcion` VARCHAR(255))  INSERT INTO profesor(nombre,descripcion) VALUES (P_Nombre,P_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Programa_A` (`PA_Nombre` VARCHAR(255), `PA_descripcion` VARCHAR(255))  INSERT INTO programa_academico(nombre,descripcion) VALUES (PA_Nombre,PA_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Semestre` (IN `S_nombre` INT(11), IN `S_descripcion` VARCHAR(45))  INSERT INTO semestre(nombre,descripcion) VALUES (S_nombre, S_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Tipo_P` (`TP_nombre` VARCHAR(255), `TP_descripcion` VARCHAR(255))  INSERT INTO tipo(nombre,descripcion) VALUES (TP_nombre, TP_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Unidad_A` (`UA_Nombre` INT(11), `UA_descripcion` VARCHAR(45))  INSERT INTO unidad_aprendizaje(nombre,descripcion) VALUES (PA_Nombre,PA_descripcion)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `usuario`, `clave`) VALUES
(1, 'Efrain Arredondo', 'efrain', 'efrain');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `vigencia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Programadas', ''),
(2, 'Relizadas', ''),
(3, 'Reprogramadas', ''),
(4, 'Canceladas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `id` bigint(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`, `descripcion`) VALUES
(2, '3AM2', 'Ambiental'),
(3, '1MM2', 'Ambiental'),
(4, '1CM2', 'Ambiental'),
(5, '2AM1', 'Ambiental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id` bigint(15) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicas`
--

CREATE TABLE `practicas` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `total_alumnos` int(11) NOT NULL,
  `total_profesores` int(11) NOT NULL,
  `objetivo` varchar(255) NOT NULL,
  `competencias` varchar(255) NOT NULL,
  `estrategia` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `presupuesto` float NOT NULL,
  `institucion` varchar(255) NOT NULL,
  `profesor_id` bigint(20) NOT NULL,
  `programa_academico_id` bigint(20) NOT NULL,
  `tipo_id` bigint(20) NOT NULL,
  `estatus_id` bigint(20) NOT NULL,
  `razon_social` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `practicas`
--

INSERT INTO `practicas` (`id`, `fecha`, `total_alumnos`, `total_profesores`, `objetivo`, `competencias`, `estrategia`, `numero`, `presupuesto`, `institucion`, `profesor_id`, `programa_academico_id`, `tipo_id`, `estatus_id`, `razon_social`) VALUES
(3, '2019-05-12', 87, 1, 'obJJJ', 'competencias', 'ESTRRRR', 151, 4763, 'IPN-UPIIZ', 3, 1, 1, 1, 'IPN-UPIIZ'),
(4, '2018-02-02', 100, 1, 'A', 'A', 'A', 10, 555155000, 'UTZAC', 4, 3, 2, 1, 'UTZAC'),
(5, '2018-02-05', 3, 1, 'b', 'h', 'h', 11, 619, 'hoa', 1, 1, 1, 4, 'hoa'),
(8, '0000-00-00', 0, 0, '', '', '', 443, 0, '', 0, 0, 0, 2, ''),
(9, '0000-00-00', 0, 0, '', '', '', 113, 0, '', 0, 0, 0, 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`, `descripcion`, `usuario`, `clave`) VALUES
(1, 'Efrain Arredondo', 'Tecnologias Web', 'efrain', 'efrain'),
(2, 'Sandra', 'POO', '', ''),
(3, 'Hector Cid', 'Software', '', ''),
(4, 'Roberto Cruz', 'Software', '', ''),
(5, 'Fernando Garcia', 'Software', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_academico`
--

CREATE TABLE `programa_academico` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id` bigint(15) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id`, `nombre`, `descripcion`) VALUES
(19, 2, '3CM3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_aprendizaje`
--

CREATE TABLE `unidad_aprendizaje` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad_aprendizaje`
--

INSERT INTO `unidad_aprendizaje` (`id`, `nombre`, `descripcion`) VALUES
(2, 4, 'Ingenieria de Software'),
(3, 5, 'Pattern Recognition'),
(4, 6, 'POO'),
(5, 7, 'Algoritmia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `usuarios` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `nombre`, `clave`, `usuarios`) VALUES
(4, 'alexishs', '$2y$10$6PfrBUv/9FF8XrMr1ShfOeWYC5zs3w9TWC9ohyaWCAb2csGnht8xS', 'Alexis Herrera'),
(5, 'zamdom', '$2y$10$NqXcNvA/56AJLcKW.TkUDOcm6ESdQhsjV2E3ZogNdtrcEpethEhmi', 'Hector Zamudio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `practicas`
--
ALTER TABLE `practicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programa_academico`
--
ALTER TABLE `programa_academico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_aprendizaje`
--
ALTER TABLE `unidad_aprendizaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fecha`
--
ALTER TABLE `fecha`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT de la tabla `practicas`
--
ALTER TABLE `practicas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `programa_academico`
--
ALTER TABLE `programa_academico`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidad_aprendizaje`
--
ALTER TABLE `unidad_aprendizaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
