-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jun 2015 um 13:41
-- Server Version: 5.6.20
-- PHP-Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `cars`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lengths`
--

DROP TABLE IF EXISTS `lengths`;
CREATE TABLE IF NOT EXISTS `lengths` (
`id_lengths` int(11) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `track_front` int(11) DEFAULT NULL,
  `track_rear` int(11) DEFAULT NULL,
  `wheelbase` int(11) DEFAULT NULL,
  `contact_area` float DEFAULT NULL,
  `track_mean` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `lengths`
--

INSERT INTO `lengths` (`id_lengths`, `length`, `width`, `height`, `track_front`, `track_rear`, `wheelbase`, `contact_area`, `track_mean`) VALUES
(1, 3968, 1795, 1326, 1446, 1428, 1437, 3.38, 1437),
(2, 4455, 1903, 1265, 1512, 1578, 2632, 4.067, 1545);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
`id_manufacturer` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `fk_id_model` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Daten für Tabelle `manufacturer`
--

INSERT INTO `manufacturer` (`id_manufacturer`, `name`, `fk_id_model`) VALUES
(1, 'Audi', 0),
(2, 'BMW', 0),
(3, 'Chevrolet', 0),
(4, 'Fiat', 0),
(5, 'Ford', 0),
(6, 'Jaguar', 0),
(7, 'Mazda', 0),
(8, 'Mercedes Benz', 0),
(9, 'Peugeot', 0),
(10, 'Renault', 0),
(11, 'Subaru', 0),
(12, 'Volvo', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `material_mix`
--

DROP TABLE IF EXISTS `material_mix`;
CREATE TABLE IF NOT EXISTS `material_mix` (
`id_material_mix` int(11) NOT NULL,
  `steel` float DEFAULT NULL,
  `aluminium` float DEFAULT NULL,
  `magnesium` float DEFAULT NULL,
  `other` float DEFAULT NULL,
  `thermoplastics` float DEFAULT NULL,
  `control` float DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `material_mix`
--

INSERT INTO `material_mix` (`id_material_mix`, `steel`, `aluminium`, `magnesium`, `other`, `thermoplastics`, `control`) VALUES
(1, 65, 33.8, 0, 1.2, 0, 100),
(2, 6, 22, 0, 12, 60, 100);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
`id_model` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `segment` varchar(45) DEFAULT NULL,
  `internaloem` varchar(45) DEFAULT NULL,
  `fk_id_weights` int(11) NOT NULL,
  `fk_id_production` int(11) NOT NULL,
  `fk_id_lengths` int(11) NOT NULL,
  `fk_id_material_mix` int(11) NOT NULL,
  `fk_id_parts` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Daten für Tabelle `model`
--

INSERT INTO `model` (`id_model`, `name`, `model_year`, `segment`, `internaloem`, `fk_id_weights`, `fk_id_production`, `fk_id_lengths`, `fk_id_material_mix`, `fk_id_parts`) VALUES
(1, 'TT', 2014, 'C', '8S', 1, 1, 1, 1, 1),
(2, 'i8', 2014, 'S', 'I12', 2, 2, 2, 2, 2),
(3, 'Corvette Z06', 2014, 'S', 'Y1AC Convertible', 0, 0, 0, 0, 0),
(4, 'Corvette Z06', 2014, 'S', 'Y1BC', 0, 0, 0, 0, 0),
(5, '500X', 2014, 'B', '334', 0, 0, 0, 0, 0),
(6, 'Mustang', 2015, 'S', 'S550', 0, 0, 0, 0, 0),
(7, 'F Type Coupé', 2014, 'S', 'X152 Coupe', 0, 0, 0, 0, 0),
(8, '2', 2014, 'B', NULL, 0, 0, 0, 0, 0),
(9, 'C-Class', 2014, 'D', 'W205', 0, 0, 0, 0, 0),
(10, '308', 2014, 'C', 'T91', 0, 0, 0, 0, 0),
(11, 'Twingo', 2014, 'A', 'R4S', 0, 0, 0, 0, 0),
(12, 'WRX', 2014, 'C', NULL, 0, 0, 0, 0, 0),
(13, 'XC 90', 2015, 'J', NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parts`
--

