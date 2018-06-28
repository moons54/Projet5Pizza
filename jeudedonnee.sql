-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 28 juin 2018 à 14:54
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

--
-- Déchargement des données de la table `Adresse`
--

INSERT INTO `Adresse` (`ID`, `numero_voie`, `voie`, `code_postal`, `localite`, `client	ID`) VALUES
(1, 23, 'rue des bosquets', '30000', 'Nimes', 1),
(2, 12, 'av jean jaures', '30000', 'Nimes', 2),
(3, 23, 'rue des tilleuls', '30000', 'Nimes', 3),
(4, 65, 'av de breteuils', '30000', 'Nimes', 3),
(5, 512, 'Av des etats unis', '30000', 'Nimes', 2),
(6, 94, 'Av kennedy', '30012', 'Nimes', 1);

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`ID`, `nom`) VALUES
(1, 'pizza'),
(2, 'dessert'),
(3, 'boisson');

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`ID_utilisateur`, `email`, `datedecreation`) VALUES
(1, 'remieli.rer@huu.fr', '2018-02-12'),
(2, 'ui.ret@gmail.com', '2018-01-11'),
(3, 'calm.sel@gmail.com', '2017-02-22');

--
-- Déchargement des données de la table `Collaborateur`
--

INSERT INTO `Collaborateur` (`ID_utilisateur`, `fonction`, `nom`, `PointdeVenteid`) VALUES
(1, 'preparateur', 'alfonso', 1),
(2, 'vendeur', 'borini', 2),
(3, 'alicia', 'marty', 3),
(4, 'vendeur', 'sanchez', 2),
(5, 'livreur', 'da silva', 1),
(6, 'preparateur', 'durand', 2),
(7, 'vendeur', 'meurice', 1),
(8, 'vendeur', 'sabatier', 3);

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`ID`, `moyen_paiement`, `date_livraison`, `commentaire`, `statut_commande`, `fin_commande`, `commande_a_livrer`, `paiement_valide`, `adresse	ID`, `utilisateurID`, `pointdeventeid`) VALUES
(1, 'cartebancaire', '2018-01-01', 'deux portail avec code 2343 pour premier portail', 'fin', b'1', b'1', b'1', 1, 1, 1),
(2, 'espece', '2018-06-22', 'livraison apres portail rouge', 'en cours', b'0', b'1', b'1', 2, 2, 2),
(3, 'cb', '2018-06-21', 'ras', 'fin', b'1', b'1', b'1', 3, 3, 3),
(4, 'tiquet restaurant', '2018-06-17', 'verification ticket resto', 'en cours', b'0', b'0', b'1', 4, 4, 1);

--
-- Déchargement des données de la table `Commande_Produit`
--

INSERT INTO `Commande_Produit` (`commandeID`, `produitID`, `quantite`) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 6, 2),
(2, 10, 3),
(3, 2, 1),
(4, 5, 2),
(4, 9, 4);

--
-- Déchargement des données de la table `Ingredient`
--

INSERT INTO `Ingredient` (`ID`, `nom_ingredient`, `description`, `prix`, `unit`) VALUES
(1, 'mozarella', 'bonne qualite', 4, 3),
(2, 'gruyere', 'distri 1', 2, 5),
(3, 'oeufs', 'taille calibre 2 ', 3, 4),
(4, 'pate fine', 'commandé le jeudi et livré le lundi matin a partir de 10 H', 3, 3),
(6, 'creme fraiche', 'semi epaisse 40 % de mg', 1, 2),
(7, 'sucre', 'sucre cristalin', 2, 2),
(8, 'farine', 'semi epaisse', 2, 4),
(10, 'orange', 'taille medium bio', 3, 1),
(11, 'agrume', 'categorie II ', 2, 3),
(12, 'soda', '', 3, 1),
(13, 'eau ', 'minérale', 2, 1),
(14, 'chorizo', 'a conserver entre 1 et 4 degres', 2, 2),
(15, 'cafe', 'moulu', 2, 3),
(16, 'chocolat en poudre', '70 % de chocolat noir', 3, 3),
(17, 'menthe', 'produit frais ', 2, 4),
(18, 'glacon', 'pour preparation cocktail', 33, 2),
(19, 'mascarpone', NULL, 12, 12);

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`produitnom_commercial`, `id_point_de_vente`) VALUES
('pizza margherita', 1),
('pizza margherita', 2),
('pizza margherita', 3),
('pizza regina', 1),
('pizza regina', 2),
('pizza regina', 3),
('pizza reine', 1),
('pizza reine', 2),
('pizza reine', 3);

