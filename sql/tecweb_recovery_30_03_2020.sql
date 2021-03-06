-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2020 a las 02:15:10
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

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`, `descripcion`) VALUES
(2, '', ''),
(3, 'Puebla', 'Oeste'),
(5, 'Coahuila', 'Oeste'),
(7, '', ''),
(11, '', ''),
(13, '', ''),
(14, '', ''),
(15, '', ''),
(16, '', ''),
(17, 'hhh', 'hhh'),
(18, 'Zairo', 'Coronavirus'),
(19, '\'', '\''),
(20, 'ZAC', 'ZAC');

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

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id`, `nombre`, `descripcion`) VALUES
(2, 0, 'nn'),
(3, 0, 'k'),
(4, 0, '\''),
(5, 0, '\''),
(6, 0, '\''),
(7, 1160, '\''),
(8, 0, '\''),
(9, 0, '\''),
(10, 0, '\''),
(11, 0, '\''),
(12, 0, '\''),
(13, 0, '\''),
(14, 0, '\''),
(15, 0, '\''),
(16, 0, '\''),
(17, 0, '\''),
(18, 0, '\''),
(19, 0, '\''),
(20, 0, '\''),
(21, 0, '\''),
(22, 0, '\''),
(23, 0, '\''),
(24, 0, '\''),
(25, 0, '\''),
(26, 0, '\''),
(27, 0, '\''),
(28, 0, '\''),
(29, 0, '\''),
(30, 0, '\''),
(31, 0, '\''),
(32, 0, '\''),
(33, 0, '\''),
(34, 0, '\''),
(35, 0, '\''),
(36, 0, '\''),
(37, 0, '\''),
(38, 0, '\''),
(39, 0, '\''),
(40, 0, '\''),
(41, 0, '\''),
(42, 0, '\''),
(43, 0, '\''),
(44, 0, '\''),
(45, 0, '\''),
(46, 0, '\''),
(47, 0, '\''),
(48, 0, '\''),
(49, 0, '\''),
(50, 0, '\''),
(51, 0, '\''),
(52, 0, '\''),
(53, 0, '1520'),
(54, 0, '\') AND 8351=1754 AND (4536=4536'),
(55, 0, '\') AND 1094=1094 AND (7229=7229'),
(56, 0, '\') AND 5991=7168 AND (5753=5753'),
(57, 0, '\' AND 1898=9803'),
(58, 0, '\' AND 1094=1094'),
(59, 0, '\' AND 8050=2727'),
(60, 0, '0'),
(61, 0, '0'),
(62, 0, '0'),
(63, 0, '\' AND 7312=2714-- XRpM'),
(64, 0, '\' AND 1094=1094-- oDnz'),
(65, 0, '\' AND 4455=8404-- pvOj'),
(66, 0, '(SELECT (CASE WHEN (4669=8475) THEN 0x2727 EL'),
(67, 0, '(SELECT (CASE WHEN (2373=2373) THEN 0x2727 EL'),
(68, 0, '(SELECT (CASE WHEN (6827=9451) THEN 0x2727 EL'),
(69, 0, '(SELECT CONCAT(CONCAT(0x716a7a7a71,(CASE WHEN'),
(70, 0, '\') ORDER BY 1-- -'),
(71, 0, '\') ORDER BY 3029-- -'),
(72, 0, '\' ORDER BY 1-- -'),
(73, 0, '\' ORDER BY 9278-- -'),
(74, 0, '\''),
(75, 0, '\''),
(76, 0, '\' ORDER BY 1-- -'),
(77, 0, '\' ORDER BY 1698-- -'),
(78, 0, '\''),
(79, 0, '\''),
(80, 0, '\''),
(81, 0, '\''),
(82, 0, '\''),
(83, 0, '\''),
(84, 0, '\''),
(85, 0, '\''),
(86, 0, '\''),
(87, 0, '\''),
(88, 0, '\''),
(89, 0, '\''),
(90, 0, '\''),
(91, 0, '\''),
(92, 0, '\''),
(93, 0, '\''),
(94, 0, '\''),
(95, 0, '\''),
(96, 0, '\''),
(97, 0, '\''),
(98, 0, '\''),
(99, 0, '\''),
(100, 0, '\''),
(101, 0, '\''),
(102, 0, '\''),
(103, 0, '\''),
(104, 0, '\''),
(105, 0, '\''),
(106, 0, '\''),
(107, 0, '\''),
(108, 0, '\''),
(109, 0, '\''),
(110, 0, '\''),
(111, 0, '\''),
(112, 0, '\''),
(113, 0, '\''),
(114, 0, '\''),
(115, 0, '\''),
(116, 0, '\''),
(117, 0, '\''),
(118, 0, '\''),
(119, 0, '\''),
(120, 0, '\''),
(121, 0, '\''),
(122, 0, '\''),
(123, 0, '\''),
(124, 0, '\''),
(125, 0, '\''),
(126, 0, '\''),
(127, 0, '\''),
(128, 0, '\''),
(129, 0, '\''),
(130, 0, '\''),
(131, 0, '\''),
(132, 0, '\''),
(133, 0, '\''),
(134, 0, '\''),
(135, 0, '\''),
(136, 0, '\''),
(137, 0, '\''),
(138, 0, '\''),
(139, 0, '\''),
(140, 0, '\''),
(141, 0, '\''),
(142, 0, '\''),
(143, 0, '\''),
(144, 0, '\''),
(145, 0, '\''),
(146, 0, '\''),
(147, 0, '\''),
(148, 0, '\''),
(149, 0, '\''),
(150, 0, '\''),
(151, 0, '\''),
(152, 0, '\''),
(153, 0, '\''),
(154, 0, '\''),
(155, 0, '\''),
(156, 0, '\''),
(157, 0, '\''),
(158, 0, '\''),
(159, 0, '\''),
(160, 0, '\''),
(161, 0, '\''),
(162, 0, '\''),
(163, 0, '\''),
(164, 0, '\''),
(165, 0, '\''),
(166, 0, '\''),
(167, 0, '\''),
(168, 0, '\''),
(169, 0, '\''),
(170, 0, '\''),
(171, 0, '\''),
(172, 0, '\''),
(173, 0, '\''),
(174, 0, '\''),
(175, 0, '\''),
(176, 0, '\''),
(177, 0, '\''),
(178, 0, '\''),
(179, 0, '\''),
(180, 0, '\''),
(181, 0, '\''),
(182, 0, '\''),
(183, 0, '\''),
(184, 0, '\''),
(185, 0, '\''),
(186, 0, '\''),
(187, 0, '\''),
(188, 0, '\''),
(189, 0, '\''),
(190, 0, '\''),
(191, 0, '\''),
(192, 0, '\''),
(193, 0, '\''),
(194, 0, '\''),
(195, 0, '\''),
(196, 0, '\''),
(197, 0, '\''),
(198, 0, '\''),
(199, 0, '\''),
(200, 0, '\''),
(201, 0, '\''),
(202, 0, '\''),
(203, 0, '\''),
(204, 0, '\''),
(205, 0, '\''),
(206, 0, '\''),
(207, 0, '\''),
(208, 0, '\''),
(209, 0, '\''),
(210, 0, '\''),
(211, 0, '\''),
(212, 0, '\''),
(213, 0, '\''),
(214, 0, '\''),
(215, 0, '\''),
(216, 0, '\''),
(217, 0, '\''),
(218, 0, '\''),
(219, 0, '\''),
(220, 0, '\''),
(221, 0, '\''),
(222, 0, '\''),
(223, 0, '\''),
(224, 0, '\''),
(225, 0, '\''),
(226, 0, '\''),
(227, 0, '\''),
(228, 0, '\''),
(229, 0, '\''),
(230, 0, '\''),
(231, 0, '\''),
(232, 0, '\''),
(233, 0, '\''),
(234, 0, '\''),
(235, 0, '\''),
(236, 0, '\''),
(237, 0, '\''),
(238, 0, '\''),
(239, 0, '\''),
(240, 0, '\''),
(241, 0, '\''),
(242, 0, '\''),
(243, 0, '\''),
(244, 0, '\''),
(245, 0, '\''),
(246, 0, '\''),
(247, 0, '\''),
(248, 0, '\''),
(249, 0, '\''),
(250, 0, '\''),
(251, 0, '\''),
(252, 0, '\''),
(253, 0, '\''),
(254, 0, '\''),
(255, 0, '\''),
(256, 0, '\''),
(257, 0, '\''),
(258, 0, '\''),
(259, 0, '\''),
(260, 0, '\''),
(261, 0, '\''),
(262, 0, '\''),
(263, 0, '\''),
(264, 0, '\''),
(265, 0, '\''),
(266, 0, '\''),
(267, 0, '\''),
(268, 0, '\''),
(269, 0, '\''),
(270, 0, '\''),
(271, 0, '\''),
(272, 0, '\''),
(273, 0, '\''),
(274, 0, '\''),
(275, 0, '\''),
(276, 0, '\''),
(277, 0, '\''),
(278, 0, '\''),
(279, 0, '\''),
(280, 0, '\''),
(281, 0, '\''),
(282, 0, '\''),
(283, 0, '\''),
(284, 0, '\''),
(285, 0, '\''),
(286, 0, '\''),
(287, 0, '\''),
(288, 0, '\''),
(289, 0, '\'');

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

