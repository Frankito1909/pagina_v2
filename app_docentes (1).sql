-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 06:13:29
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
-- Base de datos: `app_docentes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `dni` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Thiago', 'Romero', 43563256),
(2, 'Franco', 'Veppo', 42593812);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_materias`
--

CREATE TABLE `alumnos_materias` (
  `id_alumn_mat` int(11) NOT NULL,
  `dni` int(10) NOT NULL,
  `codigo_materia` int(20) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  `nota_1` int(2) NOT NULL,
  `nota_2` int(2) NOT NULL,
  `nota_3` int(2) NOT NULL,
  `nota_4` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `id_asistencias` int(11) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  `codigo_materia` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `asistencia` int(1) NOT NULL,
  `fecha_asistencia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buscador`
--

CREATE TABLE `buscador` (
  `id_buscador` int(11) NOT NULL,
  `codigo_carrera` int(10) NOT NULL,
  `codigo_materia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id_carrera` int(11) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  `descripción` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_docente` int(11) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(20) NOT NULL,
  `codigo_materia` int(11) NOT NULL,
  `descripción` varchar(20) NOT NULL,
  `año` varchar(20) NOT NULL,
  `cursado` varchar(20) NOT NULL,
  `regimen` varchar(20) NOT NULL,
  `formato` varchar(20) NOT NULL,
  `id_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `alumnos_materias`
--
ALTER TABLE `alumnos_materias`
  ADD PRIMARY KEY (`id_alumn_mat`),
  ADD UNIQUE KEY `codigo_materia` (`codigo_materia`),
  ADD KEY `codigo_materia_2` (`codigo_materia`),
  ADD KEY `dni` (`dni`),
  ADD KEY `codigo_carrera` (`codigo_carrera`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id_asistencias`),
  ADD KEY `codigo_carrera` (`codigo_carrera`),
  ADD KEY `codigo_materia` (`codigo_materia`),
  ADD KEY `dni` (`dni`);

--
-- Indices de la tabla `buscador`
--
ALTER TABLE `buscador`
  ADD PRIMARY KEY (`id_buscador`),
  ADD UNIQUE KEY `codigo_materia_2` (`codigo_materia`),
  ADD KEY `codigo_materia` (`codigo_materia`),
  ADD KEY `codigo_carrera` (`codigo_carrera`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id_carrera`),
  ADD UNIQUE KEY `codigo_carrera` (`codigo_carrera`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD UNIQUE KEY `codigo_materia` (`codigo_materia`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `id_docente_2` (`id_docente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `alumnos_materias`
--
ALTER TABLE `alumnos_materias`
  MODIFY `id_alumn_mat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id_asistencias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `buscador`
--
ALTER TABLE `buscador`
  MODIFY `id_buscador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_materias`
--
ALTER TABLE `alumnos_materias`
  ADD CONSTRAINT `alumnos_materias_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumnos_materias_ibfk_2` FOREIGN KEY (`codigo_carrera`) REFERENCES `carreras` (`codigo_carrera`),
  ADD CONSTRAINT `alumnos_materias_ibfk_3` FOREIGN KEY (`codigo_materia`) REFERENCES `materias` (`codigo_materia`);

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_4` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`codigo_carrera`) REFERENCES `buscador` (`codigo_carrera`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`codigo_materia`) REFERENCES `buscador` (`codigo_materia`),
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
