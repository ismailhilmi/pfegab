-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 18 mai 2020 à 05:38
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gab`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

CREATE TABLE `absence` (
  `id` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `crn_horaire` varchar(255) NOT NULL,
  `type_absence` varchar(255) NOT NULL,
  `is_old` tinyint(1) NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `professeur` int(11) DEFAULT NULL,
  `date_absence` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`id`, `id_etudiant`, `crn_horaire`, `type_absence`, `is_old`, `module`, `professeur`, `date_absence`) VALUES
(30, 1, '8-10', 'Absence non-justifiée', 0, 'LES TECHNOLOGIES DU WEB II : Côté serveur ', 18, '2020-05-15'),
(31, 4, '10-12', 'Absence justifiée', 0, 'ADMINISTRATION DES SYSTEMES', 18, '2020-05-15'),
(32, 4, '17-19', 'Absence non-justifiée', 0, 'STRUCTURES DE DONNEES ET\r\nPROGRAMMATION AVANCEE', 23, '2020-05-15'),
(33, 5, '17-19', 'Absence non-justifiée', 0, 'LES TECHNOLOGIES DU WEB II : Côté serveur ', 23, '2020-05-15'),
(34, 1, '8-10', 'Absence non-justifiée', 0, 'LES SYSTEMES D\'INFORMATION ', 23, '2020-05-17');

-- --------------------------------------------------------

--
-- Structure de la table `element_module`
--

CREATE TABLE `element_module` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `proportion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `element_module`
--

INSERT INTO `element_module` (`id`, `module`, `intitule`, `proportion`) VALUES
(1, 1, 'Algèbre', '');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `cin` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `cne` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` text NOT NULL,
  `lieu_naissance` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `id_user`, `cin`, `nom`, `cne`, `prenom`, `date_naissance`, `adresse`, `lieu_naissance`, `telephone`, `email`) VALUES
(1, 19, 'EE12345', 'AFELLA', 'G126478399', 'Hamza', '1999-05-11', '19, ENNASSIM AGADIR', 'CASABLANCA', '056730331', 'AFELLA@gmail.com'),
(2, 20, 'EH637892', 'AHLYEL', 'G2539736', 'Amine', '1999-04-11', 'BENNI MELLAL ,MAROC', 'BENI MELLAL', '0673849202', 'AHLYEL@gmail.com'),
(3, 21, 'EG536729', 'AIT BABRIK', 'G27690028', 'Fatima-ezzahra', '1999-09-12', 'ASFI,Maroc', 'ASFI', '068737929', 'aitbabrik@gmail.com'),
(4, 25, 'EE62425', 'HILMI', 'G139652570', 'Ismail', '2000-02-11', 'AZLI', 'MARRAKECH', '0654965110', 'ismailhilmi01@gmail.com'),
(5, 26, 'EE75894', 'ELOUAJI', 'G14356789', 'Soukaina', '1999-05-11', 'SIDI YOUSSEF BEN ALI', 'MARRAKECH', '0687293752', 'soukaina@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `nom_module` varchar(255) NOT NULL,
  `nature` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `nom_module`, `nature`) VALUES
(2, 'LES TECHNOLOGIES DU WEB II : Côté serveur ', 'Module scientifique et technique'),
(3, 'ADMINISTRATION DES SYSTEMES', 'Module scientifique et technique'),
(4, 'STRUCTURES DE DONNEES ET\r\nPROGRAMMATION AVANCEE', 'Module scientifique et technique'),
(5, 'PROGRAMMATION ORIENTEE OBJET ET\r\nPROGRAMMATION ORIENTEE OBJET ET\r\nEVENEMENTIELLE \r\n', 'Module scientifique et technique'),
(6, 'LES SYSTEMES D\'INFORMATION ', 'Module scientifique et technique');

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE `prof` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` text DEFAULT NULL,
  `fname` text DEFAULT NULL,
  `lname` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id`, `username`, `email`, `fname`, `lname`, `country`, `password`) VALUES
(1, 'dmitra', 'mitradibaakr@yandex,com', 'Dibakar', '', 'India', '12345678');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `som` int(7) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `id_user`, `som`, `nom`, `prenom`, `email`, `telephone`) VALUES
(7, 18, 1111111, 'LAANAOUI', 'Molay Driss', 'mld@gmail.com', '083773737'),
(8, 22, 1111111, 'ZAHID', 'Noureddine', 'noureddinezahid@yahoo.fr', '0617289191'),
(9, 23, 1111111, 'ZAKARIA', 'Abdelatif', 'zakaria0606@hotmail.com', '0673625142'),
(10, 24, 1111111, 'AIT OUNNEJAT', 'Lhoucaine', 'laitounejjar@uca.ma', '0678961754');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT 'etudiant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `type`) VALUES
(1, 'admin', 'password', 'admin'),
(8, 'etudiant', 'password', 'etudiant'),
(19, 'AFELLA', '123', 'etudiant'),
(20, 'AHLYEL', '123', 'etudiant'),
(21, 'AIT BABRIK', '123', 'etudiant'),
(22, 'ZAHID', '123', 'professeur'),
(23, 'ZAKARIA', '123', 'professeur'),
(25, 'HILMI', '123', 'etudiant'),
(26, 'ELOUAJI', '123', 'etudiant');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Index pour la table `element_module`
--
ALTER TABLE `element_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `element_module`
--
ALTER TABLE `element_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `prof`
--
ALTER TABLE `prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
