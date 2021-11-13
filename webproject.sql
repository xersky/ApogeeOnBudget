-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2020 at 08:18 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
CREATE TABLE IF NOT EXISTS `auth` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `USER` varchar(15) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`ID`, `USER`, `PASSWORD`) VALUES
(1, 'admin', '@bigchungus@');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `N_SALLE` varchar(5) NOT NULL,
  `ID_PROF` int(6) NOT NULL,
  `ID_MODULE` int(11) NOT NULL,
  `DATE` varchar(20) NOT NULL,
  `DUREE` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `N_SALLE_2` (`N_SALLE`,`ID_PROF`,`DATE`),
  KEY `FK_exammodule` (`ID_MODULE`) USING BTREE,
  KEY `N_SALLE` (`N_SALLE`),
  KEY `exam_ibfk_1` (`ID_PROF`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`ID`, `N_SALLE`, `ID_PROF`, `ID_MODULE`, `DATE`, `DUREE`) VALUES
(53, '001', 1, 1, '2020-06-22T14:00', '1h30min'),
(54, '001', 2, 1, '2020-06-22T14:00', '1h30min'),
(55, '002', 18, 2, '2020-06-22T14:00', '1h30min'),
(56, '002', 13, 97, '2020-06-23T15:30', '2h'),
(57, '006', 6, 5, '2020-06-24T16:00', '1h30min'),
(59, 'AMPHI', 25, 39, '2020-06-24T10:00', '1h30min'),
(60, '102', 48, 13, '2020-06-21T14:30', '1h30min'),
(61, 'AMPHI', 10, 9, '2020-06-30T16:00', '1h30min'),
(62, '101', 9, 53, '2020-07-29T16:00', '02h30min');

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
CREATE TABLE IF NOT EXISTS `filiere` (
  `ID` varchar(10) NOT NULL,
  `NOM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`ID`, `NOM`) VALUES
('GIAP1', '1ère année au cycle préparatoire'),
('GIAP2', '2ère année au cycle préparatoire'),
('GIBT3', '3ème année Génie Civil'),
('GICL1', '1ère année Supply Chain Management'),
('GICL2', '2ème année Supply Chain Management'),
('GICL3', '3ème année Supply Chain Management'),
('GIGC1', '1ère année Génie Civil'),
('GIGC2', '2ème année Génie Civil'),
('GIGI1', '1ère année Génie Informatique'),
('GIGI2', '2ème année Génie Informatique'),
('GIGM1', '1ère année Génie Mécatronique'),
('GIGM2', '2ème année Génie Mécatronique'),
('GIGM3', '3ème année Génie Mécatronique'),
('GISI3', '3ème année Génie Informatique'),
('GITR1', '1ère année Génie des Systèmes de Télécommunications et Réseaux'),
('GITR2', '2ème année Génie des Systèmes de Télécommunications et Réseaux'),
('GITR3', '3ème année Génie des Systèmes de Télécommunications et Réseaux');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(64) NOT NULL,
  `ID_FILIERE` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `module_ibfk_1` (`ID_FILIERE`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ID`, `NOM`, `ID_FILIERE`) VALUES