--
-- Volcado de datos para la tabla `programa_academico`
--

INSERT INTO `programa_academico` (`id`, `nombre`, `descripcion`) VALUES
(2, 'Ambiental', 'Ingenieria'),
(3, 'Alimentos', 'Ingenieria'),
(4, 'Mecatronica', 'Ingenieria'),
(5, 'Metalurgica', 'Ingenieria'),
(7, '\'', '\''),
(8, '\'', '\''),
(9, '8220', '\''),
(11, '\') AND 6358=6358 AND (4451=4451', '\''),
(12, '\') AND 8655=5729 AND (6046=6046', '\''),
(13, '\' AND 5509=2264', '\''),
(14, '\' AND 6358=6358', '\''),
(15, '\' AND 9434=8432', '\''),
(16, '0', '\''),
(17, '0', '\''),
(18, '0', '\''),
(19, '\' AND 5098=4080-- CvQV', '\''),
(20, '\' AND 6358=6358-- ekam', '\''),
(21, '\' AND 9057=6665-- AWYv', '\''),
(22, '(SELECT (CASE WHEN (1045=5743) THEN \'\' ELSE (SELECT 5743 UNION SELECT 6520) END))', '\''),
(23, '(SELECT (CASE WHEN (5413=5413) THEN \'\' ELSE (SELECT 6520 UNION SELECT 3528) END))', '\''),
(24, '(SELECT (CASE WHEN (1496=2080) THEN \'\' ELSE (SELECT 2080 UNION SELECT 4562) END))', '\''),
(25, '\') AND (SELECT 9299 FROM(SELECT COUNT(*),CONCAT(0x71767a7171,(SELECT (ELT(9299=9299,1))),0x716b7a7871,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a) AND (7281=7281', '\''),
(26, '\' AND (SELECT 9299 FROM(SELECT COUNT(*),CONCAT(0x71767a7171,(SELECT (ELT(9299=9299,1))),0x716b7a7871,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a)', '\''),
(27, '0', '\''),
(28, '\' AND (SELECT 9299 FROM(SELECT COUNT(*),CONCAT(0x71767a7171,(SELECT (ELT(9299=9299,1))),0x716b7a7871,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a)-- SXsx', '\''),
(29, '\') AND 3798=CAST((CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113))||(SELECT (CASE WHEN (3798=3798) THEN 1 ELSE 0 END))::text||(CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)) AS NUMERIC) AND (2331=2331', '\''),
(30, '\' AND 3798=CAST((CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113))||(SELECT (CASE WHEN (3798=3798) THEN 1 ELSE 0 END))::text||(CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)) AS NUMERIC)', '\''),
(31, '\' AND 3798=CAST((CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113))||(SELECT (CASE WHEN (3798=3798) THEN 1 ELSE 0 END))::text||(CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)) AS NUMERIC)-- UJOG', '\''),
(32, '\') AND 2556 IN (SELECT (CHAR(113)+CHAR(118)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT (CASE WHEN (2556=2556) THEN CHAR(49) ELSE CHAR(48) END))+CHAR(113)+CHAR(107)+CHAR(122)+CHAR(120)+CHAR(113))) AND (5430=5430', '\''),
(33, '\' AND 2556 IN (SELECT (CHAR(113)+CHAR(118)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT (CASE WHEN (2556=2556) THEN CHAR(49) ELSE CHAR(48) END))+CHAR(113)+CHAR(107)+CHAR(122)+CHAR(120)+CHAR(113)))', '\''),
(34, '0', '\''),
(35, '\' AND 2556 IN (SELECT (CHAR(113)+CHAR(118)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT (CASE WHEN (2556=2556) THEN CHAR(49) ELSE CHAR(48) END))+CHAR(113)+CHAR(107)+CHAR(122)+CHAR(120)+CHAR(113)))-- kmEe', '\''),
(36, '\') AND 3323=(SELECT UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113)||(SELECT (CASE WHEN (3323=3323) THEN 1 ELSE 0 END) FROM DUAL)||CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)||CHR(62))) FROM DUAL) AND (3183=3183', '\''),
(37, '\' AND 3323=(SELECT UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113)||(SELECT (CASE WHEN (3323=3323) THEN 1 ELSE 0 END) FROM DUAL)||CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)||CHR(62))) FROM DUAL)', '\''),
(38, '\' AND 3323=(SELECT UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113)||(SELECT (CASE WHEN (3323=3323) THEN 1 ELSE 0 END) FROM DUAL)||CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)||CHR(62))) FROM DUAL)-- JDwA', '\''),
(39, '(SELECT 6574 FROM(SELECT COUNT(*),CONCAT(0x71767a7171,(SELECT (ELT(6574=6574,1))),0x716b7a7871,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a)', '\''),
(40, '(SELECT CONCAT(0x71767a7171,(SELECT (ELT(2860=2860,1))),0x716b7a7871))', '\''),
(41, '(SELECT (CHR(113)||CHR(118)||CHR(122)||CHR(113)||CHR(113))||(SELECT (CASE WHEN (9010=9010) THEN 1 ELSE 0 END))::text||(CHR(113)||CHR(107)||CHR(122)||CHR(120)||CHR(113)))', '\''),
(42, '(SELECT CHAR(113)+CHAR(118)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT (CASE WHEN (2546=2546) THEN CHAR(49) ELSE CHAR(48) END))+CHAR(113)+CHAR(107)+CHAR(122)+CHAR(120)+CHAR(113))', '\''),
(43, '\');SELECT PG_SLEEP(5)--', '\''),
(44, '\';SELECT PG_SLEEP(5)--', '\''),
(45, '\');SELECT DBMS_PIPE.RECEIVE_MESSAGE(CHR(69)||CHR(114)||CHR(106)||CHR(106),5) FROM DUAL--', '\''),
(46, '\';SELECT DBMS_PIPE.RECEIVE_MESSAGE(CHR(69)||CHR(114)||CHR(106)||CHR(106),5) FROM DUAL--', '\''),
(47, '\') AND (SELECT 1363 FROM (SELECT(SLEEP(5)))Pjwt) AND (2535=2535', '\''),
(48, '\' AND (SELECT 1363 FROM (SELECT(SLEEP(5)))Pjwt)', '\''),
(49, '0', '\''),
(50, '0', '\''),
(51, '0', '\''),
(52, '0', '\''),
(53, '0', '\''),
(54, '0', '\''),
(55, '0', '\''),
(56, '0', '\''),
(57, '0', '\''),
(58, '0', '\''),
(59, '0', '\''),
(60, '0', '\''),
(61, '0', '\''),
(62, '0', '\''),
(63, '0', '\''),
(64, '0', '\''),
(65, '0', '\''),
(66, '0', '\''),
(67, '0', '\''),
(68, '0', '\''),
(69, '0', '\''),
(70, '0', '\''),
(71, '0', '\''),
(72, '0', '\''),
(73, '0', '\''),
(74, '0', '\''),
(75, '0', '\''),
(76, '0', '\''),
(77, '0', '\''),
(78, '0', '\''),
(79, '0', '\''),
(80, '0', '\''),
(81, '0', '\''),
(82, '0', '\''),
(83, '0', '\''),
(84, '0', '\''),
(85, '0', '\''),
(86, '0', '\''),
(87, '0', '\''),
(88, '0', '\''),
(89, '0', '\''),
(90, '0', '\''),
(91, '0', '\''),
(92, '0', '\''),
(93, '0', '\''),
(94, '0', '\''),
(95, '0', '\''),
(96, '0', '\''),
(97, '0', '\''),
(98, '0', '\''),
(99, '0', '\''),
(100, '0', '\''),
(101, '0', '\''),
(102, '0', '\''),
(103, '0', '\''),
(104, '0', '\''),
(105, '0', '\''),
(106, '0', '\''),
(107, '0', '\''),
(108, '0', '\''),
(109, '0', '\''),
(110, '0', '\''),
(111, '0', '\''),
(112, '0', '\''),
(113, '0', '\''),
(114, '0', '\''),
(115, '0', '\''),
(116, '0', '\''),
(117, '0', '\''),
(118, '0', '\''),
(119, '0', '\''),
(120, '0', '\''),
(121, '0', '\''),
(122, '0', '\''),
(123, '0', '\''),
(124, '0', '\''),
(125, '0', '\''),
(126, '0', '\''),
(127, '0', '\''),
(128, '0', '\''),
(129, '0', '\''),
(130, '0', '\''),
(131, '0', '\''),
(132, '0', '\''),
(133, '0', '\''),
(134, '0', '\''),
(135, '0', '\''),
(136, '0', '\''),
(137, '0', '\''),
(138, '0', '\''),
(139, '0', '\''),
(140, '0', '\''),
(141, '0', '\''),
(142, '0', '\''),
(143, '0', '\''),
(144, '0', '\''),
(145, '0', '\''),
(146, '0', '\''),
(147, '0', '\''),
(148, '0', '\''),
(149, '0', '\''),
(150, '0', '\''),
(151, '0', '\''),
(152, '0', '\''),
(153, '0', '\''),
(154, '0', '\''),
(155, '0', '\''),
(156, '0', '\''),
(157, '0', '\''),
(158, '0', '\''),
(159, '0', '\''),
(160, '0', '\''),
(161, '0', '\''),
(162, '0', '\''),
(163, '0', '\''),
(164, '0', '\''),
(165, '0', '\''),
(166, '0', '\''),
(167, '0', '\''),
(168, '0', '\''),
(169, '0', '\''),
(170, '0', '\''),
(171, '0', '\''),
(172, '0', '\''),
(173, '0', '\''),
(174, '0', '\''),
(175, '0', '\''),
(176, '0', '\''),
(177, '0', '\''),
(178, '0', '\''),
(179, '0', '\''),
(180, '0', '\''),
(181, '0', '\''),
(182, '0', '\''),
(183, '0', '\''),
(184, '0', '\''),
(185, '0', '\''),
(186, '0', '\''),
(187, '0', '\''),
(188, '0', '\''),
(189, '0', '\''),
(190, '0', '\''),
(191, '0', '\''),
(192, '0', '\''),
(193, '0', '\''),
(194, '0', '\''),
(195, '0', '\''),
(196, '0', '\''),
(197, '0', '\''),
(198, '0', '\''),
(199, '0', '\''),
(200, '0', '\''),
(201, '0', '\''),
(202, '0', '\''),
(203, '0', '\''),
(204, '0', '\''),
(205, '0', '\''),
(206, '\'', '\''),
(207, '\'', '\''),
(208, '\'', '\''),
(209, '\'', '\''),
(210, '\'', '\''),
(211, '\'', '\''),
(212, '\'', '\''),
(213, '\'', '\''),
(214, '\'', '\''),
(215, '\'', '\''),
(216, '\'', '\''),
(217, '\'', '\''),
(218, '\'', '\''),
(219, '\'', '\''),
(220, '\'', '\''),
(221, '\'', '\''),
(222, '\'', '\''),
(223, '\'', '\''),
(224, '\'', '\''),
(225, '\'', '\''),
(226, '\'', '\''),
(227, '\'', '\''),
(228, '\'', '\''),
(229, '\'', '\''),
(230, '\'', '\''),
(231, '\'', '\''),
(232, '\'', '\''),
(233, '\'', '\''),
(234, '\'', '\''),
(235, '\'', '\''),
(236, '\'', '\''),
(237, '0', '\''),
(238, '0', '\''),
(239, '0', '\''),
(240, '0', '\''),
(241, '0', '\''),
(242, '0', '\''),
(243, '0', '\''),
(244, '0', '\''),
(245, '0', '\''),
(246, '0', '\''),
(247, '0', '\''),
(248, '0', '\''),
(249, '0', '\''),
(250, '0', '\''),
(251, '0', '\''),
(252, '0', '\''),
(253, '0', '\''),
(254, '0', '\''),
(255, '0', '\''),
(256, '0', '\''),
(257, '0', '\''),
(258, '0', '\''),
(259, '0', '\''),
(260, '0', '\''),
(261, '0', '\''),
(262, '0', '\''),
(263, '0', '\''),
(264, '0', '\''),
(265, '0', '\''),
(266, '0', '\''),
(267, '0', '\''),
(268, '0', '\''),
(269, '0', '\''),
(270, '0', '\''),
(271, '0', '\''),
(272, '0', '\''),
(273, '0', '\''),
(274, '0', '\''),
(275, '0', '\''),
(276, '0', '\''),
(277, '0', '\''),
(278, '0', '\''),
(279, '0', '\''),
(280, '0', '\''),
(281, '0', '\''),
(282, '0', '\''),
(283, '0', '\''),
(284, '0', '\''),
(285, '0', '\''),
(286, '0', '\''),
(287, '0', '\''),
(288, '0', '\''),
(289, '0', '\''),
(290, '0', '\''),
(291, '0', '\''),
(292, '\'', '\'');

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

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`, `descripcion`) VALUES
(1, 'aa', 'aa'),
(2, 'Otra', 'b'),
(3, '', ''),
(5, 'n', 'n');

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
(1, 'qq', '$2y$10$5FfTtFGf1HBT24AjeVIMZ.56wjCff2Rg1oaQj22VLBjl7KmO4.Y56', 'qq'),
(2, 'aa', '$2y$10$F5lHKVauZ3PYzIONDD2dY.70nX5fokpGrk6A2fNEGJRBMx78hpQPO', 'aa'),
(3, '', '$2y$10$5QP/jPXgikSgQLefMFgH5ebsql0zfavTIckIx6lP48H1R6ot7nXKW', ''),
(4, 'alexishs', '$2y$10$6PfrBUv/9FF8XrMr1ShfOeWYC5zs3w9TWC9ohyaWCAb2csGnht8xS', 'Alexis Herrera'),
(5, 'zamdom', '$2y$10$NqXcNvA/56AJLcKW.TkUDOcm6ESdQhsjV2E3ZogNdtrcEpethEhmi', 'Hector Zamudio'),
(6, 'zam', '$2y$10$1.KMTGwocneHPRm2MyyIyuXZYd9Hjf.3DnWqtlKONbyRP8d16NIci', 'Hector Zam');

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
