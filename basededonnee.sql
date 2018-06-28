-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 28 juin 2018 à 17:29
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pizzaoc`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adresse`
--

CREATE TABLE `Adresse` (
  `ID` int(11) NOT NULL,
  `numero_voie` int(11) NOT NULL,
  `voie` varchar(55) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `localite` varchar(20) NOT NULL,
  `client	ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `ID` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `ID_utilisateur` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `datedecreation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Collaborateur`
--

CREATE TABLE `Collaborateur` (
  `ID_utilisateur` int(11) NOT NULL,
  `fonction` varchar(20) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `PointdeVenteid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `ID` int(11) NOT NULL,
  `moyen_paiement` varchar(40) NOT NULL,
  `date_livraison` date NOT NULL,
  `commentaire` varchar(70) NOT NULL,
  `statut_commande` varchar(20) DEFAULT NULL,
  `fin_commande` bit(1) DEFAULT NULL,
  `commande_a_livrer` bit(1) DEFAULT NULL,
  `paiement_valide` bit(1) DEFAULT NULL,
  `adresse	ID` int(11) NOT NULL,
  `utilisateurID` int(11) NOT NULL,
  `pointdeventeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Commande_Produit`
--

CREATE TABLE `Commande_Produit` (
  `commandeID` int(11) NOT NULL,
  `produitID` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `ID` int(11) NOT NULL,
  `nom_ingredient` varchar(20) NOT NULL,
  `description` varchar(70) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `produitnom_commercial` varchar(255) NOT NULL,
  `id_point_de_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `PointdeVente`
--

CREATE TABLE `PointdeVente` (
  `id` int(11) NOT NULL,
  `nompointvente` varchar(55) NOT NULL,
  `Jour_ouverture` varchar(75) DEFAULT NULL,
  `adresse	ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `ID` int(11) NOT NULL,
  `nom_commercial` varchar(55) NOT NULL,
  `prix` int(10) NOT NULL,
  `description` varchar(50) NOT NULL,
  `categorieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Produit_Ingredient`
--

CREATE TABLE `Produit_Ingredient` (
  `produitID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Stock`
--

CREATE TABLE `Stock` (
  `pointdeventeid` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `ID` int(11) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `numoro_tel` varchar(10) NOT NULL,
  `mot_de_passe` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKAdresse936541` (`client	ID`);

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`ID_utilisateur`);

--
-- Index pour la table `Collaborateur`
--
ALTER TABLE `Collaborateur`
  ADD PRIMARY KEY (`ID_utilisateur`),
  ADD KEY `FKCollaborat283714` (`PointdeVenteid`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKCommande525263` (`utilisateurID`),
  ADD KEY `FKCommande7703` (`pointdeventeid`),
  ADD KEY `FKCommande887174` (`adresse	ID`);

--
-- Index pour la table `Commande_Produit`
--
ALTER TABLE `Commande_Produit`
  ADD PRIMARY KEY (`commandeID`,`produitID`),
  ADD KEY `FKCommande_P118189` (`produitID`);

--
-- Index pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ingredient_pk` (`nom_ingredient`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`produitnom_commercial`,`id_point_de_vente`),
  ADD UNIQUE KEY `menu_pk` (`id_point_de_vente`,`produitnom_commercial`);

--
-- Index pour la table `PointdeVente`
--
ALTER TABLE `PointdeVente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKPointdeVen514415` (`adresse	ID`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `pizza_pk` (`nom_commercial`),
  ADD KEY `FKProduit634434` (`categorieID`);

--
-- Index pour la table `Produit_Ingredient`
--
ALTER TABLE `Produit_Ingredient`
  ADD PRIMARY KEY (`produitID`,`ingredientID`),
  ADD KEY `FKProduit_In301620` (`ingredientID`);

--
-- Index pour la table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`pointdeventeid`,`ingredientID`),
  ADD KEY `FKStock473058` (`ingredientID`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `PointdeVente`
--
ALTER TABLE `PointdeVente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Adresse`
--
ALTER TABLE `Adresse`
  ADD CONSTRAINT `FKAdresse936541` FOREIGN KEY (`client	ID`) REFERENCES `Client` (`ID_utilisateur`);

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `FKClient845872` FOREIGN KEY (`ID_utilisateur`) REFERENCES `Utilisateur` (`ID`);

--
-- Contraintes pour la table `Collaborateur`
--
ALTER TABLE `Collaborateur`
  ADD CONSTRAINT `FKCollaborat283714` FOREIGN KEY (`PointdeVenteid`) REFERENCES `PointdeVente` (`id`),
  ADD CONSTRAINT `FKCollaborat849527` FOREIGN KEY (`ID_utilisateur`) REFERENCES `Utilisateur` (`ID`);

--
-- Contraintes pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `FKCommande525263` FOREIGN KEY (`utilisateurID`) REFERENCES `Utilisateur` (`ID`),
  ADD CONSTRAINT `FKCommande7703` FOREIGN KEY (`pointdeventeid`) REFERENCES `PointdeVente` (`id`),
  ADD CONSTRAINT `FKCommande887174` FOREIGN KEY (`adresse	ID`) REFERENCES `Adresse` (`ID`);

--
-- Contraintes pour la table `Commande_Produit`
--
ALTER TABLE `Commande_Produit`
  ADD CONSTRAINT `FKCommande_P118189` FOREIGN KEY (`produitID`) REFERENCES `Produit` (`ID`),
  ADD CONSTRAINT `Orderline` FOREIGN KEY (`commandeID`) REFERENCES `Commande` (`ID`);

--
-- Contraintes pour la table `PointdeVente`
--
ALTER TABLE `PointdeVente`
  ADD CONSTRAINT `FKPointdeVen514415` FOREIGN KEY (`adresse	ID`) REFERENCES `Adresse` (`ID`);

--
-- Contraintes pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `FKProduit634434` FOREIGN KEY (`categorieID`) REFERENCES `Categorie` (`ID`);

--
-- Contraintes pour la table `Produit_Ingredient`
--
ALTER TABLE `Produit_Ingredient`
  ADD CONSTRAINT `FKProduit_In26681` FOREIGN KEY (`produitID`) REFERENCES `Produit` (`ID`),
  ADD CONSTRAINT `FKProduit_In301620` FOREIGN KEY (`ingredientID`) REFERENCES `Ingredient` (`ID`);

--
-- Contraintes pour la table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `FKStock473058` FOREIGN KEY (`ingredientID`) REFERENCES `Ingredient` (`ID`),
  ADD CONSTRAINT `Stock` FOREIGN KEY (`pointdeventeid`) REFERENCES `PointdeVente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