(1, 'Algèbre 1', 'GIAP1'),
(2, 'Analyse 1', 'GIAP1'),
(3, 'Physique 1', 'GIAP1'),
(4, 'Mécanique 1', 'GIAP1'),
(5, 'Info 1', 'GIAP1'),
(6, 'LC 1', 'GIAP1'),
(7, 'Algèbre 2', 'GIAP1'),
(8, 'Analyse 2', 'GIAP1'),
(9, 'Physique 2', 'GIAP1'),
(10, 'Chimie', 'GIAP1'),
(11, 'MAO', 'GIAP1'),
(12, 'LC 2', 'GIAP1'),
(13, 'Algèbre 3', 'GIAP2'),
(14, 'Analyse 3', 'GIAP2'),
(15, 'Electronique', 'GIAP2'),
(16, 'Mécanique 2', 'GIAP2'),
(17, 'Info 2', 'GIAP2'),
(18, 'LC 3', 'GIAP2'),
(19, 'Analyse 4', 'GIAP2'),
(20, 'Maths Appliquées', 'GIAP2'),
(21, 'Physique 4', 'GIAP2'),
(22, 'Physique 3', 'GIAP2'),
(23, 'Management', 'GIAP2'),
(24, 'LC 4', 'GIAP2'),
(25, 'Proba. Stat et Stoch', 'GICL1'),
(26, 'Base de données relationnelles', 'GICL1'),
(27, 'Réseaux Info 1', 'GICL1'),
(28, 'RO & Theorie de graphe', 'GICL1'),
(29, 'Management 1', 'GICL1'),
(30, 'Langues &TEC', 'GICL1'),
(31, 'Gestion des Stocks & management des entrepôts', 'GICL1'),
(32, 'Modélisation & Evaluation De Perfomances', 'GICL1'),
(33, 'Management de Qualité', 'GICL1'),
(34, 'Gestion de Production', 'GICL1'),
(35, 'Technique D\'Achat & Réduction de couts', 'GICL1'),
(36, 'Optimisation Combinatoire', 'GICL1'),
(37, 'Modélisation & Poo', 'GICL2'),
(38, 'Admin & Optimisation de BD', 'GICL2'),
(39, 'Management de la chaine logistique', 'GICL2'),
(40, 'Sureté Fonctionnement & Gestion Maintenance', 'GICL2'),
(41, 'Simulation des Systèmes Industriels', 'GICL2'),
(42, 'Langues &TEC 2', 'GICL2'),
(43, 'Technologie de l\'entreprise', 'GICL2'),
(44, 'Ordonnancement de production', 'GICL2'),
(45, 'Exploration & Analyse de données', 'GICL2'),
(46, 'Analyse fonctionnelle & analyse de la valeur', 'GICL2'),
(47, 'Management 2', 'GICL2'),
(48, 'Théorie de la Décision GSI', 'GICL2'),
(49, 'logistique de distribution', 'GICL3'),
(50, 'SI en SCM', 'GICL3'),
(51, 'Excellence Industrielle', 'GICL3'),
(52, 'Logistique PFA', 'GICL3'),
(53, 'Management 3', 'GICL3'),
(54, 'Langues &TEC 3', 'GICL3'),
(55, 'Proba. Stat et Stoch', 'GIGC1'),
(56, 'Mécaniques des milieux déformables', 'GIGC1'),
(57, 'Réseaux Info 1', 'GIGC1'),
(58, 'RO & Theorie de graphe', 'GIGC1'),
(59, 'Management 1', 'GIGC1'),
(60, 'LC', 'GIGC1'),
(61, 'Topographie SIG & Télédetection', 'GIGC1'),
(62, 'Résistance des matériaux', 'GIGC1'),
(63, 'Notions d\'architecture & Lecture des plans et métré', 'GIGC1'),
(64, 'Aménagement térritoire & Urbanisme', 'GIGC1'),
(65, 'Mécanique des fluides', 'GIGC1'),
(66, 'Géotechnique 1', 'GIGC1'),
(67, 'Géologie de l\'ingénieur', 'GIGC1'),
(68, 'Math & Méthodes Numériques', 'GIGC2'),
(69, 'Résistance des Matériaux 2 & Plasticité des poutres', 'GIGC2'),
(70, 'Mat de construction', 'GIGC2'),
(71, 'Mécanique des sols', 'GIGC2'),
(72, 'Géotechnique 2', 'GIGC2'),
(73, 'Lg & Com 2', 'GIGC2'),
(74, 'Hydrologie&hydrogéologie', 'GIGC2'),
(75, 'Béton armé', 'GIGC2'),
(76, 'Construction métalique', 'GIGC2'),
(77, 'Routes', 'GIGC2'),
(78, 'Calcul des structures', 'GIGC2'),
(79, 'Hydraulique Urbaine', 'GIGC2'),
(80, 'Management 2', 'GIGC2'),
(81, 'Béton précontraint', 'GIBT3'),
(82, 'Dynamique des structure & génie parasismique', 'GIBT3'),
(83, 'constructiion durable & efficacité énergétique', 'GIBT3'),
(84, 'Thérmique et acoustique du batiment', 'GIBT3'),
(85, 'Conduite de projet BTP', 'GIBT3'),
(86, 'Management 3', 'GIBT3'),
(87, 'Com 3', 'GIBT3'),
(88, 'Proba. Stat et Stoch', 'GIGI1'),
(89, 'Base de données relationnelles', 'GIGI1'),
(90, 'Réseaux Info 1', 'GIGI1'),
(91, 'RO & Theorie de graphe', 'GIGI1'),
(92, 'Management 1', 'GIGI1'),
(93, 'Lg & Com 1', 'GIGI1'),
(94, 'Prog. C Avancée & Complexité', 'GIGI1'),
(95, 'Electro. Numérique', 'GIGI1'),
(96, 'Théorie de Langages & Compilation', 'GIGI1'),
(97, 'Prog. Web1', 'GIGI1'),
(98, 'Systèmes D\'Exploitation', 'GIGI1'),
(99, 'Architecture des ordinateurs et Assembleur', 'GIGI1'),
(100, 'Modélisation & Poo', 'GIGI2'),
(101, 'Admin & optimisation BD', 'GIGI2'),
(102, 'Réseaux info 2', 'GIGI2'),
(103, 'Méthodologies & génie logiciel', 'GIGI2'),
(104, 'Vision artificielle', 'GIGI2'),
(105, 'Lg & Com 2', 'GIGI2'),
(106, 'Java Avancé', 'GIGI2'),
(107, 'BD Relationnelle Objet & Répartie', 'GIGI2'),
(108, 'Intelligence Artificielle', 'GIGI2'),
(109, 'Prog. Réseaux & Sécurité Informatique', 'GIGI2'),
(110, 'Prog. Web 2', 'GIGI2'),
(111, 'Management 2', 'GIGI2'),
(112, 'Sys. d\'intégration & progiciel', 'GISI3'),
(113, 'Business Intelligence', 'GISI3'),
(114, 'Urb des SI', 'GISI3'),
(115, 'Prog. des systèmes', 'GISI3'),
(116, 'Management 3', 'GISI3'),
(117, 'Tech DotNet', 'GISI3'),
(118, 'Lg & Com 3', 'GISI3'),
(119, 'Proba. Stat et Stoch', 'GIGM1'),
(120, 'Base de données relationnelles', 'GIGM1'),
(121, 'Réseaux Info 1', 'GIGM1'),
(122, 'RO & Theorie de graphe', 'GIGM1'),
(123, 'Management 1', 'GIGM1'),
(124, 'LC', 'GIGM1'),
(125, 'Electronique 1', 'GIGM1'),
(126, 'Automatique 1', 'GIGM1'),
(127, 'Mécanique', 'GIGM1'),
(128, 'Réseaux Electriques & Signaux', 'GIGM1'),
(129, 'Energétique & Mécanique des fluides', 'GIGM1'),
(130, 'Propriété Mécanique & Résistance matériaux', 'GIGM1'),
(131, 'Modélisation & Poo', 'GIGM1'),
(132, 'Math& Méthodes Numériques', 'GIGM2'),
(133, 'fabrication Mécanique et productique', 'GIGM2'),
(134, 'Théorie et analyse des Mécanismes et robotique', 'GIGM2'),
(135, 'Automatique 2', 'GIGM2'),
(136, 'Electronique 2', 'GIGM2'),
(137, 'Electrotech et Electro de puissance', 'GIGM2'),
(138, 'Lg et Tec', 'GIGM2'),
(139, 'Automatisation & Instrmentation', 'GIGM2'),
(140, 'Actionneurs', 'GIGM2'),
(141, 'Electronique Embarquée', 'GIGM2'),
(142, 'Technologie de Automobile', 'GIGM2'),
(143, 'Conception des Machines', 'GIGM2'),
(144, 'Management 2', 'GIGM2'),
(145, 'Sys Mécatroniques', 'GIGM3'),
(146, 'Supervision & Réseaux', 'GIGM3'),
(147, 'Sys Embarqué', 'GIGM3'),
(148, 'Qualité et Maintenance', 'GIGM3'),
(149, 'Gestion de production', 'GIGM3'),
(150, 'Management 3', 'GIGM3'),
(151, 'Projet stage & Coaching', 'GIGM3'),
(152, 'Com 3', 'GIGM3'),
(153, 'Proba. Stat et Stoch', 'GITR1'),
(154, 'Base de données relationnelles', 'GITR1'),
(155, 'Réseaux Info 1', 'GITR1'),
(156, 'RO & Theorie de graphe', 'GITR1'),
(157, 'Management 1', 'GITR1'),
(158, 'LC', 'GITR1'),
(159, 'Electronique Numérique', 'GITR1'),
(160, 'Réseaux de transport', 'GITR1'),
(161, 'Modélisation & Poo', 'GITR1'),
(162, 'Ingénierie Hyperfréquence', 'GITR1'),
(163, 'Electronique et Modulation  analogique', 'GITR1'),
(164, 'Traitement de Signal', 'GITR1'),
(165, 'Communications Numériques', 'GITR2'),
(166, 'Réseaux Info 2', 'GITR2'),
(167, 'Réseaux Cellulaires', 'GITR2'),
(168, 'Propagation radio', 'GITR2'),
(169, 'Trait. signal & Modulation numérique', 'GITR2'),
(170, 'Langues &TEC', 'GITR2'),
(171, 'Antennes', 'GITR2'),
(172, 'C# & BD relationnelle Objet', 'GITR2'),
(173, 'Système embarqué & temps réel 1', 'GITR2'),
(174, 'Traitement de l\'image et de la parole', 'GITR2'),
(175, 'Systèmes répartis et Sécurité réseaux 1', 'GITR2'),
(176, 'Informatique Industrielle', 'GITR2'),
(177, 'Management 2', 'GITR2'),
(178, 'Ingénierie Spatiale', 'GITR3'),
(179, 'Sys de communication numérique avancé', 'GITR3'),
(180, 'Sécurité réseaux 2', 'GITR3'),
(181, 'Sys Embarqués 2 & Java mobile', 'GITR3'),
(182, 'Management 3', 'GITR3'),
(183, 'Com 3', 'GITR3'),
(184, 'Réseaux mobile et sans fil', 'GITR3');

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) NOT NULL,
  `PRENOM` varchar(20) NOT NULL,
  `EMAIL` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DEPARTEMENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`ID`, `NOM`, `PRENOM`, `EMAIL`, `DEPARTEMENT`) VALUES