--
-- Déchargement des données de la table `PointdeVente`
--

INSERT INTO `PointdeVente` (`id`, `nompointvente`, `Jour_ouverture`, `adresse	ID`) VALUES
(1, 'OC PIZZA NIMES CENTRE', 'de 11 h 30 à 14 H et de 19 H à 21 H 30', 6),
(2, 'OC PIZZA GAMBETTA', 'de 11 h 30 à 14 H et de 19 H à 21 H 30', 5),
(3, 'OC PIZZA JEAN JAURES', 'de 11 h 30 à 14 H et de 19 H à 21 H 30', 4);

--
-- Déchargement des données de la table `Produit`
--

INSERT INTO `Produit` (`ID`, `nom_commercial`, `prix`, `description`, `categorieID`) VALUES
(1, 'pizza regina', 12, 'pizza taille 40 cm avec supplement olive', 1),
(2, 'pizza reine', 15, 'pizza ', 1),
(3, 'pizza forestiere', 12, 'champignon', 1),
(4, 'pizza margherita', 10, 'la moins chere', 1),
(5, 'cocktail virgin mojito', 5, 'sans alcool', 3),
(6, 'cocktail virgin agrume', 5, 'sans alcool', 3),
(7, 'tiramitsu', 6, 'a base de café', 2),
(8, 'tarte au citron', 5, 'produit frais', 2),
(9, 'cheesecake', 5, 'fait maison', 2),
(10, 'eau minéral', 2, 'eaut badoit', 3);

--
-- Déchargement des données de la table `Produit_Ingredient`
--

INSERT INTO `Produit_Ingredient` (`produitID`, `ingredientID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(5, 12),
(5, 15),
(5, 18),
(6, 11),
(6, 12),
(6, 18),
(7, 3),
(7, 7),
(7, 8),
(7, 13),
(7, 15),
(8, 7),
(8, 19),
(9, 4),
(9, 6),
(9, 19),
(10, 13);

--
-- Déchargement des données de la table `Stock`
--

INSERT INTO `Stock` (`pointdeventeid`, `ingredientID`, `quantite`) VALUES
(1, 1, 43),
(1, 2, 43),
(1, 3, 43),
(1, 4, 55),
(1, 6, 12),
(1, 8, 23),
(1, 10, 23),
(1, 11, 32),
(1, 12, 23),
(1, 13, 32),
(1, 14, 55),
(1, 15, 882),
(1, 16, 33),
(1, 17, 23),
(1, 18, 21),
(1, 19, 21),
(2, 1, 76),
(2, 2, 77),
(2, 3, 455),
(2, 4, 55),
(2, 7, 22),
(2, 8, 12),
(2, 10, 43),
(2, 11, 24),
(2, 12, 11),
(2, 13, 33),
(2, 14, 25),
(2, 16, 22),
(2, 17, 21),
(2, 18, 64),
(2, 19, 21),
(3, 1, 66),
(3, 2, 776),
(3, 3, 55),
(3, 4, 45),
(3, 7, 24),
(3, 8, 23),
(3, 10, 5),
(3, 11, 62),
(3, 12, 82),
(3, 13, 23),
(3, 14, 72),
(3, 16, 55),
(3, 17, 11),
(3, 18, 22),
(3, 19, 112);

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`ID`, `prenom`, `nom`, `numoro_tel`, `mot_de_passe`) VALUES
(1, 'didirert', 'Robert', '543543543', 'GREGRE'),
(2, 'alain', 'Bernardi', '483828342', 'E21E212'),
(3, 'xavier', 'Silviani', '456436546', 'O323'),
(4, 'raphael', 'ceccaldi', '043422113', 'SIDSDL'),
(5, 'eric', 'petitgenet', '043433113', 'leire'),
(6, 'francois', 'servano', '043493513', 'ino'),
(7, 'severine', 'francois', '043196113', 'retrte'),
(8, 'bernard', 'Rodrigue', '043244552', 'roro1224'),
(9, 'alain', 'canal', '042312345', 'alain4353');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
