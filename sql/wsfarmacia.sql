-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2014 a las 21:04:17
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `wsfarmacia`
--
DROP DATABASE IF EXISTS `wsfarmacia`;
CREATE DATABASE IF NOT EXISTS `wsfarmacia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wsfarmacia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `texto` varchar(256) NOT NULL,
  `imagen` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `texto`, `imagen`) VALUES
(1, 'Pediatría', 'Productos para niños de 0 a 3 años', 'pediatria.png'),
(2, 'Higiene', 'Productos para la higiene corporal.', 'higiene.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmedicamento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `idmedicamento`, `cantidad`, `fechahora`) VALUES
(1, 1, 30, '2015-01-01 16:18:16'),
(2, 2, 50, '2015-02-04 12:28:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacias`
--

CREATE TABLE IF NOT EXISTS `farmacias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `farmacias`
--

INSERT INTO `farmacias` (`id`, `nik`, `pass`, `nivel`) VALUES
(1, 'Milano', 'milano01', 0),
(2, 'mascport', 'mascport', 255);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE IF NOT EXISTS `medicamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `texto` varchar(256) NOT NULL,
  `imagen` varchar(64) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `codigo` varchar(32) NOT NULL,
  `enalmacen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `idcategoria`, `texto`, `imagen`, `nombre`, `codigo`, `enalmacen`) VALUES
(1, 1, 'Antihistamínico con actividad antagonista selectiva sobre los receptores H1 periféricos.', 'allegra-r-pediatrico.png', 'Allegra ® pediátrico', '000001', 22),
(2, 2, 'Champú para el tratamiento de infecciones parasitarias por piojos.', 'filvit-champu-200.png', 'Filvit champú 200 ml', '000002', 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(256) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `texto`, `inicio`, `fin`) VALUES
(1, 'Soy una noticia que va del 16 al 25', '2014-11-16', '2014-11-25'),
(2, 'Soy una noticia que va del 23 al 29', '2014-11-23', '2014-11-29'),
(3, 'Exemple noticia que va del 8 al 25 de febrer', '2015-02-08', '2015-02-25'),
(4, 'Estimats clients, hem pujat els preus un 10%. Gràcies per la seva confiança.', '2015-02-10', '2015-03-10'),
(5, 'Hem retirat tres medicaments degut al descobriment de nous efectes secundaris', '2015-02-08', '2015-02-25'),
(6, 'Distribuidora Viruela anuncia la compra de la cadena de farmacies Pneumònia', '2015-02-08', '2015-05-25'),
(7, 'Anunciam canvis en el tractament de dades. Vendrem a Facebook totes les dades que recopilam sobre vosté. Gràcies per la confiança.', '2015-02-08', '2015-02-25'),
(8, 'Informació als responsables de magatzem: Per favor, no pujar fotografies de categorias o medicaments inadequades', '2015-02-08', '2015-02-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE IF NOT EXISTS `salidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmedicamento` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idfarmacia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `idmedicamento`, `fechahora`, `cantidad`, `idfarmacia`) VALUES
(1, 1, '2015-01-04 10:20:40', 3, 1),
(2, 2, '2015-01-05 18:04:12', 4, 1),
(3, 1, '2015-02-06 14:10:04', 5, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