(1, 'ABTOY', 'ANOUAR', 'anouar.abtoy@gmail.com', 'Génie Informatique'),
(2, 'AGHZOUT', 'OTMAN', 'o.aghzout@gmail.com', 'Génie Informatique'),
(3, 'AL ACHHAB', 'MOHAMMED', 'alachhab@gmail.com', 'Génie Informatique'),
(4, 'ARIOUA', 'MOUNIR', 'arioua_mounir@yahoo.fr', 'Génie Informatique'),
(5, 'BESRI', 'ZINEB', 'z.besri@gmail.com', 'Génie Informatique'),
(6, 'CHKOURI', 'MOHAMED', 'YASSINyassin.chkouri@gmail.com', 'Génie Informatique'),
(7, 'CHRAYAH', 'MOHAMED', 'chrayah@gmail.com', 'Génie Informatique'),
(8, 'BENTAJER', 'AHMED', 'bentajer@outlook.com', 'Génie Informatique'),
(9, 'EL BOUHDIDI', 'JABER', 'jaber.f15@gmail.com', 'Génie Informatique'),
(10, 'EL HAJJAMI', 'OUSSAMA', 'oelhajjamy@uae.ac.ma', 'Génie Informatique'),
(11, 'EL KHAMLICHI', 'YASSER', 'yasser.khamlichi@gmail.com', 'Génie Informatique'),
(12, 'EL YOUNOUSSI', 'YACINE', 'yacine.info@gmail.com', 'Génie Informatique'),
(13, 'EL JOURANI', 'REDA', 'reda.jourani@yahoo.fr', 'Génie Informatique'),
(14, 'LAJJAM', 'AZZA', 'azza.lajjam@gmail.com', 'Génie Informatique'),
(15, 'MESMOUDI', 'YASSER', 'mesmoudi.yasser@gmail.com', 'Génie Informatique'),
(16, 'TAHIRI', 'ABDERRAHIM', 'abderahim.tahiri@gmail.com', 'Génie Informatique'),
(17, 'MALLA HUSSEIN', 'Sawsan', 'sawsanmalla@gmail.com', 'Humanités'),
(18, 'NAÏR', 'Nadia', 'nadianair2@yahoo.fr', 'Humanités'),
(19, 'LAIMOUNA', 'Bahija', 'b-laimouna@hotmail.fr', 'Humanités'),
(20, 'BELMIRI', 'brahim', 'ibelmir@uae.ac.ma', 'Humanités'),
(21, 'RGUIG', 'Sara', 'saraa_1@hotmail.com', 'Humanités'),
(22, 'ARIF', 'Jabir', 'arif.jabir@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(23, 'BENBOUBKER', 'Mohamed Badr', 'simo.ben@hotmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(24, 'CHERKAOUI', 'Mohamed', 'cherkaoui66@hotmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(25, 'DKHISSI', 'Btissam', 'dkissi_btissam@yahoo.fr', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(26, 'EL BIARI', 'Aouatef', 'elbiariaouatef@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(27, 'EL FALLAHI', 'Abdellah', 'aelfallahi@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(28, 'LAJJAM', 'Azza', 'azza.lajjam@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(29, 'OUAKKASSE', 'Noureddine', 'nourddineouakkasse@yahoo.fr', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(30, 'SARRIR', 'Hicham', 'leagility.sce@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(31, 'SEGHIOUER', 'Hamid', 'hamid.seghiouer@gmail.com', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(32, 'ZLAIJI', 'Loubna', 'l.zlaiji@yahoo.fr', 'Sciences Mathématiques et Aide à la Décision (SMAD)'),
(33, 'ACHEGAF', 'Zineb', 'achegaf.zineb@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(34, 'ATTAJKANI', 'Sabri', 'sabri.attajkani@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(35, 'BANNOUR', 'Abdelilah', 'a.bannour@uae.ac.ma', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(36, 'BOUNAB', 'Loubna', 'bounabensa@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(37, 'EL KHANNOUSSI', 'Fadoua', 'fadoua.elkhannoussi@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(38, 'EL YAMOUNI', 'Bouraida', 'bouraida@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(39, 'HADDI', 'Ali', 'haddi.ensat@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(40, 'HAJAJI', 'Anas', 'hajaji.anas@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(41, 'KHAMLICHI', 'Abdellatif', 'akhamlichi@uae.ac.ma', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(42, 'MAHBOUB', 'Oussama', 'mahbouboussama@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(43, 'MEDOURI', 'Abdellatif', 'amedouri@uae.ac.ma', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(44, 'NASRI', 'Khalid', 'khalid.nasri@uae.ac.ma', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(45, 'Oulad BENZAROUALA', 'Rachad', 'rachad.oulad@gmail.com', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(46, 'SANBI', 'Mustapha', 'mustapha_sanbi@yahoo.fr', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(47, 'ZAKRITI', 'Alia', 'alia_zakriti@yahoo.ft', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(48, 'El-Bakari', 'Abdelali', 'ab_elbakari@yahoo.fr', 'Sciences et Technologies Industrielles et Civiles (STIC)'),
(49, 'El ADIB', 'Samir', 'adibsamir@gmail.com', 'TELCOM'),
(50, 'KHOULJI', 'Samira', 'khouljisamira@gmail.com', 'TELCOM'),
(51, 'RAISSOUNI', 'Naoufal', 'naoufal.raissouni.ensa@gmail.com', 'TELCOM'),
(52, 'AYTOUNA', 'Fouad', 'aytouna2002@gmail.com', 'TELCOM'),
(53, 'BOULJRAF', 'Mohamed', 'mohamed.bolajraf@gmail.com', 'TELCOM');

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `N` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DISPONIBILITE` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`N`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`N`, `DISPONIBILITE`) VALUES
('001', 1),
('002', 1),
('003', 1),
('004', 1),
('005', 1),
('006', 1),
('101', 1),
('102', 1),
('103', 1),
('104', 1),
('105', 1),
('106', 1),
('201', 1),
('202', 1),
('203', 1),
('204', 1),
('205', 1),
('206', 1),
('AMPHI', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`ID_PROF`) REFERENCES `professeur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`N_SALLE`) REFERENCES `salle` (`N`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_ibfk_3` FOREIGN KEY (`ID_MODULE`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`ID_FILIERE`) REFERENCES `filiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
