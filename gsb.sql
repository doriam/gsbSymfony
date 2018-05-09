-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 06 mai 2018 à 20:36
-- Version du serveur :  5.7.19
-- Version de PHP :  7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

DROP TABLE IF EXISTS `fichefrais`;
CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  `commentaire` varchar(112) DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `idEtat` (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`, `commentaire`) VALUES
('a131', '201802', 0, '0.00', '2018-02-13', 'VA', NULL),
('A390', '201710', 0, '11345.00', '2017-10-12', 'VA', NULL),
('A390', '201711', 0, '0.00', '2017-11-15', 'CR', NULL),
('A390', '201712', 0, '0.00', '2017-11-15', 'CL', NULL),
('A390', '201802', 0, '0.00', '2018-02-13', 'VA', NULL),
('A390', '201803', 0, '0.00', '2018-03-05', 'VA', NULL),
('A390', '201804', 0, '0.00', '2018-04-26', 'CR', NULL),
('A423', '201710', 0, NULL, '2017-10-11', 'CR', NULL),
('a93', '201711', 0, '0.00', '2017-11-16', 'RB', NULL),
('A930', '201710', 0, NULL, '2017-10-11', 'VA', NULL),
('a979', '12', 0, '0.00', '2017-11-15', 'CL', NULL),
('a979', '201710', 0, '0.00', '2017-11-02', 'CR', NULL),
('a979', '201711', 0, '0.00', '2017-11-02', 'VA', NULL),
('d51', '201710', 0, '0.00', '2017-10-05', 'VA', NULL),
('e39', '201711', 0, '0.00', '2018-03-06', 'CL', NULL),
('e39', '201803', 0, '0.00', '2018-03-06', 'CR', NULL),
('e5', '201709', 0, NULL, '2017-09-28', 'RB', NULL),
('f4', '201803', 0, '26212.00', '2018-03-06', 'VA', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

DROP TABLE IF EXISTS `fraisforfait`;
CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Kilométrage', '3.00'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

DROP TABLE IF EXISTS `lignefraisforfait`;
CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  KEY `idFraisForfait` (`idFraisForfait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a131', '201802', 'ETP', 88888),
('a131', '201802', 'NUI', 0),
('a131', '201802', 'REP', 0),
('A390', '201710', 'ETP', 99),
('A390', '201710', 'NUI', 0),
('A390', '201710', 'REP', 0),
('A390', '201711', 'ETP', 5),
('A390', '201711', 'NUI', 0),
('A390', '201711', 'REP', 0),
('A390', '201802', 'ETP', 9),
('A390', '201802', 'NUI', 0),
('A390', '201802', 'REP', 0),
('A390', '201803', 'ETP', 0),
('A390', '201803', 'NUI', 0),
('A390', '201803', 'REP', 0),
('A390', '201804', 'ETP', 15),
('A390', '201804', 'KM', 515),
('A390', '201804', 'NUI', 55),
('A390', '201804', 'REP', 5),
('A423', '201710', 'ETP', 3),
('A423', '201710', 'NUI', 23),
('A423', '201710', 'REP', 1),
('a93', '201711', 'ETP', 9),
('a93', '201711', 'NUI', 0),
('a93', '201711', 'REP', 0),
('A930', '201710', 'ETP', 35),
('A930', '201710', 'NUI', 455),
('A930', '201710', 'REP', 67),
('a979', '201710', 'ETP', 0),
('a979', '201710', 'NUI', 0),
('a979', '201710', 'REP', 0),
('a979', '201711', 'ETP', 6),
('a979', '201711', 'NUI', 0),
('a979', '201711', 'REP', 0),
('d51', '201710', 'ETP', 0),
('d51', '201710', 'NUI', 0),
('d51', '201710', 'REP', 0),
('e39', '201711', 'ETP', 0),
('e39', '201711', 'NUI', 0),
('e39', '201711', 'REP', 0),
('e39', '201803', 'ETP', 12),
('e39', '201803', 'KM', 100),
('e39', '201803', 'NUI', 1),
('e39', '201803', 'REP', 12),
('e5', '201709', 'ETP', 0),
('e5', '201709', 'NUI', 45),
('e5', '201709', 'REP', 0),
('f4', '201803', 'ETP', 100),
('f4', '201803', 'KM', 102),
('f4', '201803', 'NUI', 103),
('f4', '201803', 'REP', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

DROP TABLE IF EXISTS `lignefraishorsforfait`;
CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `refuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVisiteur` (`idVisiteur`,`mois`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`, `refuser`) VALUES
(3, 'A390', '201710', 'Casque', '2017-10-10', '455.00', 0),
(5, 'A390', '201712', 'qqc', '2017-10-13', '23.00', 0),
(7, 'a979', '12', 'sushis', '2017-09-13', '90.00', 0),
(8, 'A390', '201712', 'ordi', '2017-09-20', '344.00', 0),
(9, 'A390', '201802', 'choux', '2018-01-12', '1234.00', 0),
(11, 'A390', '201802', 'RROOrr', '2018-01-23', '12.00', 0),
(12, 'A390', '201802', 'poule', '2018-01-23', '8.00', 0),
(13, 'A390', '201802', 'fleurs', '2018-01-23', '300.00', 0),
(14, 'f4', '201803', 'tacos', '2018-03-06', '20.00', 0),
(15, 'f4', '201803', 'tacos de cannabis', '2018-01-12', '12.00', 0),
(16, 'f4', '201803', 'Yolo', '2018-01-12', '21.00', 0),
(17, 'f4', '201803', 'tacos tacos', '2018-01-12', '12.00', 0),
(18, 'f4', '201803', 'tacos', '2018-01-12', '1212.00', 0),
(19, 'f4', '201803', 'Tacos tacos ', '2018-01-12', '12.00', 0),
(20, 'e39', '201803', 'Popo', '2018-01-12', '12.00', 0),
(21, 'e39', '201803', 'hey', '2018-01-12', '12.00', 0),
(22, 'A390', '201804', 'Tacos', '2018-04-10', '150.00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraiskm`
--

DROP TABLE IF EXISTS `lignefraiskm`;
CREATE TABLE IF NOT EXISTS `lignefraiskm` (
  `idVisiteur` char(4) NOT NULL DEFAULT '',
  `mois` char(6) NOT NULL DEFAULT '',
  `idPuissance` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `fk_idPuissance` (`idPuissance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraiskm`
--

INSERT INTO `lignefraiskm` (`idVisiteur`, `mois`, `idPuissance`, `quantite`) VALUES
('a131', '201802', 3, 0),
('f4', '201803', 2, 102);

-- --------------------------------------------------------

--
-- Structure de la table `puissancevehicule`
--

DROP TABLE IF EXISTS `puissancevehicule`;
CREATE TABLE IF NOT EXISTS `puissancevehicule` (
  `idPuissance` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`idPuissance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `puissancevehicule`
--

INSERT INTO `puissancevehicule` (`idPuissance`, `libelle`, `prix`) VALUES
(1, '4CV Diesel', 0.52),
(2, '5/6CV Diesel', 0.58),
(3, '4CV Essence', 0.62),
(4, '5/6CV Essence', 0.67);

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(40) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `comptable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `comptable`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', '4d186321c1a7f0f354b297e8914ab240', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 0),
('A390', 'Moreno', 'Elwan', 'elwan', '4d186321c1a7f0f354b297e8914ab240', '15 rue elwan', '90800', 'elwan', '2017-10-09', 0),
('A423', 'edo', 'edo', 'edo1', '4d186321c1a7f0f354b297e8914ab240', 'edo', 'edo', 'edo', '2017-10-16', 1),
('a488', 'Lopez', 'Leila', 'leila', '4d186321c1a7f0f354b297e8914ab240', '34 rue leila', '98000', 'Leila', '2017-10-04', 1),
('a93', 'Tusseau', 'Louis', 'ltusseau', '4d186321c1a7f0f354b297e8914ab240', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 0),
('A930', 'edo2', 'edo2', 'edo2', '4d186321c1a7f0f354b297e8914ab240', 'edo2', 'edo2', 'edo2', '2017-10-02', 0),
('a979', 'lau', 'lau', 'lau', '4d186321c1a7f0f354b297e8914ab240', 'lau', 'lau', 'lau', '2017-10-19', 0),
('a98', 'edo', 'edo', 'edo', '4d186321c1a7f0f354b297e8914ab240', 'edo', 'edo', 'edo', '2017-10-10', 1),
('AABB', 'DORIA', 'EMILIO', 'edo3', '4d186321c1a7f0f354b297e8914ab240', '16 Rue kjdshfk', '90889', 'Anthony', '2017-10-02', 1),
('d51', 'Debroise', 'Michel', 'mdebroise', '4d186321c1a7f0f354b297e8914ab240', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 0),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '4d186321c1a7f0f354b297e8914ab240', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 0),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4d186321c1a7f0f354b297e8914ab240', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 0),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '4d186321c1a7f0f354b297e8914ab240', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 0),
('e49', 'Duncombe', 'Claude', 'cduncombe', '4d186321c1a7f0f354b297e8914ab240', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 0),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', '4d186321c1a7f0f354b297e8914ab240', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
('e52', 'Eynde', 'Valérie', 'veynde', '4d186321c1a7f0f354b297e8914ab240', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 0),
('f21', 'Finck', 'Jacques', 'jfinck', '4d186321c1a7f0f354b297e8914ab240', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 0),
('f39', 'Frémont', 'Fernande', 'ffremont', '4d186321c1a7f0f354b297e8914ab240', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 0),
('f4', 'Gest', 'Alain', 'agest', '4d186321c1a7f0f354b297e8914ab240', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

--
-- Contraintes pour la table `lignefraiskm`
--
ALTER TABLE `lignefraiskm`
  ADD CONSTRAINT `fk_idPuissance` FOREIGN KEY (`idPuissance`) REFERENCES `puissancevehicule` (`idPuissance`),
  ADD CONSTRAINT `fk_idVisiteur` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
