-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 31 mars 2023 à 19:05
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pompdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `qteGalDiesel` float DEFAULT NULL,
  `qteGalGasoline` float DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `etat` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `qteGalDiesel`, `qteGalGasoline`, `dateCommande`, `etat`) VALUES
(1, 6, 3, '2023-03-29', 'N'),
(423366605, 3, 4, '2023-03-29', 'N');

-- --------------------------------------------------------

--
-- Structure de la table `stations`
--

CREATE TABLE `stations` (
  `nom` varchar(255) NOT NULL,
  `capacite_gasoline` float DEFAULT NULL,
  `capacite_diesel` float DEFAULT NULL,
  `qte_gal_gasoline` float DEFAULT NULL,
  `qte_gal_diesel` float DEFAULT NULL,
  `pourcentage_util_gasoline` float DEFAULT NULL,
  `pourcentage_util_diesel` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stations`
--

INSERT INTO `stations` (`nom`, `capacite_gasoline`, `capacite_diesel`, `qte_gal_gasoline`, `qte_gal_diesel`, `pourcentage_util_gasoline`, `pourcentage_util_diesel`) VALUES
('Lalue', 5000, 4000, 5000, 4000, 1, 1),
('Mirbalais', 7000, 4000, 7000, 3000, 1, 1),
('Petion vile', 2000, 1000, 2000, 1000, 1, 1),
('tabarre', 56, 900, 5, NULL, 67, 78);

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

CREATE TABLE `ventes` (
  `id` int(11) NOT NULL,
  `station` varchar(255) DEFAULT NULL,
  `qte_gal_gasoil` float DEFAULT NULL,
  `qte_gal_diesel` float DEFAULT NULL,
  `date_vente` date DEFAULT NULL,
  `montant_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ventes`
--

INSERT INTO `ventes` (`id`, `station`, `qte_gal_gasoil`, `qte_gal_diesel`, `date_vente`, `montant_total`) VALUES
(5, 'Lalue', 20, 20, '2023-03-30', 40),
(6, 'Lalue', 20, 20, '2023-03-30', 40);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `station` (`station`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423366606;

--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`station`) REFERENCES `stations` (`nom`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