DROP TABLE IF EXISTS `parts`;
CREATE TABLE IF NOT EXISTS `parts` (
`id` int(11) NOT NULL,
  `no_parts` int(11) DEFAULT NULL,
  `parts100g` int(11) DEFAULT NULL,
  `parts1kg` int(11) DEFAULT NULL,
  `parts5kg` int(11) DEFAULT NULL,
  `parts_more5kg` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `parts`
--

INSERT INTO `parts` (`id`, `no_parts`, `parts100g`, `parts1kg`, `parts5kg`, `parts_more5kg`) VALUES
(1, 304, NULL, NULL, NULL, NULL),
(2, 131, 28, 76, 18, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE IF NOT EXISTS `production` (
`id_production` int(11) NOT NULL,
  `process_stability` float DEFAULT NULL,
  `re_use_factor` float DEFAULT NULL,
  `mechanisation` float DEFAULT NULL,
  `intended_production_vol` int(11) DEFAULT NULL,
  `production_lead_time` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `production`
--

INSERT INTO `production` (`id_production`, `process_stability`, `re_use_factor`, `mechanisation`, `intended_production_vol`, `production_lead_time`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 0, 99, 8000, 700);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weights`
--

DROP TABLE IF EXISTS `weights`;
CREATE TABLE IF NOT EXISTS `weights` (
`id_weights` int(11) NOT NULL,
  `biw` float DEFAULT NULL,
  `front_doors` float DEFAULT NULL,
  `rear_doors` float DEFAULT NULL,
  `hood` float DEFAULT NULL,
  `tailgate` float DEFAULT NULL,
  `front_fenders` float DEFAULT NULL,
  `hinges` float DEFAULT NULL,
  `fuelflap` float DEFAULT NULL,
  `frontend` float DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `weights`
--

INSERT INTO `weights` (`id_weights`, `biw`, `front_doors`, `rear_doors`, `hood`, `tailgate`, `front_fenders`, `hinges`, `fuelflap`, `frontend`, `total`) VALUES
(1, 259, 20.6, NULL, 9.7, 10, 1.6, 8.6, 0, NULL, 209),
(2, 260.2, 18.048, NULL, 7.05, 2.3, 5.6, 6.298, 0, 7.708, 229.4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lengths`
--
ALTER TABLE `lengths`
 ADD PRIMARY KEY (`id_lengths`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
 ADD PRIMARY KEY (`id_manufacturer`,`fk_id_model`), ADD KEY `fk_manufacturer_model_idx` (`fk_id_model`);

--
-- Indexes for table `material_mix`
--
ALTER TABLE `material_mix`
 ADD PRIMARY KEY (`id_material_mix`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
 ADD PRIMARY KEY (`id_model`), ADD KEY `fk_model_weights1_idx` (`fk_id_weights`), ADD KEY `fk_model_production1_idx` (`fk_id_production`), ADD KEY `fk_model_lengths1_idx` (`fk_id_lengths`), ADD KEY `fk_model_material_mix1_idx` (`fk_id_material_mix`), ADD KEY `fk_model_parts1_idx` (`fk_id_parts`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
 ADD PRIMARY KEY (`id_production`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
 ADD PRIMARY KEY (`id_weights`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lengths`
--
ALTER TABLE `lengths`
MODIFY `id_lengths` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
MODIFY `id_manufacturer` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `material_mix`
--
ALTER TABLE `material_mix`
MODIFY `id_material_mix` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
MODIFY `id_production` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
MODIFY `id_weights` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
ADD CONSTRAINT `fk_manufacturer_model` FOREIGN KEY (`fk_id_model`) REFERENCES `model` (`id_model`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `model`
--
ALTER TABLE `model`
ADD CONSTRAINT `fk_model_lengths1` FOREIGN KEY (`fk_id_lengths`) REFERENCES `lengths` (`id_lengths`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_model_material_mix1` FOREIGN KEY (`fk_id_material_mix`) REFERENCES `material_mix` (`id_material_mix`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_model_parts1` FOREIGN KEY (`fk_id_parts`) REFERENCES `parts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_model_production1` FOREIGN KEY (`fk_id_production`) REFERENCES `production` (`id_production`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_model_weights1` FOREIGN KEY (`fk_id_weights`) REFERENCES `weights` (`id_weights`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
