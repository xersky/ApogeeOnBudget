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
('GIAP1', '1??re ann??e au cycle pr??paratoire'),
('GIAP2', '2??re ann??e au cycle pr??paratoire'),
('GIBT3', '3??me ann??e G??nie Civil'),
('GICL1', '1??re ann??e Supply Chain Management'),
('GICL2', '2??me ann??e Supply Chain Management'),
('GICL3', '3??me ann??e Supply Chain Management'),
('GIGC1', '1??re ann??e G??nie Civil'),
('GIGC2', '2??me ann??e G??nie Civil'),
('GIGI1', '1??re ann??e G??nie Informatique'),
('GIGI2', '2??me ann??e G??nie Informatique'),
('GIGM1', '1??re ann??e G??nie M??catronique'),
('GIGM2', '2??me ann??e G??nie M??catronique'),
('GIGM3', '3??me ann??e G??nie M??catronique'),
('GISI3', '3??me ann??e G??nie Informatique'),
('GITR1', '1??re ann??e G??nie des Syst??mes de T??l??communications et R??seaux'),
('GITR2', '2??me ann??e G??nie des Syst??mes de T??l??communications et R??seaux'),
('GITR3', '3??me ann??e G??nie des Syst??mes de T??l??communications et R??seaux');

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
(1, 'Alg??bre 1', 'GIAP1'),
(2, 'Analyse 1', 'GIAP1'),
(3, 'Physique 1', 'GIAP1'),
(4, 'M??canique 1', 'GIAP1'),
(5, 'Info 1', 'GIAP1'),
(6, 'LC 1', 'GIAP1'),
(7, 'Alg??bre 2', 'GIAP1'),
(8, 'Analyse 2', 'GIAP1'),
(9, 'Physique 2', 'GIAP1'),
(10, 'Chimie', 'GIAP1'),
(11, 'MAO', 'GIAP1'),
(12, 'LC 2', 'GIAP1'),
(13, 'Alg??bre 3', 'GIAP2'),
(14, 'Analyse 3', 'GIAP2'),
(15, 'Electronique', 'GIAP2'),
(16, 'M??canique 2', 'GIAP2'),
(17, 'Info 2', 'GIAP2'),
(18, 'LC 3', 'GIAP2'),
(19, 'Analyse 4', 'GIAP2'),
(20, 'Maths Appliqu??es', 'GIAP2'),
(21, 'Physique 4', 'GIAP2'),
(22, 'Physique 3', 'GIAP2'),
(23, 'Management', 'GIAP2'),
(24, 'LC 4', 'GIAP2'),
(25, 'Proba. Stat et Stoch', 'GICL1'),
(26, 'Base de donn??es relationnelles', 'GICL1'),
(27, 'R??seaux Info 1', 'GICL1'),
(28, 'RO & Theorie de graphe', 'GICL1'),
(29, 'Management 1', 'GICL1'),
(30, 'Langues &TEC', 'GICL1'),
(31, 'Gestion des Stocks & management des entrep??ts', 'GICL1'),
(32, 'Mod??lisation & Evaluation De Perfomances', 'GICL1'),
(33, 'Management de Qualit??', 'GICL1'),
(34, 'Gestion de Production', 'GICL1'),
(35, 'Technique D\'Achat & R??duction de couts', 'GICL1'),
(36, 'Optimisation Combinatoire', 'GICL1'),
(37, 'Mod??lisation & Poo', 'GICL2'),
(38, 'Admin & Optimisation de BD', 'GICL2'),
(39, 'Management de la chaine logistique', 'GICL2'),
(40, 'Suret?? Fonctionnement & Gestion Maintenance', 'GICL2'),
(41, 'Simulation des Syst??mes Industriels', 'GICL2'),
(42, 'Langues &TEC 2', 'GICL2'),
(43, 'Technologie de l\'entreprise', 'GICL2'),
(44, 'Ordonnancement de production', 'GICL2'),
(45, 'Exploration & Analyse de donn??es', 'GICL2'),
(46, 'Analyse fonctionnelle & analyse de la valeur', 'GICL2'),
(47, 'Management 2', 'GICL2'),
(48, 'Th??orie de la D??cision GSI', 'GICL2'),
(49, 'logistique de distribution', 'GICL3'),
(50, 'SI en SCM', 'GICL3'),
(51, 'Excellence Industrielle', 'GICL3'),
(52, 'Logistique PFA', 'GICL3'),
(53, 'Management 3', 'GICL3'),
(54, 'Langues &TEC 3', 'GICL3'),
(55, 'Proba. Stat et Stoch', 'GIGC1'),
(56, 'M??caniques des milieux d??formables', 'GIGC1'),
(57, 'R??seaux Info 1', 'GIGC1'),
(58, 'RO & Theorie de graphe', 'GIGC1'),
(59, 'Management 1', 'GIGC1'),
(60, 'LC', 'GIGC1'),
(61, 'Topographie SIG & T??l??detection', 'GIGC1'),
(62, 'R??sistance des mat??riaux', 'GIGC1'),
(63, 'Notions d\'architecture & Lecture des plans et m??tr??', 'GIGC1'),
(64, 'Am??nagement t??rritoire & Urbanisme', 'GIGC1'),
(65, 'M??canique des fluides', 'GIGC1'),
(66, 'G??otechnique 1', 'GIGC1'),
(67, 'G??ologie de l\'ing??nieur', 'GIGC1'),
(68, 'Math & M??thodes Num??riques', 'GIGC2'),
(69, 'R??sistance des Mat??riaux 2 & Plasticit?? des poutres', 'GIGC2'),
(70, 'Mat de construction', 'GIGC2'),
(71, 'M??canique des sols', 'GIGC2'),
(72, 'G??otechnique 2', 'GIGC2'),
(73, 'Lg & Com 2', 'GIGC2'),
(74, 'Hydrologie&hydrog??ologie', 'GIGC2'),
(75, 'B??ton arm??', 'GIGC2'),
(76, 'Construction m??talique', 'GIGC2'),
(77, 'Routes', 'GIGC2'),
(78, 'Calcul des structures', 'GIGC2'),
(79, 'Hydraulique Urbaine', 'GIGC2'),
(80, 'Management 2', 'GIGC2'),
(81, 'B??ton pr??contraint', 'GIBT3'),
(82, 'Dynamique des structure & g??nie parasismique', 'GIBT3'),
(83, 'constructiion durable & efficacit?? ??nerg??tique', 'GIBT3'),
(84, 'Th??rmique et acoustique du batiment', 'GIBT3'),
(85, 'Conduite de projet BTP', 'GIBT3'),
(86, 'Management 3', 'GIBT3'),
(87, 'Com 3', 'GIBT3'),
(88, 'Proba. Stat et Stoch', 'GIGI1'),
(89, 'Base de donn??es relationnelles', 'GIGI1'),
(90, 'R??seaux Info 1', 'GIGI1'),
(91, 'RO & Theorie de graphe', 'GIGI1'),
(92, 'Management 1', 'GIGI1'),
(93, 'Lg & Com 1', 'GIGI1'),
(94, 'Prog. C Avanc??e & Complexit??', 'GIGI1'),
(95, 'Electro. Num??rique', 'GIGI1'),
(96, 'Th??orie de Langages & Compilation', 'GIGI1'),
(97, 'Prog. Web1', 'GIGI1'),
(98, 'Syst??mes D\'Exploitation', 'GIGI1'),
(99, 'Architecture des ordinateurs et Assembleur', 'GIGI1'),
(100, 'Mod??lisation & Poo', 'GIGI2'),
(101, 'Admin & optimisation BD', 'GIGI2'),
(102, 'R??seaux info 2', 'GIGI2'),
(103, 'M??thodologies & g??nie logiciel', 'GIGI2'),
(104, 'Vision artificielle', 'GIGI2'),
(105, 'Lg & Com 2', 'GIGI2'),
(106, 'Java Avanc??', 'GIGI2'),
(107, 'BD Relationnelle Objet & R??partie', 'GIGI2'),
(108, 'Intelligence Artificielle', 'GIGI2'),
(109, 'Prog. R??seaux & S??curit?? Informatique', 'GIGI2'),
(110, 'Prog. Web 2', 'GIGI2'),
(111, 'Management 2', 'GIGI2'),
(112, 'Sys. d\'int??gration & progiciel', 'GISI3'),
(113, 'Business Intelligence', 'GISI3'),
(114, 'Urb des SI', 'GISI3'),
(115, 'Prog. des syst??mes', 'GISI3'),
(116, 'Management 3', 'GISI3'),
(117, 'Tech DotNet', 'GISI3'),
(118, 'Lg & Com 3', 'GISI3'),
(119, 'Proba. Stat et Stoch', 'GIGM1'),
(120, 'Base de donn??es relationnelles', 'GIGM1'),
(121, 'R??seaux Info 1', 'GIGM1'),
(122, 'RO & Theorie de graphe', 'GIGM1'),
(123, 'Management 1', 'GIGM1'),
(124, 'LC', 'GIGM1'),
(125, 'Electronique 1', 'GIGM1'),
(126, 'Automatique 1', 'GIGM1'),
(127, 'M??canique', 'GIGM1'),
(128, 'R??seaux Electriques & Signaux', 'GIGM1'),
(129, 'Energ??tique & M??canique des fluides', 'GIGM1'),
(130, 'Propri??t?? M??canique & R??sistance mat??riaux', 'GIGM1'),
(131, 'Mod??lisation & Poo', 'GIGM1'),
(132, 'Math& M??thodes Num??riques', 'GIGM2'),
(133, 'fabrication M??canique et productique', 'GIGM2'),
(134, 'Th??orie et analyse des M??canismes et robotique', 'GIGM2'),
(135, 'Automatique 2', 'GIGM2'),
(136, 'Electronique 2', 'GIGM2'),
(137, 'Electrotech et Electro de puissance', 'GIGM2'),
(138, 'Lg et Tec', 'GIGM2'),
(139, 'Automatisation & Instrmentation', 'GIGM2'),
(140, 'Actionneurs', 'GIGM2'),
(141, 'Electronique Embarqu??e', 'GIGM2'),
(142, 'Technologie de Automobile', 'GIGM2'),
(143, 'Conception des Machines', 'GIGM2'),
(144, 'Management 2', 'GIGM2'),
(145, 'Sys M??catroniques', 'GIGM3'),
(146, 'Supervision & R??seaux', 'GIGM3'),
(147, 'Sys Embarqu??', 'GIGM3'),
(148, 'Qualit?? et Maintenance', 'GIGM3'),
(149, 'Gestion de production', 'GIGM3'),
(150, 'Management 3', 'GIGM3'),
(151, 'Projet stage & Coaching', 'GIGM3'),
(152, 'Com 3', 'GIGM3'),
(153, 'Proba. Stat et Stoch', 'GITR1'),
(154, 'Base de donn??es relationnelles', 'GITR1'),
(155, 'R??seaux Info 1', 'GITR1'),
(156, 'RO & Theorie de graphe', 'GITR1'),
(157, 'Management 1', 'GITR1'),
(158, 'LC', 'GITR1'),
(159, 'Electronique Num??rique', 'GITR1'),
(160, 'R??seaux de transport', 'GITR1'),
(161, 'Mod??lisation & Poo', 'GITR1'),
(162, 'Ing??nierie Hyperfr??quence', 'GITR1'),
(163, 'Electronique et Modulation?? analogique', 'GITR1'),
(164, 'Traitement de Signal', 'GITR1'),
(165, 'Communications Num??riques', 'GITR2'),
(166, 'R??seaux Info 2', 'GITR2'),
(167, 'R??seaux Cellulaires', 'GITR2'),
(168, 'Propagation radio', 'GITR2'),
(169, 'Trait. signal & Modulation num??rique', 'GITR2'),
(170, 'Langues &TEC', 'GITR2'),
(171, 'Antennes', 'GITR2'),
(172, 'C# & BD relationnelle Objet', 'GITR2'),
(173, 'Syst??me embarqu?? & temps r??el 1', 'GITR2'),
(174, 'Traitement de l\'image et de la parole', 'GITR2'),
(175, 'Syst??mes r??partis et S??curit?? r??seaux 1', 'GITR2'),
(176, 'Informatique Industrielle', 'GITR2'),
(177, 'Management 2', 'GITR2'),
(178, 'Ing??nierie Spatiale', 'GITR3'),
(179, 'Sys de communication num??rique avanc??', 'GITR3'),
(180, 'S??curit?? r??seaux 2', 'GITR3'),
(181, 'Sys Embarqu??s 2 & Java mobile', 'GITR3'),
(182, 'Management 3', 'GITR3'),
(183, 'Com 3', 'GITR3'),
(184, 'R??seaux mobile et sans fil', 'GITR3');

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
(1, 'ABTOY', 'ANOUAR', 'anouar.abtoy@gmail.com', 'G??nie Informatique'),
(2, 'AGHZOUT', 'OTMAN', 'o.aghzout@gmail.com', 'G??nie Informatique'),
(3, 'AL ACHHAB', 'MOHAMMED', 'alachhab@gmail.com', 'G??nie Informatique'),
(4, 'ARIOUA', 'MOUNIR', 'arioua_mounir@yahoo.fr', 'G??nie Informatique'),
(5, 'BESRI', 'ZINEB', 'z.besri@gmail.com', 'G??nie Informatique'),
(6, 'CHKOURI', 'MOHAMED', 'YASSINyassin.chkouri@gmail.com', 'G??nie Informatique'),
(7, 'CHRAYAH', 'MOHAMED', 'chrayah@gmail.com', 'G??nie Informatique'),
(8, 'BENTAJER', 'AHMED', 'bentajer@outlook.com', 'G??nie Informatique'),
(9, 'EL BOUHDIDI', 'JABER', 'jaber.f15@gmail.com', 'G??nie Informatique'),
(10, 'EL HAJJAMI', 'OUSSAMA', 'oelhajjamy@uae.ac.ma', 'G??nie Informatique'),
(11, 'EL KHAMLICHI', 'YASSER', 'yasser.khamlichi@gmail.com', 'G??nie Informatique'),
(12, 'EL YOUNOUSSI', 'YACINE', 'yacine.info@gmail.com', 'G??nie Informatique'),
(13, 'EL JOURANI', 'REDA', 'reda.jourani@yahoo.fr', 'G??nie Informatique'),
(14, 'LAJJAM', 'AZZA', 'azza.lajjam@gmail.com', 'G??nie Informatique'),
(15, 'MESMOUDI', 'YASSER', 'mesmoudi.yasser@gmail.com', 'G??nie Informatique'),
(16, 'TAHIRI', 'ABDERRAHIM', 'abderahim.tahiri@gmail.com', 'G??nie Informatique'),
(17, 'MALLA HUSSEIN', 'Sawsan', 'sawsanmalla@gmail.com', 'Humanit??s'),
(18, 'NA??R', 'Nadia', 'nadianair2@yahoo.fr', 'Humanit??s'),
(19, 'LAIMOUNA', 'Bahija', 'b-laimouna@hotmail.fr', 'Humanit??s'),
(20, 'BELMIRI', 'brahim', 'ibelmir@uae.ac.ma', 'Humanit??s'),
(21, 'RGUIG', 'Sara', 'saraa_1@hotmail.com', 'Humanit??s'),
(22, 'ARIF', 'Jabir', 'arif.jabir@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(23, 'BENBOUBKER', 'Mohamed Badr', 'simo.ben@hotmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(24, 'CHERKAOUI', 'Mohamed', 'cherkaoui66@hotmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(25, 'DKHISSI', 'Btissam', 'dkissi_btissam@yahoo.fr', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(26, 'EL BIARI', 'Aouatef', 'elbiariaouatef@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(27, 'EL FALLAHI', 'Abdellah', 'aelfallahi@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(28, 'LAJJAM', 'Azza', 'azza.lajjam@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(29, 'OUAKKASSE', 'Noureddine', 'nourddineouakkasse@yahoo.fr', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(30, 'SARRIR', 'Hicham', 'leagility.sce@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(31, 'SEGHIOUER', 'Hamid', 'hamid.seghiouer@gmail.com', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
(32, 'ZLAIJI', 'Loubna', 'l.zlaiji@yahoo.fr', 'Sciences Math??matiques et Aide ?? la D??cision (SMAD)'),
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
