-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2026 alle 23:13
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casaautomobilistica`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `accessorio`
--

CREATE TABLE `accessorio` (
  `CodiceArticolo` int(11) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `CostoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `accessorio`
--

INSERT INTO `accessorio` (`CodiceArticolo`, `Descrizione`, `CostoUnitario`) VALUES
(301, 'Tappetini in gomma', 25.00),
(302, 'Portapacchi da tetto', 150.00),
(303, 'Profumatore per auto', 5.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `autoveicolo`
--

CREATE TABLE `autoveicolo` (
  `Targa` varchar(20) NOT NULL,
  `Ntelaio` varchar(50) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `Annocostruzione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Codice` int(11) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendente`
--

CREATE TABLE `dipendente` (
  `ID_utente` int(50) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `OTP` varchar(50) DEFAULT NULL,
  `isAbilitato` tinyint(1) NOT NULL DEFAULT 0,
  `Ruolo` varchar(20) NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `dipendente`
--

INSERT INTO `dipendente` (`ID_utente`, `Username`, `Password`, `email`, `OTP`, `isAbilitato`, `Ruolo`) VALUES
(1, '', 'ddd', '', NULL, 0, 'admin'),
(2, 'dasdsada', 'dasdasdasda', '', NULL, 0, 'dipendente'),
(3, 'dasds', 'dasdada', 'adasdas', NULL, 0, 'dipendente'),
(4, 'prese', 'oommagad', 'odddd', '36850590', 0, 'dipendente');

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento`
--

CREATE TABLE `intervento` (
  `Codice` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Ore` int(11) DEFAULT NULL,
  `CodiceOfficina` int(11) DEFAULT NULL,
  `TargaAutoveicolo` varchar(20) DEFAULT NULL,
  `CodiceCliente` int(11) DEFAULT NULL,
  `CodiceTipoIntervento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento_comprende_servizio`
--

CREATE TABLE `intervento_comprende_servizio` (
  `CodiceIntervento` int(11) NOT NULL,
  `CodiceServizio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento_usa_accessorio`
--

CREATE TABLE `intervento_usa_accessorio` (
  `CodiceIntervento` int(11) NOT NULL,
  `CodiceArticolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento_utilizza_ricambio`
--

CREATE TABLE `intervento_utilizza_ricambio` (
  `CodiceIntervento` int(11) NOT NULL,
  `CodicePezzo` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `officina`
--

CREATE TABLE `officina` (
  `Codice` int(11) NOT NULL,
  `Denominazione` varchar(255) NOT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `officina`
--

INSERT INTO `officina` (`Codice`, `Denominazione`, `Indirizzo`) VALUES
(1, 'Autofficina Roma', 'Via Roma 10, Milano'),
(2, 'Garage Centrale', 'Piazza Garibaldi 5, Torino'),
(3, 'Motori & Co.', 'Via Napoli 20, Roma');

-- --------------------------------------------------------

--
-- Struttura della tabella `officina_offre_servizio`
--

CREATE TABLE `officina_offre_servizio` (
  `CodiceOfficina` int(11) NOT NULL,
  `CodiceServizio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `officina_offre_servizio`
--

INSERT INTO `officina_offre_servizio` (`CodiceOfficina`, `CodiceServizio`) VALUES
(1, 101),
(1, 102),
(2, 101),
(2, 103),
(3, 102);

-- --------------------------------------------------------

--
-- Struttura della tabella `officina_presente_accessorio`
--

CREATE TABLE `officina_presente_accessorio` (
  `CodiceOfficina` int(11) NOT NULL,
  `CodiceArticolo` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `officina_presente_accessorio`
--

INSERT INTO `officina_presente_accessorio` (`CodiceOfficina`, `CodiceArticolo`, `Quantita`) VALUES
(1, 301, 20),
(2, 302, 3),
(3, 301, 10),
(3, 303, 50);

-- --------------------------------------------------------

--
-- Struttura della tabella `officina_presente_ricambio`
--

CREATE TABLE `officina_presente_ricambio` (
  `CodiceOfficina` int(11) NOT NULL,
  `CodicePezzo` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `officina_presente_ricambio`
--

INSERT INTO `officina_presente_ricambio` (`CodiceOfficina`, `CodicePezzo`, `Quantita`) VALUES
(1, 201, 10),
(1, 202, 5),
(2, 202, 8),
(2, 203, 2),
(3, 201, 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `pezzo_ricambio`
--

CREATE TABLE `pezzo_ricambio` (
  `CodicePezzo` int(11) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `CostoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `pezzo_ricambio`
--

INSERT INTO `pezzo_ricambio` (`CodicePezzo`, `Descrizione`, `CostoUnitario`) VALUES
(201, 'Filtro Olio', 15.00),
(202, 'Pastiglie Freni', 45.00),
(203, 'Cinghia di Distribuzione', 120.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio`
--

CREATE TABLE `servizio` (
  `Codice` int(11) NOT NULL,
  `CostoOrario` decimal(10,2) DEFAULT NULL,
  `Descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `servizio`
--

INSERT INTO `servizio` (`Codice`, `CostoOrario`, `Descrizione`) VALUES
(101, 40.00, 'Tagliando base'),
(102, 55.50, 'Riparazione motore'),
(103, 35.00, 'Sostituzione gomme');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo_intervento`
--

CREATE TABLE `tipo_intervento` (
  `Codice` int(11) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `accessorio`
--
ALTER TABLE `accessorio`
  ADD PRIMARY KEY (`CodiceArticolo`);

--
-- Indici per le tabelle `autoveicolo`
--
ALTER TABLE `autoveicolo`
  ADD PRIMARY KEY (`Targa`),
  ADD UNIQUE KEY `Ntelaio` (`Ntelaio`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `dipendente`
--
ALTER TABLE `dipendente`
  ADD PRIMARY KEY (`ID_utente`);

--
-- Indici per le tabelle `intervento`
--
ALTER TABLE `intervento`
  ADD PRIMARY KEY (`Codice`),
  ADD KEY `CodiceOfficina` (`CodiceOfficina`),
  ADD KEY `TargaAutoveicolo` (`TargaAutoveicolo`),
  ADD KEY `CodiceCliente` (`CodiceCliente`),
  ADD KEY `CodiceTipoIntervento` (`CodiceTipoIntervento`);

--
-- Indici per le tabelle `intervento_comprende_servizio`
--
ALTER TABLE `intervento_comprende_servizio`
  ADD PRIMARY KEY (`CodiceIntervento`,`CodiceServizio`),
  ADD KEY `CodiceServizio` (`CodiceServizio`);

--
-- Indici per le tabelle `intervento_usa_accessorio`
--
ALTER TABLE `intervento_usa_accessorio`
  ADD PRIMARY KEY (`CodiceIntervento`,`CodiceArticolo`),
  ADD KEY `CodiceArticolo` (`CodiceArticolo`);

--
-- Indici per le tabelle `intervento_utilizza_ricambio`
--
ALTER TABLE `intervento_utilizza_ricambio`
  ADD PRIMARY KEY (`CodiceIntervento`,`CodicePezzo`),
  ADD KEY `CodicePezzo` (`CodicePezzo`);

--
-- Indici per le tabelle `officina`
--
ALTER TABLE `officina`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `officina_offre_servizio`
--
ALTER TABLE `officina_offre_servizio`
  ADD PRIMARY KEY (`CodiceOfficina`,`CodiceServizio`),
  ADD KEY `CodiceServizio` (`CodiceServizio`);

--
-- Indici per le tabelle `officina_presente_accessorio`
--
ALTER TABLE `officina_presente_accessorio`
  ADD PRIMARY KEY (`CodiceOfficina`,`CodiceArticolo`),
  ADD KEY `CodiceArticolo` (`CodiceArticolo`);

--
-- Indici per le tabelle `officina_presente_ricambio`
--
ALTER TABLE `officina_presente_ricambio`
  ADD PRIMARY KEY (`CodiceOfficina`,`CodicePezzo`),
  ADD KEY `CodicePezzo` (`CodicePezzo`);

--
-- Indici per le tabelle `pezzo_ricambio`
--
ALTER TABLE `pezzo_ricambio`
  ADD PRIMARY KEY (`CodicePezzo`);

--
-- Indici per le tabelle `servizio`
--
ALTER TABLE `servizio`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `tipo_intervento`
--
ALTER TABLE `tipo_intervento`
  ADD PRIMARY KEY (`Codice`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `dipendente`
--
ALTER TABLE `dipendente`
  MODIFY `ID_utente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `intervento`
--
ALTER TABLE `intervento`
  ADD CONSTRAINT `intervento_ibfk_1` FOREIGN KEY (`CodiceOfficina`) REFERENCES `officina` (`Codice`),
  ADD CONSTRAINT `intervento_ibfk_2` FOREIGN KEY (`TargaAutoveicolo`) REFERENCES `autoveicolo` (`Targa`),
  ADD CONSTRAINT `intervento_ibfk_3` FOREIGN KEY (`CodiceCliente`) REFERENCES `cliente` (`Codice`),
  ADD CONSTRAINT `intervento_ibfk_4` FOREIGN KEY (`CodiceTipoIntervento`) REFERENCES `tipo_intervento` (`Codice`);

--
-- Limiti per la tabella `intervento_comprende_servizio`
--
ALTER TABLE `intervento_comprende_servizio`
  ADD CONSTRAINT `intervento_comprende_servizio_ibfk_1` FOREIGN KEY (`CodiceIntervento`) REFERENCES `intervento` (`Codice`),
  ADD CONSTRAINT `intervento_comprende_servizio_ibfk_2` FOREIGN KEY (`CodiceServizio`) REFERENCES `servizio` (`Codice`);

--
-- Limiti per la tabella `intervento_usa_accessorio`
--
ALTER TABLE `intervento_usa_accessorio`
  ADD CONSTRAINT `intervento_usa_accessorio_ibfk_1` FOREIGN KEY (`CodiceIntervento`) REFERENCES `intervento` (`Codice`),
  ADD CONSTRAINT `intervento_usa_accessorio_ibfk_2` FOREIGN KEY (`CodiceArticolo`) REFERENCES `accessorio` (`CodiceArticolo`);

--
-- Limiti per la tabella `intervento_utilizza_ricambio`
--
ALTER TABLE `intervento_utilizza_ricambio`
  ADD CONSTRAINT `intervento_utilizza_ricambio_ibfk_1` FOREIGN KEY (`CodiceIntervento`) REFERENCES `intervento` (`Codice`),
  ADD CONSTRAINT `intervento_utilizza_ricambio_ibfk_2` FOREIGN KEY (`CodicePezzo`) REFERENCES `pezzo_ricambio` (`CodicePezzo`);

--
-- Limiti per la tabella `officina_offre_servizio`
--
ALTER TABLE `officina_offre_servizio`
  ADD CONSTRAINT `officina_offre_servizio_ibfk_1` FOREIGN KEY (`CodiceOfficina`) REFERENCES `officina` (`Codice`),
  ADD CONSTRAINT `officina_offre_servizio_ibfk_2` FOREIGN KEY (`CodiceServizio`) REFERENCES `servizio` (`Codice`);

--
-- Limiti per la tabella `officina_presente_accessorio`
--
ALTER TABLE `officina_presente_accessorio`
  ADD CONSTRAINT `officina_presente_accessorio_ibfk_1` FOREIGN KEY (`CodiceOfficina`) REFERENCES `officina` (`Codice`),
  ADD CONSTRAINT `officina_presente_accessorio_ibfk_2` FOREIGN KEY (`CodiceArticolo`) REFERENCES `accessorio` (`CodiceArticolo`);

--
-- Limiti per la tabella `officina_presente_ricambio`
--
ALTER TABLE `officina_presente_ricambio`
  ADD CONSTRAINT `officina_presente_ricambio_ibfk_1` FOREIGN KEY (`CodiceOfficina`) REFERENCES `officina` (`Codice`),
  ADD CONSTRAINT `officina_presente_ricambio_ibfk_2` FOREIGN KEY (`CodicePezzo`) REFERENCES `pezzo_ricambio` (`CodicePezzo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
