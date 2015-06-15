-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jun 2015 um 23:47
-- Server-Version: 5.6.24
-- PHP-Version: 5.6.8

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
  `track_mean` int(11) DEFAULT NULL,
  `wheelbase` int(11) DEFAULT NULL,
  `contact_area` float DEFAULT NULL,
  `fk_model` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `lengths`
--

INSERT INTO `lengths` (`length`, `width`, `height`, `track_front`, `track_rear`, `track_mean`, `wheelbase`, `contact_area`, `fk_model`) VALUES
(3968, 1795, 1326, 1446, 1428, 1437, 1437, 3.38, 0),
(4455, 1903, 1265, 1512, 1578, 1545, 2632, 4.067, 0);

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
  `control` float DEFAULT NULL,
  `fk_model` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `material_mix`
--

INSERT INTO `material_mix` (`steel`, `aluminium`, `magnesium`, `other`, `thermoplastics`, `control`, `fk_model`) VALUES
(65, 33.8, 0, 1.2, 0, 100, 0),
(6, 22, 0, 12, 60, 100, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `id_model` int(11) NOT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `segment` varchar(45) DEFAULT NULL,
  `internaloem` varchar(45) DEFAULT NULL,
  `fk_weights` int(11) NOT NULL,
  `fk_production` int(11) NOT NULL,
  `fk_parts` int(11) NOT NULL,
  `fk_lengths` int(11) NOT NULL,
  `fd_material_mix` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `model`
--

INSERT INTO `model` (`manufacturer`, `name`, `model_year`, `segment`, `internaloem`, `fk_weights`, `fk_production`, `fk_parts`, `fk_lengths`, `fd_material_mix`) VALUES
('Audi', 'TT', 2014, 'C', '8S', 0, 0, 0, 0, 0),
('BMW', 'i8', 2014, 'S', 'I12', 0, 0, 0, 0, 0),
('Chevrolet', 'Corvette Z06', 2014, 'S', 'Y1AC Convertible', 0, 0, 0, 0, 0),
('Chevrolet', 'Corvette Z06', 2014, 'S', 'Y1BC', 0, 0, 0, 0, 0),
('Fiat', '500X', 2014, 'B', '334', 0, 0, 0, 0, 0),
('Ford', 'Mustang', 2015, 'S', 'S550', 0, 0, 0, 0, 0),
('Jaguar', 'F Type Coupé', 2014, 'S', 'X152 Coupe', 0, 0, 0, 0, 0),
('Mazda', '2', 2014, 'B', NULL, 0, 0, 0, 0, 0),
('Mercedes Benz', 'C-Class', 2014, 'D', 'W205', 0, 0, 0, 0, 0),
('Peugeot', '308', 2014, 'C', 'T91', 0, 0, 0, 0, 0),
('Renault', 'Twingo', 2014, 'A', 'R4S', 0, 0, 0, 0, 0),
('Subaru', 'WRX', 2014, 'C', NULL, 0, 0, 0, 0, 0),
('Volvo', 'XC 90', 2015, 'J', NULL, 0, 0, 0, 0, 0);

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
  `parts_more5kg` int(11) DEFAULT NULL,
  `model_id_model` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `parts`
--

INSERT INTO `parts` (`no_parts`, `parts100g`, `parts1kg`, `parts5kg`, `parts_more5kg`, `model_id_model`) VALUES
(304, NULL, NULL, NULL, NULL, 0),
(131, 28, 76, 18, 9, 0);

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
  `production_lead_time` int(11) DEFAULT NULL,
  `model_id_model` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `production`
--

INSERT INTO `production` (`process_stability`, `re_use_factor`, `mechanisation`, `intended_production_vol`, `production_lead_time`, `model_id_model`) VALUES
(NULL, NULL, NULL, NULL, NULL, 0),
(NULL, 0, 99, 8000, 700, 0);

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
  `total` float DEFAULT NULL,
  `model_id_model` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `weights`
--

INSERT INTO `weights` (`biw`, `front_doors`, `rear_doors`, `hood`, `tailgate`, `front_fenders`, `hinges`, `fuelflap`, `frontend`, `total`, `model_id_model`) VALUES
(259, 20.6, NULL, 9.7, 10, 1.6, 8.6, 0, NULL, 209, 0),
(260.2, 18.048, NULL, 7.05, 2.3, 5.6, 6.298, 0, 7.708, 229.4, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `lengths`
--
ALTER TABLE `lengths`
  ADD PRIMARY KEY (`id_lengths`), ADD KEY `fk_lengths_model1_idx` (`fk_model`);

--
-- Indizes für die Tabelle `material_mix`
--
ALTER TABLE `material_mix`
  ADD PRIMARY KEY (`id_material_mix`), ADD KEY `fk_material_mix_model1_idx` (`fk_model`);

--
-- Indizes für die Tabelle `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id_model`), ADD KEY `fk_model_weights_idx` (`fk_weights`), ADD KEY `fk_model_production1_idx` (`fk_production`), ADD KEY `fk_model_parts1_idx` (`fk_parts`), ADD KEY `fk_model_lengths1_idx` (`fk_lengths`), ADD KEY `fk_model_material_mix1_idx` (`fd_material_mix`);

--
-- Indizes für die Tabelle `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_parts_model1_idx` (`model_id_model`);

--
-- Indizes für die Tabelle `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id_production`), ADD KEY `fk_production_model1_idx` (`model_id_model`);

--
-- Indizes für die Tabelle `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id_weights`), ADD KEY `fk_weights_model1_idx` (`model_id_model`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `lengths`
--
ALTER TABLE `lengths`
  MODIFY `id_lengths` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `material_mix`
--
ALTER TABLE `material_mix`
  MODIFY `id_material_mix` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `model`
--
ALTER TABLE `model`
  MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT für Tabelle `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `production`
--
ALTER TABLE `production`
  MODIFY `id_production` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `weights`
--
ALTER TABLE `weights`
  MODIFY `id_weights` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `model`
--
ALTER TABLE `model`
ADD CONSTRAINT `fk_model_production1` FOREIGN KEY (`fk_production`) REFERENCES `production` (`id_production`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_model_weights` FOREIGN KEY (`fk_weights`) REFERENCES `weights` (`id_weights`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
