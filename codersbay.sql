-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:26
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `codersbay`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address_list`
--

CREATE TABLE `address_list` (
  `address_id` int(11) NOT NULL,
  `personal_id` int(11) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `addition` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `administration`
--

CREATE TABLE `administration` (
  `personal_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `employment` varchar(32) DEFAULT NULL,
  `bank_information` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_allo_id` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `duration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `day_course` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_allocation`
--

CREATE TABLE `course_allocation` (
  `course_allo_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_group`
--

CREATE TABLE `course_group` (
  `group_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `main_instructor` int(11) DEFAULT NULL,
  `group_name` varchar(32) DEFAULT NULL,
  `num_of_participants` int(11) DEFAULT NULL,
  `course_start` date DEFAULT NULL,
  `course_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equipment`
--

CREATE TABLE `equipment` (
  `serial_number` varchar(32) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loanlist`
--

CREATE TABLE `loanlist` (
  `loan_id` int(11) NOT NULL,
  `serial_number` varchar(32) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE `participant` (
  `personal_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `sub_allo_id` int(11) DEFAULT NULL,
  `course_allo_id` int(11) DEFAULT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  `designation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_allocation`
--

CREATE TABLE `subject_allocation` (
  `sub_allo_id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `timetable`
--

CREATE TABLE `timetable` (
  `timetable_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL,
  `week_day` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trainer`
--

CREATE TABLE `trainer` (
  `personal_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `sub_allo_id` int(11) DEFAULT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  `is_main_instructor` tinyint(1) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `employment` varchar(32) DEFAULT NULL,
  `bank_information` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address_list`
--
ALTER TABLE `address_list`
  ADD PRIMARY KEY (`address_id`);

--
-- Indizes für die Tabelle `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indizes für die Tabelle `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_allo_id` (`course_allo_id`);

--
-- Indizes für die Tabelle `course_allocation`
--
ALTER TABLE `course_allocation`
  ADD PRIMARY KEY (`course_allo_id`);

--
-- Indizes für die Tabelle `course_group`
--
ALTER TABLE `course_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `main_instructor` (`main_instructor`);

--
-- Indizes für die Tabelle `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`serial_number`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indizes für die Tabelle `loanlist`
--
ALTER TABLE `loanlist`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indizes für die Tabelle `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `sub_allo_id` (`sub_allo_id`),
  ADD KEY `course_allo_id` (`course_allo_id`),
  ADD KEY `timetable_id` (`timetable_id`);

--
-- Indizes für die Tabelle `subject_allocation`
--
ALTER TABLE `subject_allocation`
  ADD PRIMARY KEY (`sub_allo_id`);

--
-- Indizes für die Tabelle `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`timetable_id`);

--
-- Indizes für die Tabelle `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `sub_allo_id` (`sub_allo_id`),
  ADD KEY `timetable_id` (`timetable_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `administration`
--
ALTER TABLE `administration`
  ADD CONSTRAINT `administration_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address_list` (`address_id`);

--
-- Constraints der Tabelle `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`course_allo_id`) REFERENCES `course_allocation` (`course_allo_id`);

--
-- Constraints der Tabelle `course_group`
--
ALTER TABLE `course_group`
  ADD CONSTRAINT `course_group_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_group_ibfk_2` FOREIGN KEY (`main_instructor`) REFERENCES `trainer` (`personal_id`);

--
-- Constraints der Tabelle `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loanlist` (`loan_id`);

--
-- Constraints der Tabelle `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address_list` (`address_id`),
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `course_group` (`group_id`),
  ADD CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`loan_id`) REFERENCES `loanlist` (`loan_id`);

--
-- Constraints der Tabelle `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`sub_allo_id`) REFERENCES `subject_allocation` (`sub_allo_id`),
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`course_allo_id`) REFERENCES `course_allocation` (`course_allo_id`),
  ADD CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`);

--
-- Constraints der Tabelle `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address_list` (`address_id`),
  ADD CONSTRAINT `trainer_ibfk_2` FOREIGN KEY (`sub_allo_id`) REFERENCES `subject_allocation` (`sub_allo_id`),
  ADD CONSTRAINT `trainer_ibfk_3` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
